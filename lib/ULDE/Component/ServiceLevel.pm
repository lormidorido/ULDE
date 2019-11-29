package ULDE::Component::ServiceLevel;

use Moose;
use namespace::autoclean;

extends 'ULDE::Component';

has '+resultset'			=> ( default => 'ServiceLevel' );
has '+result_object'	=> ( handles => [qw(id name description includes_review internal_office_use customer_communication corporate_client_description customer_applicable corporate_client_applicable default_product_instance_status)] );

__PACKAGE__->meta->make_immutable;


1;
