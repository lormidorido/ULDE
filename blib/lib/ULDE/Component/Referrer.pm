package ULDE::Component::Referrer;

use Moose;
use namespace::autoclean;
with 'ULDE::Role::Component';

has 'id'	=> (is => 'ro', isa => 'Str', required => 1);
has 'name' 	=> (is => 'ro', isa => 'Str', default => 'Aviva');

__PACKAGE__->meta->make_immutable;

1;