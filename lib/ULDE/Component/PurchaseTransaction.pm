package ULDE::Component::PurchaseTransaction;

use Moose;
use namespace::autoclean;
use URI;
use ULDE::Component::Product::Instance;
use ULDE::Component::DiscountVoucher;

extends 'ULDE::Component';

has '+resultset'			=> ( default => 'PurchaseTransaction' );
has '+result_object'	=> ( handles => [qw(id order_number reference_number date sub_total vat_amount total discount_amount payable)] );

has product_instance 	=> ( is => 'rw', isa => 'ArrayRef[ULDE::Component::Product::Instance]', lazy_build => 1 );
has discount_voucher 	=> ( is => 'rw', isa => 'ULDE::Component::DiscountVoucher | Bool | Str', lazy_build => 1 );


sub _build_product_instance {
	my $self = shift;

		[ map { ULDE::Component::Product::Instance->new({ id => $_->id }) } $self->result_object->product_instances ]
}

sub _build_discount_voucher {
	my $self = shift;

	$self->result_object->discount_voucher ?
		ULDE::Component::DiscountVoucher->new({ code => $self->result_object->discount_voucher->code }) :
		undef;
}

sub _build_attributes {
	my $self = shift;

	$self->product_instance($self->_build_product_instance);
	$self->product_discount_voucher($self->_build_discount_voucher);
}

__PACKAGE__->meta->make_immutable;

1;
