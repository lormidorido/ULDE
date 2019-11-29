package ULDE::Component::Role;

use Moose;
use namespace::autoclean;

extends 'ULDE::Component';

has '+resultset'			=> ( default => 'Role' );
has '+result_object'	=> ( handles => { 
																				id 		=> 'id',
																				name 	=> 'role'
																			});

__PACKAGE__->meta->make_immutable;


1;
