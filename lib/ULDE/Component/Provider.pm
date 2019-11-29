package ULDE::Component::Provider;

use Moose;
use namespace::autoclean; 

extends 'ULDE::Component';

has '+resultset'			=> ( default => 'Provider' );
has '+result_object'	=> ( handles => [qw(id name)] );

has service_definition => ( is => 'rw', isa => 'ArrayRef[ULDE::Component::ServiceDefinition]', lazy_build => 1 );

sub _build_service_definition {
	my $self = shift; 

	[map { ULDE::Component::ServiceDefinition->new({ id => $_->id }) } $self->result_object->service_definitions];
}

sub _build_attributes {
	my $self = shift;

	$self->service_definition($self->_build_service_definition);
}

sub _delete_related {
	my $self = shift;

#	$self->result_object->service_definitions->delete;
}

__PACKAGE__->meta->make_immutable;

1;