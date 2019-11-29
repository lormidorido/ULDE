package ULDE::Web::Controller::API::REST;
use Moose;
use namespace::autoclean;
use Data::Dumper;
use List::Util qw(first);

BEGIN { extends 'Catalyst::Controller::REST'; }

sub login :Local :Args(0) :ActionClass('REST') {}

sub login_POST {
	my ($self, $c) = @_;

	# must be a better way to do this!
	$c->req->params->{'login_user_name'} 	= $c->req->data->[0]->{value};
	$c->req->params->{'login_password'}		= $c->req->data->[1]->{value};

	$c->controller('Session::Authentication')->login($c);

	$self->status_ok(
	  $c,
	  entity => {
					success => $c->user_exists,
				}
	);

}

sub create_account :Local :Args(1) :ActionClass('REST') {}

# this routine should be moved to customer_POST
sub create_account_POST {
	my ($self, $c) = @_;

	# dirty conversartion to suitable perl hash - need to fix this when I got time.
	my $form_data = $c->req->args->[0] == 1 ? 
		{
			customers 		=> {	
				user_name		=> $c->req->data->[0]->{value},
				password 		=> $c->req->data->[1]->{value},
			}
		} :		
									$c->req->args->[0] == 2 ? 
		{
			customers 		=> {	
				user_name		=> $c->req->data->[0]->{value},
				password 		=> $c->req->data->[1]->{value},
				first_name 	=> $c->req->data->[3]->{value} || undef,
				surname 		=> $c->req->data->[4]->{value} || undef,
				dob 				=> $c->req->data->[5]->{value} || undef,
				addresses 	=> [{
					line_1 			=> $c->req->data->[6]->{value},
					line_2 			=> $c->req->data->[7]->{value} || undef,
					line_3 			=> $c->req->data->[8]->{value} || undef,
					town 				=> $c->req->data->[9]->{value},
					county 			=> $c->req->data->[10]->{value} || undef,
					postcode 		=> $c->req->data->[11]->{value},
					country 		=> $c->req->data->[12]->{value},
				}],
			}
		} :
		{
			foreign_account => 49,
			customers 		=> {
				first_name 			=> $c->req->data->[0]->{value} || undef,
				surname 				=> $c->req->data->[1]->{value} || undef,
				user_name				=> $c->req->data->[2]->{value}
			}
		}; 

	# validate data (trust client side validation for now)

	# prepare data structure
	my $account_data = $form_data;
#	delete $account_data->{customers}->{addresses} if $c->req->args->[0] == 1;

	# this should be moved to ULDE::Component::Account::Customer (associate handling and reviewer associaiton)
	$account_data->{id} = 0;
	$account_data->{service_definition} = $c->session->{params}->srv_def->{id};
	$account_data->{associate}->{RELATED_PK} = [$c->session->{params}->srv_def->{associate}->{id}] if $c->session->{params}->srv_def->{associate};

	my $reviewer = $c->model('Component::Reviewer',{ id => $c->user->id } ) if $c->user_in_realm('reviewer');
	$account_data->{associate}->{RELATED_PK} = [$reviewer->get_primary_responsibility->review_service->is_associate->id] if $c->user_in_realm('reviewer') && $reviewer->get_primary_responsibility->review_service->is_associate;

	# create account
	my $customer_account = $c->model('Component::Account::Customer', $account_data);

	$reviewer->associate_customer($customer_account->customer->[0]->id) if $c->user_in_realm('reviewer') && $customer_account->object_created;
	$self->status_ok(
	  $c,
	  entity => {
	  						success 								=> $customer_account->object_created,
	  						registration_result_src	=> $c->uri_for($c->controller('Widget::Modal')->action_for('get_modal_content'),['customer_registration', $customer_account->object_created ? 'registration_confirmation' : 'registration_failure',	$customer_account->object_created ? $customer_account->id : 0])
	  					}
	);

}

sub get_file :Local :Args(0) :ActionClass('REST') {}

sub get_file_GET {
	my ($self, $c) = @_;

}

sub rename :Local :Args(0) :ActionClass('REST') {}

sub rename_PUT {
	my ($self, $c) = @_;

}

sub doc_status :Local :Args(0) :ActionClass('REST') {}

sub doc_status_PUT {
	my ($self, $c) = @_;

	my $template_instance = $c->model('Component::Template::Instance', { id => $c->req->data->{id} });
	if ($template_instance->is_trial) {
		# change applies to product if template is trial and only possible shange is to 2 (activation)
		# need to remember that more than one template is affected when dealing with packs - i.e. more than one row in document table needs to be updated
		$template_instance->product_instance->change_status(2) unless $c->req->params->{change_to} != 2;
		$template_instance->refresh;
	} else {
		$template_instance->change_status($c->req->params->{change_to});
		$template_instance->sign_off if $c->req->data->{also_sign_off};
	}

	$self->status_ok(
    $c,
    entity => {
        status 	=> $template_instance->status->name,
        changes => 'status',
        data 		=> $self->get_row_data($c, $template_instance)
    }
  );
}

sub basket :Local :Args(1) :ActionClass('REST') {}

sub basket_GET {
	my ($self, $c) = @_;

	$self->status_ok(
    $c,
    entity => { basket_cost => $c->model('Component::Account::Customer', { id => $c->session->{params}->customer_account_id })->basket_cost($c->req->args->[0]) }
	);
}

sub payment :Local :Args(0) :ActionClass('REST') {}

sub payment_POST {
	my ($self, $c) = @_;

	my $payment_result = $c->model('Component::Account::Customer', { id => $c->session->{params}->customer_account_id })->process_basket_payment({
		name_on_card 			=> (first { $_->{name} =~ /name_on_card/ } 			@{$c->req->data})->{value},
		card_type 				=> (first { $_->{name} =~ /card_type/ } 				@{$c->req->data})->{value},
		card_number 			=> (first { $_->{name} =~ /card_number/ } 			@{$c->req->data})->{value},
		ccv 							=> (first { $_->{name} =~ /ccv/ } 							@{$c->req->data})->{value},
		issue_number 			=> (first { $_->{name} =~ /issue_number/ } 			@{$c->req->data})->{value},
		exp_date					=> (first { $_->{name} =~ /exp_date/ } 					@{$c->req->data})->{value} =~ /^(\d\d)\/(\d\d)$/ ? $1 . $2 : undef,
		start_date 				=> (first { $_->{name} =~ /start_date/ } 				@{$c->req->data})->{value} =~ /^(\d\d)\/(\d\d)$/ ? $1 . $2 : undef,
		address 					=> (first { $_->{name} =~ /line_1/ } 						@{$c->req->data})->{value} .
										 	 ${(first { $_->{name} =~ /line_2/ } 						@{$c->req->data})->{value} ? \(', ' . (first { $_->{name} =~ /line_2/ } @{$c->req->data})->{value}) : \'' } .
										 	 ${(first { $_->{name} =~ /line_3/ } 						@{$c->req->data})->{value} ? \(', ' . (first { $_->{name} =~ /line_3/ } @{$c->req->data})->{value}) : \'' } . ', ' . (first { $_->{name} =~ /town/ } @{$c->req->data})->{value},
		postcode 					=> (first { $_->{name} =~ /postcode/ } 					@{$c->req->data})->{value},
		discount_voucher 	=> (first { $_->{name} =~ /discount_voucher/ } 	@{$c->req->data})->{value}
	});

	$self->status_ok(
    $c,
    entity => { success 			=> $payment_result->{success} || $payment_result->{partial_success},
    						order_number 	=> $payment_result->{txns}->[0]->{order_number}, 											# display order number for first txn only
    						failed_txns 	=> $payment_result->{partial_success} ? map { @{$_->{product_instance_ids}} } grep { !$_->{success} } @{$payment_result->{txns}} : undef
    					}
	);
}

sub service_level :Local :Args(0) :ActionClass('REST') {}

sub service_level_PUT {
	my ($self, $c) = @_;

	my $service_level = $c->model('Component::Account::Customer', { id => $c->session->{params}->customer_account_id })->change_service_level($c->req->data->{instance_id}, $c->req->data->{service_level_id});

	$self->status_ok(
    $c,
    entity => { 
    						success 						=> $service_level ? 1 : 0,
    						price 							=> $service_level ? $service_level->price : undef,
    						service_level_name 	=> $service_level ? $service_level->name : undef,
    						instance_id 				=> $c->req->data->{instance_id}
    					 }
	);

}

sub customer :Local :Args(0) :ActionClass('REST') {}

# here should change template instance status and service level go (when I got time)
sub customer_PUT {
	my ($self, $c) = @_;

#	my $customer = $c->model('Component::Customer', { id => $c->req->data->{customer_id} });

	$c->session->{params}->customer_association($c->req->data->{customer_id}) if $c->req->data->{action} eq 'customer_association';

	$self->status_ok(
    $c,
    entity => { redirect_url => $c->req->data->{main_category} eq 'business' ? '/product/business' : '/product/personal' }
	);
}

sub template_instance :Local :Args(0) :ActionClass('REST') {}

# here should change template instance status and service level go (when I got time)
sub template_instance_PUT {
	my ($self, $c) = @_;

	my $template_instance = $c->model('Component::Template::Instance', { id => $c->req->data->{template_instance_id} });

	$template_instance->reactivate if $c->req->data->{action} eq 'reactivate';
	$template_instance->sign_off if $c->req->data->{action} eq 'sign_off';
	$template_instance->update({ name => $c->req->data->{new_name} }) if $c->req->data->{action} eq 'rename';

	$self->status_ok(
    $c,
    entity => { data => $self->get_row_data($c, $template_instance) }
	);
}

sub session :Local :Args(0) :ActionClass('REST') {}

sub session_PUT {
	my ($self, $c) = @_;

	$c->session->{params}->assembler_logon(1) if $c->req->data->{assembler_logon};

	$self->status_ok(
    $c,
    entity => { success => 1 }
	);
}

sub session_GET {
	my ($self, $c) = @_;

	$self->status_ok(
    $c,
    entity =>	{
    		assembler_logon => $c->session->{params}->assembler_logon,
#    		callback 				=> $c->req->data->{callback},
#    		callback_arg 		=> $c->req->data->{callback} ? eval('$c->session->{params}->' . $c->req->data->{callback_arg}) : undef
    					}
	);
}

sub reviewer :Local :Args(0) :ActionClass('REST') {}

sub reviewer_POST {
	my ($self, $c) = @_;

	my @errors;
	my $reviewer;
	my $code = $c->model('Component::Code')->new({ code => $c->req->data->[6]->{value} });

	push(@errors, 'user_name_exists') if $c->find_user({ user_name => $c->req->data->[2]->{value} }, 'reviewer');
	push(@errors, 'email_exists') 		if $c->model('Component::Reviewer')->search({ email => $c->req->data->[3]->{value} })->count;
	if (!$code->count) {
		push(@errors, 'reg_code_invalid');
	} elsif ($code->is_senior_code && $code->use_count > 0) {
		push(@errors, 'senior_code_used');
	}

	
	unless (@errors) {
		$reviewer = $c->model('Component::Reviewer')->new({
				id 									=> 0,
				first_name 					=> $c->req->data->[0]->{value},
				surname 						=> $c->req->data->[1]->{value},
				user_name 					=> $c->req->data->[2]->{value},
				email 							=> lc $c->req->data->[3]->{value},
				password 						=> $c->req->data->[4]->{value},
				registration_code 	=> $c->req->data->[6]->{value}
			});

		$reviewer->process_registration_code;

		$c->req->params->{'login_user_name'} 	= $c->req->data->[2]->{value};
		$c->req->params->{'login_password'}		= $c->req->data->[4]->{value};

		$c->controller('Session::Authentication')->login($c);
	}

	$self->status_ok(
    $c,
    entity => { id 												=> !scalar @errors ? $reviewer->id : undef,
    						errors 										=> scalar @errors,
    						registration_success_src 	=> !@errors ? $c->uri_for($c->controller('Widget::Modal')->action_for('get_modal_content'),['reviewer_account','reviewer_created', $reviewer->id]) : undef,
    						errors_src 								=> @errors ? $c->uri_for($c->controller('Widget::Modal')->action_for('get_modal_content'),['error_notification','reviewer_not_created', join(':::', @errors)]) : undef,
    						redirect_url 							=> !@errors ? $c->uri_for($c->controller('Admin::Root')->action_for('admin')) : undef
    					}
	);
}

sub product_instance :Local :Args(0) :ActionClass('REST') {}

sub product_instance_POST {
	my ($self, $c) = @_;

	my $basket_count;
	my $success;
	if ($c->user_in_realm('customer')) {
		my $account = $c->model('Component::Account::Customer', { id => $c->session->{params}->customer_account_id });
		$account->add_product_instance($c->req->data->{product_id}, $c->req->data->{service_level} || undef, undef, undef, $c->user->id,'customer');
		$basket_count = $account->basket_count;
		$success = 1;
	} elsif (!$c->user_exists) {
		$c->session->{params}->add_product($c->req->data->{product_id}, $c->req->data->{service_level} || undef, $c->req->data->{quantity} || undef);
		$basket_count = $c->session->{params}->product_count;
		$success = 1;
	} elsif ($c->user_in_realm('reviewer') && $c->session->{params}->customer_association) {
		my $account = $c->model('Component::Customer', { id => $c->session->{params}->customer_association})->account;
		$account->add_product_instance($c->req->data->{product_id}, $c->req->data->{service_level} || undef, undef, undef, $c->session->{params}->customer_association, 'reviewer');
		$success = 1;
	}

	$self->status_ok(
    $c,
    entity => {	basket_count 			=> $basket_count,
    						customer_id 			=> $c->user_in_realm('reviewer') ? $c->session->{params}->customer_association : undef,
    						product_added 		=> $success,
    						product_added_src => $success ? $c->uri_for($c->controller('Widget::Modal')->action_for('get_modal_content'),['product_list','product_added', $c->req->data->{product_id}]) : undef,
    						error_modal_src 	=> $success ? undef : $c->uri_for($c->controller('Widget::Modal')->action_for('get_modal_content'),['error_notification','product_not_added', $c->req->data->{product_id}])
    					}
	);
}

sub product_instance_PUT {
	my ($self, $c) = @_;

}

sub product_instance_DELETE {
	my ($self, $c) = @_;

	my $basket_count;
	my $success;
	if ($c->user_in_realm('customer')) {
		my $account = $c->model('Component::Account::Customer', { id => $c->session->{params}->customer_account_id });
		$account->remove_product_instance($c->req->data->{instance_id});
		$basket_count = $account->basket_count;
	} elsif (!$c->user_exists) {
		$c->session->{params}->remove_product($c->req->data->{product_id}, $c->req->data->{quantity} || undef);
		$basket_count = $c->session->{params}->product_count;
	} elsif ($c->user_in_realm('reviewer')) {
		my $template_instance = $c->model('Component::Template::Instance', { id => $c->req->data->{template_instance_id} });
		$success = $template_instance->product_instance->customer_account->remove_product_instance($template_instance->product_instance->id);
	}

	$self->status_ok(
    $c,
    entity => $c->user_in_realm('reviewer') ? { success => $success, sp_row_id => 'doc_' . $c->req->data->{template_instance_id} } : { basket_count => $basket_count }
	);
}

sub index :Path :Args(0) :ActionClass('REST') {
    my ( $self, $c ) = @_;

    $c->response->body('Matched ULDE::Web::Controller::API::REST in API::REST.');
}

### Table data ###

sub table_data :Local :Args(2) :ActionClass('REST') {}

sub table_data_GET {
	my ($self, $c) = @_;

	my $response_struct;

	if ($c->req->args->[0] eq 'template_instance') {
		foreach my $product_instance (	$c->user_in_realm('reviewer') ?
																		@{$c->model('Component::Reviewer', 					{ id => $c->user->id })->product_instance} :
																		@{$c->model('Component::Account::Customer', { id => $c->model('Component::Customer', { id => $c->user->id })->account->id })->product}
																	) {

			# temp hack to retrieve archived and pending sign off
			# need to simplify and move to product/template objects
			foreach (grep { 
								(!$c->req->args->[1] || $c->req->args->[1] == $_->status->id) && ($c->req->args->[1] == 6 || !$_->is_archived) && ($c->req->args->[1] != 4 || $c->user_in_realm('reviewer') && $_->product_instance->sign_off_required($c->user->id) && $_->is_signed_off || $c->user_in_realm('reviewer') && !$_->product_instance->sign_off_required($c->user->id || $c->user_in_realm('customer')))	|| 
								$c->req->args->[1] == 7 && $c->user_in_realm('reviewer') && $_->product_instance->sign_off_required($c->user->id) && !$_->is_signed_off || 
								$c->req->args->[1] == 6 && $_->is_archived
							}
							@{$product_instance->template_instance}) {
				push(@{$response_struct->{data}}, $self->get_row_data($c, $_));
			}
		}
	} elsif ($c->req->args->[0] eq 'customer') {
		foreach (@{$c->model('Component::Reviewer', { id => $c->user->id })->customer}) {
			push(@{$response_struct->{data}}, $self->get_row_data($c, $_));
		}
	}

	$self->status_ok(
    $c,
    entity => $response_struct || { data => [] }
	);
}

sub get_row_data : Private {
# 0: template_instance || customer

	my ( $self, $c ) = (shift, shift);

	if ($_[0]->obj_type =~ /Template::Instance/) {
		return {
			id 										=> $_[0]->id,
			DT_RowId 							=> 'doc_' . $_[0]->id,
			status 								=> $_[0]->is_trial ? 'trial' : $_[0]->status->name,
			display_status 				=> $c->user_in_realm('reviewer') && $_[0]->product_instance->sign_off_required($c->user->id) && !$_[0]->is_signed_off && $_[0]->status->id == 4 ? 'sign off' : $_[0]->is_trial ? 'trial' : $_[0]->status->name,
			status_id 						=> $_[0]->is_trial ? 1 : $_[0]->status->id,
			doc_name 							=> $_[0]->name,
			customer_name 				=> $_[0]->customer->salutation,
			last_update 					=> $_[0]->created->dmy('/'),
			assembler_src 				=> $_[0]->status->id == 2 || $c->user_in_realm('reviewer') && ($_[0]->status->id == 3 || $_[0]->status->id == 4 && $_[0]->product_instance->sign_off_required($c->user->id) && !$_[0]->is_signed_off && $c->check_user_roles( qw/can_sign_off/ ) ) ? $c->uri_for($c->controller('DocumentProduction')->action_for('assembler'),[$_[0]->product_instance->id, $_[0]->id, 1]) : 'javascript:false',
			activate_product_src 	=> $c->uri_for($c->controller('Widget::Modal')->action_for('get_modal_content'),[$c->user_in_realm('reviewer') ? 'document_review' : 'customer_account','activate_product',	$_[0]->id]),
			submit_doc_src 				=> $c->uri_for($c->controller('Widget::Modal')->action_for('get_modal_content'),[$c->user_in_realm('reviewer') ? 'document_review' : 'customer_account','submit_doc',	$_[0]->id]),
			return_doc_src 				=> $c->uri_for($c->controller('Widget::Modal')->action_for('get_modal_content'),['document_review','return_doc',	$_[0]->id]),
			complete_doc_src 			=> $c->uri_for($c->controller('Widget::Modal')->action_for('get_modal_content'),[$c->user_in_realm('reviewer') ? 'document_review' : 'customer_account','complete_doc',$_[0]->id]),
			cancel_doc_src 				=> $c->uri_for($c->controller('Widget::Modal')->action_for('get_modal_content'),['document_review','cancel_doc',	$_[0]->id]),
			archive_doc_src 			=> $c->uri_for($c->controller('Widget::Modal')->action_for('get_modal_content'),[$c->user_in_realm('reviewer') ? 'document_review' : 'customer_account','archive_doc',	$_[0]->id]),
			rename_doc_src 				=> $c->uri_for($c->controller('Widget::Modal')->action_for('get_modal_content'),[$c->user_in_realm('reviewer') ? 'document_review' : 'customer_account','rename_doc',	$_[0]->id]),
			sign_off_required_src	=> $c->uri_for($c->controller('Widget::Modal')->action_for('get_modal_content'),[$c->user_in_realm('reviewer') ? 'document_review' : 'customer_account','sign_off_required',	$_[0]->id]),
			sign_off_src 					=> $c->uri_for($c->controller('Widget::Modal')->action_for('get_modal_content'),[$c->user_in_realm('reviewer') ? 'document_review' : 'customer_account','sign_off_doc',	$_[0]->id]),
			reactivate_doc_src 		=> $c->uri_for($c->controller('Widget::Modal')->action_for('get_modal_content'),[$c->user_in_realm('reviewer') ? 'document_review' : 'customer_account','reactivate_doc',	$_[0]->id]),
	#		download_doc_src			=> $_[0]->product_instance->status->name eq 'completed' || $_[0]->product_instance->status->name eq 'archived' ? $c->uri_for($c->controller('DocumentProduction')->action_for('document'),['pdf',$_[0]->id]) : undef,
			download_doc_src			=> $_[0]->product_instance->status->name eq 'completed' || $_[0]->product_instance->status->name eq 'archived' ? $c->uri_for($c->controller('Widget::Modal')->action_for('get_modal_content'),[$c->user_in_realm('reviewer') ? 'document_review' : 'customer_account','download_doc',	$_[0]->id]) : undef,
			rest_change_status		=> $c->uri_for($c->controller('API::REST')->action_for('doc_status')),
			product_name 					=> $_[0]->product_instance->name,
			product_docs 					=> 1,
			service_level 				=> $_[0]->product_instance->service_level->name,
			product_options 			=> 'No options selected',
			legal_advice 					=> $c->user_in_realm('reviewer') ? 'No paid for legal advice request submitted' : "Click here to purchase legal advice",
			date_purchased 				=> $_[0]->is_trial ? '' : 'Off platform', # $_[0]->product_instance->purchase_txn ? $_[0]->product_instance->purchase_txn->date->dmy('/') : '',
			customer_login 				=> 'bookers@uklo.co.uk/halifax2',
			date_submitted 				=> 'N/A',
			date_completed 				=> '',
			review_included 			=> $_[0]->product_instance->service_level->includes_review,
			sign_off_required 		=> $c->user_in_realm('reviewer') && $_[0]->product_instance->sign_off_required($c->user->id),
			signed_off 						=> $c->user_in_realm('reviewer') && $_[0]->product_instance->sign_off_required($c->user->id) && $_[0]->is_signed_off,
			can_sign_off 					=> $c->user_in_realm('reviewer') && $c->check_user_roles( qw/can_sign_off/ ),
			can_reactivate 				=> $c->user_in_realm('reviewer') && $c->check_user_roles( qw/can_reactivate/),
			internal_office_use 	=> $_[0]->product_instance->service_level->internal_office_use ? 1 : 0,
			is_archived 					=> $_[0]->is_archived,
		};
	} elsif ($_[0]->obj_type =~ /Customer/) {
		return {
			id 										=> $_[0]->id,
			DT_RowId 							=> 'customer_' . $_[0]->id,
			status 								=> 'active',
			name 									=> $_[0]->full_name,
			date_created 					=> $_[0]->created->dmy('/'),
			salutation 						=> $_[0]->salutation,
			user_name 						=> $_[0]->user_name,
			product_count 				=> scalar @{$_[0]->account->product},
			password 							=> 'N/A',
			dob 									=> 'N/A',
			associate 						=> $_[0]->account->associate ? $_[0]->account->associate->name : '',
			add_product_src 			=> $c->uri_for($c->controller('Widget::Modal')->action_for('get_modal_content'),['customer_review','add_product',	$_[0]->id]),
			view_templates_src 		=> 'fsdfsdfsd',
			created_by 						=> $_[0]->created_by ? $_[0]->created_by->[0]->salutation : 'Customer'
		};
	}
}


__PACKAGE__->meta->make_immutable;

1;
