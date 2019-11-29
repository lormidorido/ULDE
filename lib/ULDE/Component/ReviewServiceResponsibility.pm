package ULDE::Component::ReviewServiceResponsibility;

use Moose;
use namespace::autoclean;
use ULDE::Component::Reviewer;
use ULDE::Component::Product::Instance;
use ULDE::Component::Customer;

extends 'ULDE::Component';

has '+resultset'			=> ( default => 'ReviewServiceResponsibility' );
has '+result_object'	=> ( handles => [qw(id created status sign_off_required)] );

has reviewer 					=> ( is => 'rw', isa => 'ArrayRef[ULDE::Component::Reviewer]', lazy_build => 1 );
has senior_reviewer 	=> ( is => 'rw', isa => 'ULDE::Component::Reviewer', lazy_build => 1 );
has review_service 		=> ( is => 'rw', isa => 'DBIx::Class::Row', lazy_build => 1 );

# when I got time need to create ULDE::Component::Associate::ReviewServiceResponsibility to get many-to-many relaiton attribute
has associate 				=> ( is => 'rw', isa => 'ArrayRef[ULDE::Component::Associate]', lazy_build => 1 );
has product_instance 	=> ( is => 'rw', isa => 'ArrayRef[ULDE::Component::Product::Instance]', lazy_build => 1 );
has customer 					=> ( is => 'rw', isa => 'ArrayRef[ULDE::Component::Customer]', lazy_build => 1 );

sub _build_reviewer {
	my $self = shift; 

	[map { ULDE::Component::Reviewer->new({ id => $_->id }) } $self->result_object->reviewers];
}

sub _build_review_service {
	my $self = shift;

	$self->result_object->review_service;
}

sub _build_senior_reviewer {
	my $self = shift;

	ULDE::Component::Reviewer->new({ id => $self->result_object->senior_reviewer->id });
}

sub _build_associate {
	my $self = shift;

	[ map { ULDE::Component::Associate->new({ id => $_->id }) } $self->result_object->associates];
}

sub _build_product_instance {
	my $self = shift;

	[map { @{$_->product_instance} } @{$self->associate}];
}

sub _build_customer {
	my $self = shift;

	[do { my %seen; grep { !$seen{$_->id}++ } map { @{$_->customer_account->customer} } @{$self->product_instance} }];
}

sub _build_attributes {
	my $self = shift;

	$self->reviewer($self->_build_reviewer);
	$self->review_service($self->_build_review_service);
	$self->review_senior_reviewer($self->_build_senior_reviewer);
	$self->review_associate($self->_build_associate);
	$self->product_instance($self->_build_product_instance);
	$self->product_customer($self->_build_customer);
}

__PACKAGE__->meta->make_immutable;

1;
