package ULDE::Component::FileStorage;

use Moose;
use namespace::autoclean;

extends 'ULDE::Component';

has '+resultset'			=> (default => 'FileStorage');
has '+result_object'	=> (handles => [qw(id name created)]);

has format						=> ( is => 'rw', isa => 'DBIx::Class::Row', lazy_build => 1 );
has storage_root 			=> ( is => 'ro', isa => 'Str', lazy_build => 1 );

sub _build_format {
	my $self = shift; 
 
	$self->result_object->file_format;
}

sub _build_storage_root {
	my $self = shift; 

	$self->ulde_config->{'ULDE::PlatformDependent'}->{file_storage}->{path}
}

sub _build_attributes {
	my $self = shift;

	$self->format($self->_build_format);
}

__PACKAGE__->meta->make_immutable;

1;
