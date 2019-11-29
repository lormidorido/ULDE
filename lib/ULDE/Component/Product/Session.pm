package ULDE::Component::Product::Session;
# Class for making columns handling in link table transparent.
# This class is expected to be used for retrieving one object ones to link column data in link table

use Moose;
use namespace::autoclean;
use ULDE::Component::Product::ServiceDefinition;

extends 'ULDE::Component';

has '+resultset'			=> ( default => 'HttpSessionProduct' );
has '+result_object'	=> ( handles => [qw(quantity)]);

has related_obj 			=> ( is => 'rw', isa => 'ULDE::Component::Product::ServiceDefinition', lazy_build => 1, handles => [qw(id name business personal template template_h legal_area category sub_category jurisdiction is_pack service_definition description service_level)] );

sub _build_related_obj {
	my $self = shift;

	ULDE::Component::Product::ServiceDefinition->new({ product => $self->result_object->product, service_definition => $self->result_object->service_definition });
}

__PACKAGE__->meta->make_immutable;

1;