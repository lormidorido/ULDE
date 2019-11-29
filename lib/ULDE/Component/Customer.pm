package ULDE::Component::Customer;

use Moose;
use namespace::autoclean;
use ULDE::Component::Account::Customer;
use ULDE::Component::Address;
use ULDE::Component::Role;
use ULDE::Component::Reviewer;

extends 'ULDE::Component';

has '+resultset'			=> ( default => 'Customer' );
has '+result_object'	=> ( handles => [qw(id title first_name surname created user_name password status dob)] );

has account			=> ( is => 'rw', isa => 'ULDE::Component::Account::Customer', lazy_build => 1);
has address			=> ( is => 'rw', isa => 'ArrayRef[ULDE::Component::Address]', lazy_build => 1 );
has address_h		=> ( is => 'rw', isa => 'HashRef[ULDE::Component::Address]', lazy_build => 1 );
has role 				=> ( is => 'rw', isa => 'ArrayRef[ULDE::Component::Role]', lazy_build => 1 );
has initials 		=> ( is => 'rw', isa => 'ArrayRef[Str]', lazy_build => 1 );	
has salutation 	=> ( is => 'rw', isa => 'Str', lazy_build => 1 );
has full_name 	=> ( is => 'rw', isa => 'Str', lazy_build => 1 );
has created_by 	=> ( is => 'rw', isa => 'ArrayRef[ULDE::Component::Reviewer] | Bool', lazy_build => 1 );

sub _build_address {
	my $self = shift; 

	[map { ULDE::Component::Address->new({ id => $_->id }) } $self->result_object->addresses];
}

sub _build_address_h {
	my $self = shift; 

	my %struct;
	@struct{ map {$_->id} $self->result_object->addresses} = (map { ULDE::Component::Address->new({ id => $_->id }) } $self->result_object->addresses);

	return \%struct;
}

sub _build_role {
	my $self = shift; 

	[map { ULDE::Component::Role->new({ id => $_->id }) } $self->result_object->roles];
}

sub _build_account {
	my $self = shift; 
 
	ULDE::Component::Account::Customer->new({ id => $self->result_object->account->id });
}

sub _build_initials {
	my $self = shift; 

	$self->first_name ? [map { uc substr $_, 0 , 1 } split(/\s+/, $self->first_name)] : [];
}

sub _build_salutation {

	my $self = shift; 

	$self->surname ? ${$self->title ? \($self->title . ' ') : \''} . join(' ', @{$self->initials}) . ' ' . ucfirst lc $self->surname : ''
}

sub _build_full_name {
	my $self = shift; 

	$self->first_name && $self->surname ? $self->first_name . ' ' . $self->surname : ''
}

sub _build_created_by {
	my $self = shift; 

	[map { ULDE::Component::Reviewer->new({ id => $_->id }) } $self->result_object->reviewers];
}

sub _build_attributes {
	my $self = shift;

	$self->account($self->_build_account);
	$self->address($self->_build_address);
	$self->address_h($self->_build_address_h);
	$self->role($self->_build_role);
	$self->initials($self->_build_initials);
	$self->salutation($self->_build_salutation);
	$self->full_name($self->_build_full_name);
	$self->created_by($self->_build_created_by);
}

sub _delete_related {
	my $self = shift;

	$self->result_object->addresses->delete;
}

__PACKAGE__->meta->make_immutable;

1;
