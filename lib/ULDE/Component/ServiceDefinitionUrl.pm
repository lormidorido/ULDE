package ULDE::Component::ServiceDefinitionUrl;

use Moose;
use namespace::autoclean;

extends 'ULDE::Component';

has '+resultset'			=> ( default => 'ServiceDefinitionUrl' );
has '+result_object'	=> ( handles => [qw(id service_definition name)] );

__PACKAGE__->meta->make_immutable;


1;
