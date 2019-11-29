package ULDE::Component::Account::Customer;

use Moose;
use Moose::Util::TypeConstraints;
use namespace::autoclean;
use ULDE::Component::ServiceDefinition;
use ULDE::Component::Customer;
use ULDE::Component::Product::Instance;
use ULDE::Component::ForeignAccount;
use ULDE::Component::Associate;
use ULDE::Component::PurchaseTransaction;
use ULDE::Component::Communication;
use List::Util qw(first sum min);

extends 'ULDE::Component::Account';

class_type 'ULDE::Component::ServiceDefinition';

has '+resultset'			=> ( default => 'CustomerAccount' );
has '+result_object'	=> ( handles => [qw(created status customers business_name)] );

has service_definition				=> ( is => 'rw', isa => 'ULDE::Component::ServiceDefinition | Int', lazy_build => 1 );
has customer 									=> ( is => 'rw', isa => 'ArrayRef[ULDE::Component::Customer]', lazy_build => 1);
has product 									=> ( is => 'rw', isa => 'ArrayRef[ULDE::Component::Product::Instance]', lazy_build => 1);
has product_h 								=> ( is => 'rw', isa => 'HashRef[ULDE::Component::Product::Instance]', lazy_build => 1);
# has foreign_account 					=> ( is => 'rw', isa => 'ArrayRef[ULDE::Component::ForeignAccount]', lazy_build => 1);
has foreign_account 					=> ( is => 'rw', isa => 'ULDE::Component::ForeignAccount | Int', lazy_build => 1);
has associate 								=> ( is => 'rw', isa => 'ULDE::Component::Associate | Bool | HashRef', lazy_build => 1);
has communication 						=> ( is => 'rw', isa => 'ArrayRef[ULDE::Component::Communication]', lazy_build => 1);
has unread_customer_msg_count => ( is => 'rw', isa => 'Int', lazy_build => 1 );
has active_thread_count				=> ( is => 'rw', isa => 'Int', lazy_build => 1 );

# forkable methods
around [qw(create_foreign_account)] => sub {
	my $orig = shift;
  my $self = shift;

  $self->fork_me($orig,@_);
};

sub _build_service_definition {
	my $self = shift;
 
	ULDE::Component::ServiceDefinition->new({ id => $self->result_object->service_definition->id });
}

sub _build_customer {
	my $self = shift;

	[map { ULDE::Component::Customer->new({ id => $_->id }) } $self->result_object->customers];
}

sub _build_product {
	my $self = shift;

	[map { ULDE::Component::Product::Instance->new({ id => $_->id }) } $self->result_object->product_instances];
}

sub _build_product_h {
	my $self = shift; 

	my %struct;
	@struct{ map {$_->id} $self->result_object->product_instances} = (map { ULDE::Component::Product::Instance->new({ id => $_->id }) } $self->result_object->product_instances);

	return \%struct;
}

sub _build_foreign_account {
	my $self = shift;

#	[map { ULDE::Component::ForeignAccount->new({ id => $_->id }) } $self->result_object->foreign_accounts];
	ULDE::Component::ForeignAccount->new({ id => $self->result_object->foreign_account->id }) ;
}

sub _build_associate {
	my $self = shift;

	$self->result_object->associate ? ULDE::Component::Associate->new({ id => $self->result_object->associate->id }) : undef;
}

sub _build_communication {
	my $self = shift;

	[sort { $a->created->epoch <=> $b->created->epoch } map { ULDE::Component::Communication->new({ id => $_->id }) } $self->result_object->communications];
}

sub _build_unread_customer_msg_count {
	my $self = shift;

	scalar grep { $_->unread && !$_->customer } map { @{$_->message} } grep { $_->active } @{$self->communication};
}

sub _build_active_thread_count {
	my $self = shift;

	scalar grep { $_->active } @{$self->communication};
}

sub _delete_related {
	my $self = shift;
	
	$self->result_object->customers->delete;
}

sub _build_attributes {
	my $self = shift;

	$self->customer($self->_build_customer);
	$self->service_definition($self->_build_service_definition);
	$self->product($self->_build_product);
	$self->foreign_account($self->_build_foreign_account);
	$self->product($self->_build_product);
	$self->communication($self->_build_communication);
	$self->unread_customer_msg_count($self->_build_unread_customer_msg_count);
	$self->unread_active_thread($self->_build_active_thread_count);
}

# this funciton should be moved to the service def object where it belongs! Not sure what I was thinking....
around 'create' => sub {
# 0: columns

  my $orig = shift;
  my $self = shift;

  if ($self->result_object) {
  	# we are not creating a new object but related ones
  	$self->$orig(@_);
  } else {
	  # check if customer exists & create object
	  $self->$orig(@_) unless ULDE::Component::Customer->new( {user_name => $_[0]->{customers}->{user_name} })->count;

	  if ($self->object_created) {
		  # create foreign account
##		  $self->create_foreign_account($_[0]->{customers}->{user_name},'fork')
#		  my $random_password = $self->generate_random_password;
#		  $self->assembler->create_quick_account([$_[0]->{customers}->{user_name}, $random_password]);
#		  $self->create({ foreign_accounts => { foreign_user_name => $_[0]->{customers}->{user_name}, foreign_password => $random_password, foreign_provider => 1, foreign_account_id => $self->assembler->response->{client_id} } }) if $self->assembler->success;
		}
	}
};

sub create_foreign_account {
# 0: user_name

	my $self = shift;

  my $random_password = $self->generate_random_password;
  $self->assembler->create_quick_account([$_[0], $random_password]);
  $self->create({ foreign_accounts => { foreign_user_name => $_[0], foreign_password => $random_password, foreign_provider => 1, foreign_account_id => $self->assembler->response->{client_id} } }) if $self->assembler->success;
}

sub add_communication_thread {
# 0: product_id

	my $self = shift;

	$self->create({ communications => { product_instance => $_[0] }});

	$self->communication($self->_build_communication);
	return $self->return_newest_object($self->communication) if defined wantarray;
}

sub add_product_instance {
# 0: product_id
# 1: service_level || default service_level
# 2: quantity || 1
# 3: status || 1
# 4: customer_id
# 5: 'customer' || 'reviewer' (specifies who is adding the product instance)

	my $self = shift;

	# quantity scrapped - always equiates to 1 - actually, can just add multiple entries instead of increasing quantity attribute count! May also be different SLs wanted
	my $service_level = $_[1] ? first { $_->id == $_[1] } @{(first { $_->id == $_[0] } @{$self->service_definition->product})->service_level} : (first { $_->id == $_[0] } @{$self->service_definition->product})->get_default_service_level($_[5]);
	my $columns = { product_instances => { 
										product 						=> $_[0],
										service_level 			=> $_[1] || $service_level->id,
										quantity 						=> $_[2] || 1,
										status 							=> $_[3] || $service_level->default_product_instance_status,
										service_definition 	=> $self->service_definition->id,
										associate 					=> $self->associate ? $self->associate->id : undef
								}};

	$self->create($columns);

	$self->product($self->_build_product);

	my $new_product_instance = $self->return_newest_object($self->product);

	foreach (@{$new_product_instance->product->template}) {
		$new_product_instance->create_template_instance($_->id,$_[4],'fork');
	}

	return $new_product_instance if defined wantarray;
}

# this method should be in Product::Instance as it chnages it's state
sub change_service_level {
# 0: instance_id
# 1: service_level

	my $self = shift;

	if ($self->product_h->{$_[0]}) {
		$self->product_h->{$_[0]}->update({ service_level => $_[1] });
		return $self->product_h->{$_[0]}->service_level;
	} else {
		return undef;
	}
}

sub remove_product_instance {
# 0: instance_id

	my $self = shift;

	# only delete if product instance is trial
	if ($self->product_h->{$_[0]} && $self->product_h->{$_[0]}->status->id == 1) {

		# delete trial documents in assembler
		foreach my $template_instance (@{$self->product_h->{$_[0]}->template_instance}) {
			$self->assembler->delete_document($template_instance->foreign_id, 'fork');
		}
		$self->product_h->{$_[0]}->delete;
		return $_[0];
	} else {
		return 0;
	}
}

sub get_session_basket {
	my $self = shift;


}

sub basket {
	my $self = shift;

	# get product from product instance
	[grep { $_->status->id == 1 } @{$self->product}];
}

sub basket_count {
	my $self = shift;

	scalar grep { $_->status->id == 1 } @{$self->product};
}

sub basket_cost {
# 0: voucher code
# 1: product_instance_id (optional)

	my $self = shift;

	my $struct;
	$struct->{product_instance_ids}	= [map { $_->id } grep { !$_[1] || $_[1] == $_->id } @{$self->basket}];
	$struct->{total_with_vat}				= $self->two_decimals(sum map { (my $price = $_->price) =~ s/^.//; $price } map { $_->service_level } grep { !$_[1] || $_[1] == $_->id } @{$self->basket});
	$struct->{sub_total}						= $self->two_decimals($struct->{total_with_vat} / 1.2);
	$struct->{vat_amount}						= $self->two_decimals($struct->{total_with_vat} - $struct->{sub_total});
	$struct->{voucher_discount}			= !$_[0] ? undef : 
																		$self->associate ? $self->associate->is_voucher_valid($_[0]) : 					
																		!$self->associate ? $self->service_definition->is_voucher_valid($_[0]) : 	
																		undef;
	$struct->{voucher_discount}			= $struct->{voucher_discount} ? { code => $struct->{voucher_discount}->code, fraction => $struct->{voucher_discount}->discount , percentage => ($struct->{voucher_discount}->discount * 100) . '%' } : undef;
	$struct->{global_discount}			= $struct->{voucher_discount} ? undef : 
																		$self->associate && $self->associate->default_voucher ? { code => $self->associate->default_voucher->code, fraction => $self->associate->default_voucher->discount, percentage => ($self->associate->default_voucher->discount * 100) . '%' } : 
																		!$self->associate && $self->service_definition->default_voucher ? { code => $self->service_definition->default_voucher->code, fraction => $self->service_definition->default_voucher->discount, percentage => ($self->service_definition->default_voucher->discount * 100) . '%' } : 
																		undef;
	$struct->{discount_amount} 			= $struct->{voucher_discount} ? $self->two_decimals($struct->{voucher_discount}->{fraction} * $struct->{total_with_vat}) : $struct->{global_discount} ? $self->two_decimals($struct->{total_with_vat} * $struct->{global_discount}->{fraction}) : undef;
	$struct->{total_with_discount}	= $self->two_decimals($struct->{total_with_vat} - $struct->{discount_amount}) if $struct->{discount_amount};

	return $struct;
}

sub process_basket_payment {
# 0: payment_details

	my $self = shift;

	my $payment_status;
	$payment_status->{success} 			= 1;
	$payment_status->{basket_cost} 	= $self->basket_cost($_[0]->{discount_voucher} || undef);
	$payment_status->{basket_count} = $self->basket_count;

	# currently create one purchase transaction per product as using EPOQ's payment system  not ideal but there you go
	# cannot handle packs currently - assume always one template per product for now
	# always assume there exists a trial template instance
	foreach my $product_instance (@{$self->basket}) {
		push(@{$payment_status->{txns}}, $self->basket_cost($_[0]->{discount_voucher} || undef, $product_instance->id));

		my %payment_details = %{$_[0]};
		$payment_details{discount_voucher}	= $payment_status->{txns}->[-1]->{voucher_discount} ? $payment_status->{txns}->[-1]->{voucher_discount}->{code} : $payment_status->{txns}->[-1]->{global_discount} ? $payment_status->{txns}->[-1]->{global_discount}->{code} : undef;
		$payment_details{voucher_discount} 	= $payment_status->{txns}->[-1]->{voucher_discount} ? do { $payment_status->{txns}->[-1]->{voucher_discount}->{percentage} =~ /^(.*?)%$/; $1 } :
																					$payment_status->{txns}->[-1]->{global_discount} ? do { $payment_status->{txns}->[-1]->{global_discount}->{percentage} =~ /^(.*?)%$/; $1 } :
																					undef;
		$payment_details{amount} 						= $payment_status->{txns}->[-1]->{total_with_discount} || $payment_status->{txns}->[-1]->{total_with_vat};
		
		my $sl 															= $product_instance->get_service_level;
		$payment_details{ele_option_id} 		= $sl->ele_service_option->foreign_id if $sl->ele_service_option;
 
 		$self->assembler->purchase_product(
#			$self->foreign_account->[0]->foreign_login_details,
			$self->foreign_account->foreign_login_details,
			$product_instance->template_instance->[0]->template->foreign_id,
			$product_instance->template_instance->[0]->foreign_id,
			\%payment_details
		) if $payment_status->{success};
	
		if ($payment_status->{success} && ($payment_status->{txns}->[-1]->{success} = $self->assembler->success)) {
			# need to add relevant sl if needed
			$product_instance->change_status(2);
			$product_instance->update({
						sub_total 		=> $payment_status->{txns}->[-1]->{sub_total},
						vat_amount 		=> $payment_status->{txns}->[-1]->{vat_amount},
						total 				=> $payment_status->{txns}->[-1]->{total_with_vat},
						service_level => $sl->id
			});


			$payment_status->{txns}->[-1]->{reference_number} = $self->assembler->response->{reference};
			$payment_status->{txns}->[-1]->{order_number} 		= $self->assembler->response->{order_number};

			my $purchase_txn = ULDE::Component::PurchaseTransaction->new({
				id 								=> 0,
				order_number			=> $payment_status->{txns}->[-1]->{order_number},
				reference_number 	=> $payment_status->{txns}->[-1]->{reference_number},
				sub_total 				=> $payment_status->{txns}->[-1]->{sub_total},
				vat_amount 				=> $payment_status->{txns}->[-1]->{vat_amount},
				total 						=> $payment_status->{txns}->[-1]->{total_with_vat},
				discount_amount 	=> $payment_status->{txns}->[-1]->{discount_amount},
				payable 					=> $payment_status->{txns}->[-1]->{discount_amount} ? $payment_status->{txns}->[-1]->{total_with_discount} : $payment_status->{txns}->[-1]->{total},
				discount_voucher 	=> $payment_status->{txns}->[-1]->{voucher_discount} ? $payment_status->{txns}->[-1]->{voucher_discount}->{code} : $payment_status->{txns}->[-1]->{global_discount} ? $payment_status->{txns}->[-1]->{global_discount}->{code} : undef,
		  });

			$product_instance->create({ purchase_transaction => { RELATED_PK => [$purchase_txn->id] } });

		} else {
			$payment_status->{decline_reason} = $self->assembler->response->{decline_reason} if $payment_status->{success};
			$payment_status->{decline_reason} = 'Payment not authorised' if !$payment_status->{decline_reason} || $payment_status->{decline_reason} =~ /Do Not Honor/;
			$payment_status->{success} = undef;
		}
	}

	$payment_status->{partial_success} 	= 1 if !$payment_status->{success} && first { $_->{success} } @{$payment_status->{txns}};
	# calculate new subtotal, vat and total if partial success
	
	$self->clear_assembler;

	return $payment_status;
}

__PACKAGE__->meta->make_immutable;

1;