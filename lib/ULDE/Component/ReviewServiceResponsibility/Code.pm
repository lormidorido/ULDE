package ULDE::Component::ReviewServiceResponsibility::Code;
# Product Template class
# Class for making columns handling in link table transparent.
# This class is expected to be used for retrieving one object once to link column data in link table

use Moose;
use namespace::autoclean;
use ULDE::Component::ReviewServiceResponsibility;

extends 'ULDE::Component';

has '+resultset'			=> ( default => 'ReviewServiceResponsibilityCode' );
has '+result_object'	=> ( handles => [ qw(primary senior_reviewer_code) ] );

has related_obj => ( is => 'rw', isa => 'ULDE::Component::ReviewServiceResponsibility', lazy_build => 1, handles => [qw(id created status sign_off_required reviewer senior_reviewer review_service associate product_instance customer)] );

sub _build_related_obj {
	my $self = shift;

	ULDE::Component::ReviewServiceResponsibility->new({ id => $self->result_object->review_service_responsibility->id});
}

__PACKAGE__->meta->make_immutable;

1;