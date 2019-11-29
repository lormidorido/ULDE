package ULDE::Component::DiscountVoucher;

use Moose;
use namespace::autoclean;
use URI;
use ULDE::Component::Associate;
use ULDE::Component::ServiceDefinition;

extends 'ULDE::Component';

has '+resultset'			=> ( default => 'DiscountVoucher' );
has '+result_object'	=> ( handles => [qw(code discount expires max_uses active)] );

has service_definition 	=> ( is => 'rw', isa => 'ULDE::Component::ServiceDefinition | Bool', lazy_build => 1 );
has associate 					=> ( is => 'rw', isa => 'ULDE::Component::Associate | Bool', lazy_build => 1 );
has percentage 					=> ( is => 'ro', isa => 'Str', lazy_build => 1 );

sub _build_service_definition {
	my $self = shift;

	$self->result_object->service_definition_discount_voucher ?
		ULDE::Component::ServiceDefinition->new({ id => $self->result_object->service_definition_discount_voucher->service_definition->id }) :
		undef;
}

sub _build_associate {
	my $self = shift;

	$self->result_object->associate_discount_voucher ?
		ULDE::Component::Associate->new({ id => $self->result_object->associate_discount_voucher->associate->id }) :
		undef;
}

sub _build_percentage {
	my $self = shift;

	($self->result_object->discount * 100) . '%';
}

sub _build_attributes {
	my $self = shift;

	$self->associate($self->_build_associate);
}

__PACKAGE__->meta->make_immutable;

1;
