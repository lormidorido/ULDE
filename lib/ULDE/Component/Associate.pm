package ULDE::Component::Associate;

use Moose;
use namespace::autoclean;
use URI;
use ULDE::Component::DiscountVoucher;
use ULDE::Component::Product::Instance;
use List::Util qw(first);

extends 'ULDE::Component';

has '+resultset'			=> ( default => 'Associate' );
has '+result_object'	=> ( handles => [qw(id name host img_logo css_class)] );

has discount_voucher 	=> ( is => 'rw', isa => 'ArrayRef[ULDE::Component::DiscountVoucher]', lazy_build => 1 );
has default_voucher 	=> ( is => 'rw', isa => 'ULDE::Component::DiscountVoucher | Bool', lazy_build => 1 );

has product_instance	=> ( is => 'rw', isa => 'ArrayRef[ULDE::Component::Product::Instance]', lazy_build => 1 );

sub _build_discount_voucher {
	my $self = shift;

	[map { ULDE::Component::DiscountVoucher->new({ code => $_->code }) } $self->result_object->discount_vouchers];
}

sub _build_default_voucher {
	my $self = shift;

	my $default_voucher = first { $_->default } $self->result_object->associate_discount_vouchers;

	$default_voucher ? first { $default_voucher->discount_voucher->code eq $_->code } @{$self->discount_voucher} : undef;
}

sub _build_product_instance {
	my $self = shift;

	[map { ULDE::Component::Product::Instance->new({ id => $_->id }) } $self->result_object->product_instances];
}

sub _build_attributes {
	my $self = shift;

	$self->discount_voucher($self->_build_discount_voucher);
	$self->default_voucher($self->_build_default_voucher);
	$self->product_instance($self->_build_product_instance);
}


override 'search' => sub {
	my $self = shift;

	$_[0]->{host} = { like => '%' . lc URI->new($_[0]->{host})->host . '%' } if $_[0]->{host};

	super;
};

sub is_voucher_valid {
# 0: voucher code

	my $self = shift;

	# returns false if voucher not marked as active or non existing

	first { $_[0] eq $_->code && $_->active } @{$self->discount_voucher};

}

__PACKAGE__->meta->make_immutable;

1;
