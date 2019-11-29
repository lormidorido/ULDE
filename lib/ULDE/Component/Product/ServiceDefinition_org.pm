package ULDE::Component::Product::ServiceDefinition;
# Service Defintion product class
# Class for making columns handling in link table transparent.
# This class is expected to be used for retrieving one object ones to link column data in link table

use Moose;
use namespace::autoclean;
use ULDE::Component::ServiceLevel::Product;

extends 'ULDE::Component::Product';

has _product_service_object	=> (is => 'rw', isa => 'DBIx::Class::Row', lazy => 1, required => 1, builder => '_build_product_service_object', handles => [qw(active)]);

has service_definition 	=> (is => 'ro', isa => 'Int', required => 1);

has description					=> (is => 'rw', isa => 'Str', lazy_build => 1);
has service_level				=> (is => 'rw', isa => 'ArrayRef[ULDE::Component::ServiceLevel::Product] | ULDE::Component::ServiceLevel::Product', lazy_build => 1 );

sub _build_product_service_object {
	my $self = shift;

	$self->_find_related(['product_service_definitions',{ service_definition => $self->service_definition }]);
}

sub _build_description {
	my $self = shift;

	$self->_product_service_object->description || $self->result_object->description;
}

sub _build_service_level {
	my $self = shift;

	[map { ULDE::Component::ServiceLevel::Product->new({ id => $_->id, service_definition => $self->service_definition, product => $self->id }) } $self->_product_service_object->service_levels];
}

# overrides 'update'
sub update {
# 0: columns

	my $self = shift;

	my %local_columns = (
		active			=> 1,
		description => 1
		);

	$self->SUPER::update({ map { $_ => $_[0]->{$_} } grep { !$local_columns{$_} } keys %{$_[0]} });

	$self->_product_service_object->update({ map { $_ => $_[0]->{$_} } grep { $local_columns{$_} } keys %{$_[0]} });

	$self->description($self->_build_description) if $_[0]->{description};
}

__PACKAGE__->meta->make_immutable;

1;