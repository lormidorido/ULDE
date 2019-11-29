package ULDE::Component::Communication;

use Moose;
use namespace::autoclean;
use ULDE::Component::Customer;
use ULDE::Component::Product::Instance;
use ULDE::Component::Message;

extends 'ULDE::Component';

has '+resultset'			=> ( default => 'Communication' );
has '+result_object'	=> ( handles => [qw(id active created)] );

has account										=> ( is => 'rw', isa => 'ULDE::Component::Account::Customer', lazy_build => 1);
has product 									=> ( is => 'rw', isa => 'ULDE::Component::Product::Instance | Bool', lazy_build => 1);
has message 									=> ( is => 'rw', isa => 'ArrayRef[ULDE::Component::Message]', lazy_build => 1);
has name 											=> ( is => 'rw', isa => 'Str', lazy_build => 1);
has unread_customer_msg_count => ( is => 'rw', isa => 'Int', lazy_build => 1 );

sub _build_account {
	my $self = shift; 
 
	ULDE::Component::Account::Customer->new({ id => $self->result_object->customer_account->id });
}

sub _build_product {
	my $self = shift;

	ULDE::Component::Product::Instance->new({ id => $self->result_object->product_instance->id }) if $self->result_object->product_instance;
}

sub _build_message {
	my $self = shift; 

	[sort {$a->created->epoch <=> $b->created->epoch } map { ULDE::Component::Message->new({ id => $_->id }) } $self->result_object->messages];
}

sub _build_name {
	my $self = shift;

	return $self->result_object->name ? $self->result_object->name : $self->product ? $self->product->name : '';
}

sub _build_unread_customer_msg_count {
	my $self = shift;

	scalar grep { $_->unread && !$_->customer } @{$self->message};
}

sub _build_attributes {
	my $self = shift;

	$self->account($self->_build_account);
	$self->product($self->_build_product);
	$self->message($self->_build_message);
	$self->name($self->_build_name);
	$self->unread_customer_msg_count($self->_build_unread_customer_msg_count);
}

sub add_message {
# 0: { reviewer || customer }
# 1: content

	my $self = shift;

	$self->create({ messages => { $_[0]->{customer} ? 'customer' : 'reviewer' => $_[0]->{customer} || $_[0]->{reviewer}, content => $_[1] }});

	$self->message($self->_build_message);
	return $self->return_newest_object($self->message) if defined wantarray;
}

__PACKAGE__->meta->make_immutable;

1;
