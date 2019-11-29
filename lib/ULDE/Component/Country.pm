package ULDE::Component::Country;

use Moose;
use namespace::autoclean;

extends 'ULDE::Component';

has '+resultset'				=> ( default => 'Country' );
has '+result_object'		=> ( handles => [qw(id name iso_code phone_code time_zone)] );

__PACKAGE__->meta->make_immutable;

1;