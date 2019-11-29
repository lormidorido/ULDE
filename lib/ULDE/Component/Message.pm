package ULDE::Component::Message;

use Moose;
use namespace::autoclean;
use ULDE::Component::Communication;
use ULDE::Component::Reviewer;
use ULDE::Component::Customer;

extends 'ULDE::Component';

has '+resultset'			=> ( default => 'Message' );
has '+result_object'	=> ( handles => [qw(id created content unread)] );

has communication		=> ( is => 'rw', isa => 'ULDE::Component::Communication', lazy_build => 1);
has reviewer 				=> ( is => 'rw', isa => 'ULDE::Component::Reviewer | Bool', lazy_build => 1);
has customer 				=> ( is => 'rw', isa => 'ULDE::Component::Customer | Bool', lazy_build => 1);

sub _build_communication {
	my $self = shift; 
 
	ULDE::Component::Account::Customer->new({ id => $self->result_object->communication->id });
}

sub _build_reviewer {
	my $self = shift;
 
	ULDE::Component::Reviewer->new({ id => $self->result_object->reviewer->id }) if $self->result_object->reviewer;
}

sub _build_customer {
	my $self = shift; 

	ULDE::Component::Customer->new({ id => $self->result_object->customer->id }) if $self->result_object->customer;
}

sub _build_attributes {
	my $self = shift;

	$self->communication($self->_build_communication);
	$self->reviewer($self->_build_reviewer);
	$self->customer($self->_build_customer);
}

__PACKAGE__->meta->make_immutable;

1;
