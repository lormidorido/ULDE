package ULDE::Component::Provider;

use Moose;
use namespace::autoclean; 
with 'ULDE::Role::Component';

has 'id'			=> (is => 'ro', isa => 'Str', default => '1');
has 'name' 			=> (is => 'ro', isa => 'Str', default => 'UK Law Online');
# has 'url' 	=> (is => 'rw', isa => 'ArrayRef', default => sub {['uklawonline.com','uklo.co.uk']});

__PACKAGE__->meta->make_immutable;

1;