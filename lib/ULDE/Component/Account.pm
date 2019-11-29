package ULDE::Component::Account;

use Moose;
use namespace::autoclean;

extends 'ULDE::Component';

has '+result_object'	=> ( handles => [qw(id)] );

__PACKAGE__->meta->make_immutable;

1;