package ULDE::Component::Product::Instance;

use Moose;
use namespace::autoclean;
use Moose::Util::TypeConstraints;
use ULDE::Component::Product::ServiceDefinition;
use ULDE::Component::Template::Instance;
use ULDE::Component::Associate;
use ULDE::Component::Account::Customer;
use ULDE::Component::ServiceLevel::Product;
use ULDE::Component::PurchaseTransaction;
use ULDE::Component::Reviewer;
use List::Util qw(first all any);

extends 'ULDE::Component';

class_type 'ULDE::Component::Associate';

has '+resultset'				=> ( default => 'ProductInstance' );
has '+result_object'		=> ( handles => [qw(id quantity added sub_total vat_amount total)] );

has name 								=> ( is => 'rw', isa => 'Str', lazy_build => 1 );
has customer_account 		=> ( is => 'rw', isa => 'ULDE::Component::Account::Customer', lazy_build => 1 );
has product							=> ( is => 'rw', isa => 'ULDE::Component::Product::ServiceDefinition', lazy_build => 1 );
has template_instance		=> ( is => 'rw', isa => 'ArrayRef[ULDE::Component::Template::Instance]', lazy_build => 1 );
has template_instance_h	=> ( is => 'rw', isa => 'HashRef[ULDE::Component::Template::Instance]', lazy_build => 1 );
has purchase_txn				=> ( is => 'rw', isa => 'ULDE::Component::PurchaseTransaction | Bool', lazy_build => 1 );
has status 							=> ( is => 'rw', isa => 'DBIx::Class::Row', lazy_build => 1 );
has associate 					=> ( is => 'rw', isa => 'ULDE::Component::Associate | Bool', lazy_build => 1 );
has is_pack							=> ( is => 'rw', isa => 'Bool', lazy_build => 1);
has service_level				=> ( is => 'rw', isa => 'ULDE::Component::ServiceLevel::Product | Bool', lazy_build => 1 );

# forkable methods
around [qw(create_template_instance)] => sub {
	my $orig = shift;
  my $self = shift;

  $self->fork_me($orig,@_);
};


sub _build_customer_account {
	my $self = shift; 

	ULDE::Component::Account::Customer->new({ id => $self->result_object->customer_account->id });
}

sub _build_product {
	my $self = shift; 

	ULDE::Component::Product::ServiceDefinition->new({ product => $self->result_object->product, service_definition => $self->result_object->service_definition });
}

sub _build_template_instance {
	my $self = shift;
	
	[ map { ULDE::Component::Template::Instance->new({ id => $_->id }) } $self->result_object->template_instances];
}

sub _build_template_instance_h {
	my $self = shift; 

	my %struct;
	@struct{ map {$_->id} $self->result_object->template_instances} = (map { ULDE::Component::Template::Instance->new({ id => $_->id }) } $self->result_object->template_instances);

	return \%struct;
}

sub _build_purchase_txn {
	my $self = shift; 

	$self->result_object->purchase_transaction ? ULDE::Component::PurchaseTransaction->new({ id => $self->result_object->purchase_transaction->id }) : undef;
}

sub _build_name {
	my $self = shift;

	$self->result_object->name || $self->product->name;
}

sub _build_status {
	my $self = shift; 

	$self->result_object->status;
}

sub _build_associate {
	my $self = shift; 

	$self->result_object->associate ? ULDE::Component::Associate->new({ id => $self->result_object->associate->id }) : undef;
}

sub _build_is_pack {
	my $self = shift; 

	$self->product->is_pack;
}

sub _build_service_level {
	my $self = shift;

	# there is always a service level associated with product when created. Code not chnaged for backward compatability
	$self->result_object->product_service_level ? 
		ULDE::Component::ServiceLevel::Product->new({ service_level => $self->result_object->product_service_level->service_level->id, service_definition => $self->result_object->product_service_level->service_definition, product => $self->result_object->product_service_level->product }):
		undef;
}

sub _build_attributes {
	my $self = shift;

	$self->product($self->_build_product);
	$self->template_instance($self->_build_template_instance);
	$self->template_instance_h($self->_build_template_instance_h);
	$self->name($self->_build_name);
	$self->status($self->_build_status);
	$self->associate($self->_build_associate);
	$self->is_pack($self->_build_is_pack);
	$self->customer_account($self->_build_customer_account);
	$self->service_level($self->_build_service_level);
}

after 'update' => sub {
# 0: columns

	my $self = shift;

	$self->name($self->_build_name) if exists $_[0]->{name};
	$self->status($self->_build_status) if exists $_[0]->{status};
	$self->service_level($self->_build_service_level) if exists $_[0]->{service_level};

};

sub get_service_level {
# a SL is always associated with an instance at point of creation so this method is only for backward compatability
# also, default SL depends on whether is customer or reviewer 
	my $self = shift;

	# return default sl if none associated with instance
	$self->service_level || first { $_->default } @{$self->product->service_level};
}

sub change_status {
# 0: status_code (1 || 2 || 4)

	my $self = shift;

	unless ($self->status->id == $_[0]) {
		$self->update({ status => $_[0] });
		$self->add_activity( $_[0] == 2 ? 1 : $_[0] == 4 ? 10 : undef) unless $_[0] == 1;
	}
}

sub template_instance_status_changed {

	my $self = shift;

	# check if a state change in an instance template triggers a product state change
	# state change in a template instance can affect a product state change if current product state is active or completed

	$self->change_status(4) if $self->status->id == 2 && all { $_->status->id == 4 } @{$self->template_instance};
	$self->change_status(2) if $self->status->id == 4 && any { $_->status->id == 2 || $_->status->id == 3  } @{$self->template_instance};
}

sub create_template_instance {
# 0: template_id
# 1: customer_id

	my $self = shift;

	# create instance in ELE

	$self->assembler->create_document(	$self->product->template_h->{$_[0]}->foreign_id,
#																			$self->customer_account->foreign_account->[0]->foreign_login_details
																			$self->customer_account->foreign_account->foreign_login_details
																		);

	my $columns = { template_instances => {
										template 		=> $_[0],
										foreign_id 		=> $self->assembler->response->{doc_id},
										customer 		=> $_[1]
								}};

	$self->create($columns);

	$self->template_instance($self->_build_template_instance);
	$self->template_instance_h($self->_build_template_instance_h);

	return $self->return_newest_object($self->template_instance) if defined wantarray;

}

sub sign_off_required {
# 0: reviewer id

	my $self = shift;

	my $current_reviewer = ULDE::Component::Reviewer->new({ id => $_[0] });

	return $current_reviewer->get_review_responsibility($self->id)->sign_off_required ? 1 : 0;
}

__PACKAGE__->meta->make_immutable;


1;
