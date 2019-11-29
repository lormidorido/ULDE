package ULDE::Component::Code;

use Moose;
use namespace::autoclean;
use ULDE::Component::ReviewServiceResponsibility::Code;
use ULDE::Component::Reviewer;
use List::Util qw(first);

extends 'ULDE::Component';

has '+resultset'			=> ( default => 'Code' );
has '+result_object'	=> ( handles => [qw(id code)] );

has responsibility 		=> (is => 'rw', isa => 'ArrayRef[ULDE::Component::ReviewServiceResponsibility::Code]', lazy_build => 1);
has role 							=> (is => 'rw', isa => 'ArrayRef[DBIx::Class::Row]', lazy_build => 1);
has is_senior_code 		=> (is => 'rw', isa => 'Bool', lazy_build => 1);
has use_count 				=> (is => 'rw', isa => 'Int', lazy_build => 1);
#has requires_senior 	=> (is => 'rw', isa => 'Bool', lazy_build => 1);
#has senior_registered => (is => 'rw', isa => 'Bool', lazy_build => 1);

sub _build_responsibility {
	my $self = shift; 
 
	[map { ULDE::Component::ReviewServiceResponsibility::Code->new({ review_service_responsibility => $_->review_service_responsibility->id, code => $self->id }) } $self->result_object->review_service_responsibility_codes];
}

sub _build_role {
	my $self = shift; 
 
	[$self->result_object->roles];
}

sub _build_is_senior_code {
	my $self = shift;

	return ULDE::Component::ReviewServiceResponsibility::Code->new({ senior_reviewer_code => $self->id })->count > 0 ? 1 : 0;
}

sub _build_use_count {
	my $self = shift;

	return ULDE::Component::Reviewer->new({ registration_code => $self->id })->count;
}

#sub _build_requires_senior {
#	my $self = shift;

#	return grep { defined $_->senior_reviewer_code } @{$self->responsibility} ? 1 : 0;
#}

sub _build_attributes {
	my $self = shift;

	$self->responsibility($self->_build_responsibility);
	$self->role($self->_build_role);
	$self->is_senior_code($self->_build_is_senior_code);
	$self->use_count($self->_build_use_count);
}

__PACKAGE__->meta->make_immutable;

1;
