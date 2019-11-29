package ULDE::Component::ServiceLevel::Product;
# Service Defintion product class
# Class for making columns handling in link table transparent.
# This class is expected to be used for retrieving one object ones to link column data in link table

use Moose;
use namespace::autoclean;

extends 'ULDE::Component::ServiceLevel';

has _product_service_level_object	=> (is => 'rw', isa => 'DBIx::Class::Row', lazy => 1, required => 1, builder => '_build_product_service_level_object', handles => [qw(price min_price max_price)]);

has service_definition 	=> (is => 'ro', isa => 'Int', required => 1);
has product 						=> (is => 'ro', isa => 'Int', required => 1);

has description					=> (is => 'rw', isa => 'Str', lazy_build => 1);

sub _build_product_service_level_object {
	my $self = shift;

	$self->_find_related(['product_service_levels',{ service_definition => $self->service_definition, product => $self->product }]);
}

sub _build_description {
	my $self = shift;

	$self->_product_service_level_object->description || $self->result_object->description;
}

# overrides 'update'
sub update {
# 0: columns

	my $self = shift;

	my %local_columns = (
		price				=> 1,
		min_price 	=> 1,
		max_price		=> 1,
		description => 1
		);

	$self->SUPER::update({ map { $_ => $_[0]->{$_} } grep { !$local_columns{$_} } keys %{$_[0]} });

	$self->_product_service_level_object->update({ map { $_ => $_[0]->{$_} } grep { $local_columns{$_} } keys %{$_[0]} });

	$self->description($self->_build_description) if $_[0]->{description};
}

__PACKAGE__->meta->make_immutable;

1;