package ULDE::Web::Component::Session;

use Moose;
use namespace::autoclean;
use URI;
use ULDE::Component::ServiceDefinition;
use ULDE::Component::Associate;
use ULDE::Component::Session;
use ULDE::Component::Account::Customer;

has srv_def								=> (is => 'ro', isa => 'HashRef', lazy_build => 1);

has host 									=> (is => 'ro', isa => 'Str', required => 1, default => 'shopfront.uklawonline.com');
has referer								=> (is => 'ro', isa => 'Str | Bool', required => 1, default => undef);

has session_id 						=> (is => 'ro', isa => 'Str', required => 1);
has customer_account_id 	=> (is => 'rw', isa => 'Int', clearer => 'clear_customer_account_id');
has customer_id 					=> (is => 'rw', isa => 'Int', clearer => 'clear_account_id');

has customer_association 	=> (is => 'rw', isa => 'Int', clearer => 'clear_customer_association');

has assembler_logon 			=> (is => 'rw', isa => 'Bool', required => 1, default => 0, clearer => 'clear_assembler_logon');

sub _build_srv_def {
	my $self = shift;

	my $sd 				= ULDE::Component::ServiceDefinition->new({ id => 4 });
#	my $sd 				= ULDE::Component::ServiceDefinition->new({ url => $self->host });
#	my $associate	= $sd->result_object->associates->search({ id => 1 })->first;
	my $associate = $sd->result_object->associates->search({ host => { like => '%' . lc URI->new($self->referer)->host . '%' } })->first if $self->referer;

# why do I not just reference the objects per se below!??? Maybe there were issues with serialising objects...

	return {
		id 				=> $sd->id,
		url				=> $self->host,
		provider	=> {
			id			=> $sd->provider->id,
			name 		=> $sd->provider->name
		},
		associate => ${
			$associate ? 
			\$self->get_associate_struct($associate) :
			\undef
		}
	};
}

sub link_associate {
# 0: associate_id || associate_object

	my $self = shift;

	$self->srv_def->{associate} = $self->get_associate_struct(ref $_[0] ? $_[0] : ULDE::Component::Associate->new({ id => $_[0] }));
}

sub delink_associate {
# 0: associate_id || associate_object

	my $self = shift;

	$self->srv_def->{associate} = undef;
}

sub get_associate_struct {
# 0: associate_object

	my $self = shift;

	return 	{
						id 				=> $_[0]->id,
						name 			=> $_[0]->name,
						img_logo 	=> $_[0]->img_logo,
						host 			=> $_[0]->host,
						css_class => $_[0]->css_class
					};
}

sub add_product {
# 0: product_id
# 1: service_level || undef
# 2: quantity || 1

	my $self = shift;

	my $session = ULDE::Component::Session->new({ id => $self->session_id });

	return $session->add_product($self->srv_def->{id}, @_);
}

sub product {
	my $self = shift;

	my $session = ULDE::Component::Session->new({ id => $self->session_id });

	return $session->product;
}

sub product_count {
	my $self = shift;

	my $session = ULDE::Component::Session->new({ id => $self->session_id });
	return $session->product_count;
}

sub remove_product {
# 0: product_id
# 1: quantity || 1

	my $self = shift;

	my $session = ULDE::Component::Session->new({ id => $self->session_id });

	$session->remove_product($self->srv_def->{id}, @_);
}

sub product_min_cost {
	my $self = shift;

	my $session = ULDE::Component::Session->new({ id => $self->session_id });

	return $session->product_min_cost;
}

sub session_basket_to_account {
	my $self = shift;

	if ($self->customer_account_id) {
		my $account = ULDE::Component::Account::Customer->new({ id => $self->customer_account_id });
		foreach my $product (@{$self->product}) {
			my $i = $product->quantity;
			while ($i--) {
				$account->add_product_instance($product->id, undef, undef, undef, $self->customer_id, 'customer');
			}
			$product->delete;
		}
	}
}

__PACKAGE__->meta->make_immutable;
