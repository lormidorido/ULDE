package ULDE::Utilities;

# This class only contains methods aimed at bridging the gap between completed and uncompleted aspects of ULDE

use Moose;
use Moose::Util::TypeConstraints;
use namespace::autoclean;
use ULDE::Component::Template;
use ULDE::Component::LegalCategory;
use ULDE::Component::LegalSubCategory;
use ULDE::Component::ForeignAccount;
use ULDE::Component::Account::Customer;
use ULDE::Component::Template;
use ULDE::Interface::DocumentAssembler;
use ULDE::Component::Template::Instance;
use List::Util qw(first);
use Data::Dumper;

extends 'ULDE';

class_type 'ULDE::Interface::DocumentAssembler';

# not needed anymore. is now a class attribute in ULDE base class
# has assembler 	=> (is => 'ro', isa => 'ULDE::Interface::DocumentAssembler', lazy_build => 1); 

sub _build_assembler {
	my $self = shift;

	ULDE::Interface::DocumentAssembler->new;
}

# move/update account from ELE
sub migrate_update_account {
# 0: ele_client_id
# 1: associate_id || undef

	my $self = shift;

	my $foreign_account = ULDE::Component::ForeignAccount->new({ foreign_account_id => $_[0]});

	unless ($foreign_account->count) {
		$self->assembler->get_account_password($_[0],1);
		my $login_details = $self->assembler->response;

		$self->assembler->get_account_details($_[0]);

		my $account = ULDE::Component::Account::Customer->new({ id => 0, service_definition => 4, business_name => $self->assembler->response->{biz_name} || undef,
								customers => {
									first_name 	=> $self->assembler->response->{first_name},
									surname 		=> $self->assembler->response->{surname},
									user_name 	=> $login_details->{user_name},
									password 		=> $login_details->{password},
									dob 				=> $self->assembler->response->{dob} || undef,
									roles				=> [4],
									addresses 	=> [{
										line_1 		=> $self->assembler->response->{address},
										postcode 	=> $self->assembler->response->{postcode},
										country 	=> 409
									}]
								},
								foreign_accounts => {
									date_created 				=> $self->assembler->response->{date_registered} . ' ' . $self->assembler->response->{time_registered},
									foreign_user_name 	=> $login_details->{user_name},
									foreign_password 		=> $login_details->{password},
									foreign_provider		=> 1,
									foreign_account_id 	=> $_[0],
								}
 		});

 		$foreign_account->search({ foreign_account_id => $_[0] });
	}

	$self->assembler->get_client_documents([$foreign_account->foreign_user_name, $foreign_account->foreign_password]);

	my $template = ULDE::Component::Template->new;
	foreach (@{$self->assembler->response->{docs}}) {
#		next if $_->{state} eq 'completed';

		$template->search({ name => $_->{name} });
		next unless $template->count;


		if (my $product = first { !$_->is_pack } @{$template->product}) {

			my $template_instance = ULDE::Component::Template::Instance->new({ foreign_id => $_->{doc_id} });
			next if $template_instance->count;

			$foreign_account->account->create({ product_instances => {
					product 						=> $product->id,
					service_definition 	=> 4,
					service_level 			=> 2,
					added 							=> $_->{date_created} || 'now()',
					status							=> $_->{state} eq 'completed' ? 4 : $_->{state} eq 'trial' ? 1 : 2,
					associate 					=> $_[1] || undef,
					template_instances 	=> {
						template 		=> $template->id,
						created 		=> $_->{date_created}  || 'now()',
						foreign_id 		=> $_->{doc_id},
						status 			=> $_->{state} eq 'completed' ? 4 : $_->{state} eq 'review' ? 3 : 2,
						customer 		=> $foreign_account->account->customer->[0]->id # assume one customer per account for now
					}
				}
			});

			(first { grep { $_->{foreign_id} == $_->{doc_id} } @{$_->template_instance} } @{$foreign_account->account->product})->create({ event_logs => { 
						event_id 	=> 1,
						detail 		=> 'completed',
						timestamp => $_->{date_completed}
				}}) if $_->{date_completed};

			(first { grep { $_->{foreign_id} == $_->{doc_id} } @{$_->template_instance} } @{$foreign_account->account->product})->template_instance->[0]->create({ event_logs => { 
						event_id 	=> 1,
						detail 		=> $_->{date_completed} ? '4' : '3',
						timestamp => $_->{date_completed} || $_->{date_review}
				}}) if $_->{date_completed} || $_->{date_review};
		}
	}
}

# get product definitions - ELE defines whilst not part of ULDE
sub extract_products {
	my $self = shift;
	my $i = 0; # for debugging

	$self->assembler->get_products;

	my @products = @{$self->assembler->response->{products}};
	foreach my $product (@products) {
		my $p = ULDE::Component::Product->new;

#		next unless $product->{library} eq 'Business Law' || $product->{library} eq 'Wills & Probate';
		next unless $product->{library} eq 'Employment, Health & Safety';
		$self->assembler->get_product_info($product->{id});
		my $product_descr = $self->assembler->response->{description};
		my %template_ids;
		foreach my $template (@{$product->{templates}}) {

			my $t = ULDE::Component::Template->new;
			unless ($t->search({foreign_id => $template->{id}})->count) {
				my $template_details = first { $_->{id} == $template->{id} } @products;

				$self->assembler->get_template_info($template_details->{id}) if $product->{type} eq 'pack';
				my $template_descr = $product->{type} eq 'pack' ? $self->assembler->response->{description} : $product_descr;


				my $legal_area = $self->_add_retrieve_legal_area($template_details->{library});
				$t->create({
					name 												=> $template_details->{name},
					description 								=> $template_descr,
					foreign_id 									=> $template_details->{id},
					document_assembly_provider 	=> 1,
					area 												=> $legal_area->id,
					category 										=> $self->_add_retrieve_legal_category($template_details->{category})->id,
					sub_category 								=> $template_details->{sub_category} ? $self->_add_retrieve_legal_sub_category($template_details->{sub_category})->id : undef,
					personal 										=> $legal_area->name =~ /Business|Employment/ ? 0 : 1,
					business 										=> $legal_area->name =~ /Business|Employment/ ? 1 : 0
				});
			}
			$template_ids{$t->id}++;
		}

		my $legal_area_p = $self->_add_retrieve_legal_area($product->{library});

		$p->create({
			name 								=> $product->{name},
			description 				=> $product_descr,
			legal_area 					=> $legal_area_p->id,
			category 						=> $self->_add_retrieve_legal_category($product->{category})->id,
			sub_category 				=> $product->{sub_category} ? $self->_add_retrieve_legal_sub_category($product->{sub_category})->id : undef,
			personal 						=> $legal_area_p->name =~ /Business|Employment/ ? 0 : 1,
			business 			 			=> $legal_area_p->name =~ /Business|Employment/ ? 1 : 0,
			document_templates	=> [map { [$_, { instance_count => $template_ids{$_}, review_count => $template_ids{$_} }] } keys %template_ids],
#			service_definitions	=> [4, { service_levels => { ROWS => [ [1,{ price => $product->{price} }] , [2,{ price => $product->{price} }] ], LINK_RELATION => 'product_service_definitions' } }]
			service_definitions	=> [4]
		});
# last if $i > 1;
# next;
		# will remove this when link column data can be relationships
#		$p->ulde_schema->resultset('ProductServiceDefinition')->find({ product => $p->id, service_definition => 4 })->add_to_service_levels($p->ulde_schema->resultset('ServiceLevel')->find(1), {price => $product->{price}});
#		$p->ulde_schema->resultset('ProductServiceDefinition')->find({ product => $p->id, service_definition => 4 })->add_to_service_levels($p->ulde_schema->resultset('ServiceLevel')->find(2), {price => $product->{price}});
		$p->ulde_schema->resultset('ProductServiceDefinition')->find({ product => $p->id, service_definition => 4 })->add_to_service_levels($p->ulde_schema->resultset('ServiceLevel')->find(1), {price => '10.00'});
		$p->ulde_schema->resultset('ProductServiceDefinition')->find({ product => $p->id, service_definition => 4 })->add_to_service_levels($p->ulde_schema->resultset('ServiceLevel')->find(2), {price => '10.00'});

		
	}
}

sub _add_retrieve_legal_area {
# 0: name

	my $self = shift;

	my $a 	= ULDE::Component::LegalArea->new;
	unless ($a->search({ name => $_[0] })->count) {
		$a->create({ name => $_[0] });
	}
	return $a;
}

sub _add_retrieve_legal_category {
# 0: name

	my $self = shift;

	my $c 	= ULDE::Component::LegalCategory->new;
	unless ($c->search({ name => $_[0] })->count) {
		$c->create({ name => $_[0] });
	}
	return $c;
}

sub _add_retrieve_legal_sub_category {
# 0: name

	my $self = shift;

	my $sc 	= ULDE::Component::LegalSubCategory->new;
	unless ($sc->search({ name => $_[0] })->count) {
		$sc->create({ name => $_[0] });
	}
	return $sc;
}

__PACKAGE__->meta->make_immutable;

1;  