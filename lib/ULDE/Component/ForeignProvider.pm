package ULDE::Component::ForeignProvider;

use Moose;
use namespace::autoclean; 

extends 'ULDE::Component';

has '+resultset'			=> (default => 'ForeignProvider');
has '+result_object'	=> (handles => [qw(id name)]);

has foreign_account => (is => 'rw', isa => 'ArrayRef[ULDE::Component::ForeignAccount]', lazy_build => 1);

sub _build_foreign_account {
	my $self = shift; 

	[map { ULDE::Component::ForeignAccount->new({ id => $_->id }) } $self->result_object->foreign_accounts];
}

sub _build_attributes {
	my $self = shift;

	$self->foreign_account($self->_build_foreign_account);
}

__PACKAGE__->meta->make_immutable;

1;