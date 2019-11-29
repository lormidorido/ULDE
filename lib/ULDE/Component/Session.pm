package ULDE::Component::Session;

use Moose;
use namespace::autoclean;
use ULDE::Component::Product::Session;
use List::Util qw(first sum min);

extends 'ULDE::Component';

has '+resultset'			=> ( default => 'HttpSession' );
has '+result_object'	=> ( handles => [qw(session_data expires)] );

has product 					=> ( is => 'rw', isa => 'ArrayRef[ULDE::Component::Product::Session]', lazy_build => 1);
has id 								=> ( is => 'rw', isa => 'Str', required => 1);

around BUILDARGS => sub {
	my $orig = shift;
  my $class = shift;

  return $class->$orig({ id => 'session:' . $_[0]->{id} });
};

sub _build_product {
	my $self = shift;
# open(F,">/tmp/out.txt");
#print F 
	[map { ULDE::Component::Product::Session->new({ service_definition => $_->service_definition->id, product => $_->product->id }) } $self->result_object->product_service_definitions];
}

sub _build_attributes {
	my $self = shift;

	$self->product($self->_build_product);
}

sub add_product {
# 0: service_definition
# 1: product_id
# 2: service_level || undef
# 3: quantity || 1

	my $self = shift;
	
	my $product;

	if ($product = first { $_->id == $_[1] } @{$self->product}) {
		$product->quantity + ($_[3] || 1) <= 5 ?
			$product->update({ quantity => $product->quantity + ($_[3] || 1) }):
			$product->update({ quantity => 5 });
	} else {

		my $columns = { http_session_products => { 
											service_definition 	=> $_[0],
											product 						=> $_[1],
											service_level 			=> $_[2] || undef,
											quantity 						=> $_[3] || 1
									}};

		$self->create($columns);
	}

	$self->product($self->_build_product);

	return $product ? $product : $self->return_newest_object($self->product) if defined wantarray;
}

sub remove_product {
# 0: service_definition
# 1: product_id
# 2: quantity || 1

	my $self = shift;

	if (my $product = first { $_->id == $_[1] } @{$self->product}) {
		$product->quantity > ($_[2] || 1) ? 
			$product->update({ quantity => $product->quantity - ($_[2] || 1) }):
			$product->delete;
	}
}

sub product_count {
	my $self = shift;

	return sum map { $_->quantity } @{$self->product};

}

sub product_min_cost {
	my $self = shift;

	# not working
	return sum min map { (my $price = $_->price) =~ s/^.//; $price * $_->quantity } @{$self->product->service_level};
}
__PACKAGE__->meta->make_immutable;

1;