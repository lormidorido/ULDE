package ULDE::Component::ForeignAccount;

use Moose;
use namespace::autoclean;
use ULDE::Component::ForeignProvider;

extends 'ULDE::Component';

has '+resultset'			=> (default => 'ForeignAccount');
has '+result_object'	=> (handles => [qw(id date_created foreign_user_name foreign_password foreign_account_id)]);

#has account								=> ( is => 'rw', isa => 'ULDE::Component::Account::Customer', lazy_build => 1);
has account								=> ( is => 'rw', isa => 'ArrayRef[ULDE::Component::Account::Customer]', lazy_build => 1);
has foreign_provider			=> ( is => 'rw', isa => 'ULDE::Component::ForeignProvider', lazy_build => 1 );
has foreign_login_details => ( is => 'rw', isa => 'ArrayRef', lazy_build => 1);

sub _build_account {
	my $self = shift; 
 
#	ULDE::Component::Account::Customer->new({ id => $self->result_object->customer_account->id });
	[map { ULDE::Component::Account::Customer->new({ id => $_->id }) } $self->result_object->customer_accounts ];
}

sub _build_foreign_provider {
	my $self = shift; 

	ULDE::Component::ForeignProvider->new({ id => $self->result_object->foreign_provider->id });
}

sub _build_foreign_login_details {
	my $self = shift; 

	[$self->foreign_user_name, $self->foreign_password]	
}

sub _build_attributes {
	my $self = shift;

	$self->account($self->_build_account);
	$self->foreign_provider($self->_build_foreign_provider);
}

__PACKAGE__->meta->make_immutable;

1;
