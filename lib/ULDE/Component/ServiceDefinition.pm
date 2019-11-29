package ULDE::Component::ServiceDefinition;

use Moose;
use namespace::autoclean;
use ULDE::Component::Product::ServiceDefinition;
use ULDE::Component::Provider;
use ULDE::Component::Account::Customer;
use ULDE::Component::LegalArea;
use ULDE::Component::Associate;
use ULDE::Component::ServiceDefinitionUrl;
use ULDE::Component::DiscountVoucher;
use List::Util qw(first);

extends 'ULDE::Component';

has '+resultset'			=> ( default => 'ServiceDefinition' );
has '+result_object'	=> ( handles => [qw(id)] );

has url 							=> ( is => 'rw', isa => 'ArrayRef[ULDE::Component::ServiceDefinitionUrl] | Str', lazy_build => 1);
has provider 					=> ( is => 'rw', isa => 'ULDE::Component::Provider', lazy_build => 1 );
has customer_account 	=> ( is => 'rw', isa => 'ArrayRef[ULDE::Component::Account::Customer]', lazy_build => 1 );
has product						=> ( is => 'rw', isa => 'ArrayRef[ULDE::Component::Product::ServiceDefinition]', lazy_build => 1 );
has legal_area 				=> ( is => 'rw', isa => 'ArrayRef[ULDE::Component::LegalArea]', lazy_build => 1 );
has associate					=> ( is => 'rw', isa => 'ArrayRef[ULDE::Component::Associate]', lazy_build => 1 );
has discount_voucher 	=> ( is => 'rw', isa => 'ArrayRef[ULDE::Component::DiscountVoucher]', lazy_build => 1 );
has default_voucher 	=> ( is => 'rw', isa => 'ULDE::Component::DiscountVoucher | Bool', lazy_build => 1 );

has include_inactive 	=> ( is => 'rw', isa => 'Bool', default => 0);


sub _build_url {
	my $self = shift; 

	[map { ULDE::Component::ServiceDefinitionUrl->new({ id => $_->id }) } $self->result_object->service_definition_urls];
}

sub _build_provider {
	my $self = shift; 

	ULDE::Component::Provider->new({ id => $self->result_object->provider->id });
}

sub _build_customer_account {
	my $self = shift; 

	[map { ULDE::Component::Account::Customer->new({ id => $_->id }) } $self->result_object->customer_accounts];
}

sub _build_product {
	my $self = shift; 

	[grep { $self->include_inactive || $_->active } map { ULDE::Component::Product::ServiceDefinition->new({ product => $_->id, service_definition => $self->id }) } $self->result_object->products];
}

sub _build_legal_area {
	my $self = shift; 

	[map { ULDE::Component::LegalArea->new({ id => $_->id }) } $self->result_object->legal_areas];
}

sub _build_associate {
	my $self = shift; 

	[map { ULDE::Component::Associate->new({ id => $_->id }) } $self->result_object->associates];
}

sub _delete_related {
	my $self = shift;
	
	$self->result_object->customer_accounts->delete;
}

sub _build_discount_voucher {
	my $self = shift;

	[map { ULDE::Component::DiscountVoucher->new({ code => $_->code }) } $self->result_object->discount_vouchers];
}

sub _build_default_voucher {
	my $self = shift;

	my $default_voucher = first { $_->default } $self->result_object->service_definition_discount_vouchers;

	$default_voucher ? first { $default_voucher->discount_voucher->code eq $_->code } @{$self->discount_voucher} : undef;
}


sub _build_attributes {
	my $self = shift;

	$self->provider($self->_build_provider);
	$self->customer_account($self->_build_customer_account);
	$self->product($self->_build_product);
	$self->legal_area($self->_build_legal_area);
	$self->associate($self->_build_associate);
	$self->url($self->_build_url);
	$self->discount_voucher($self->_build_discount_voucher);
	$self->default_voucher($self->_build_default_voucher);
}

override 'search' => sub {
# 0: search parameters

	my $self = shift;

	$_[0]->{url} ? 
		$self->SUPER::search({ id => ULDE::Component::ServiceDefinitionUrl->new({ name => $_[0]->{url} })->service_definition->id }) :
		super;
};

sub is_voucher_valid {
# 0: voucher code

	my $self = shift;

	first { $_[0] eq $_->code && $_->active } @{$self->discount_voucher}, map { @{$_->discount_voucher} } @{$self->associate};
}

__PACKAGE__->meta->make_immutable;

1;
