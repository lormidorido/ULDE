package ULDE::Component::DocumentAssemblyProvider;

use Moose;
use namespace::autoclean;

extends 'ULDE::Component';

has '+resultset'			=> ( default => 'DocumentAssemblyProvider' );
has '+result_object'	=> ( handles => [qw(id name)] );

has template => ( is => 'rw', isa => 'ArrayRef[ULDE::Component::Template]', lazy_build => 1 );

sub _build_template {
	my $self = shift; 

	[map { ULDE::Component::Template->new({ id => $_->id }) } $self->result_object->templates];
}

sub _build_attributes {
	my $self = shift;

	$self->template($self->_build_template);
}

__PACKAGE__->meta->make_immutable;

1;