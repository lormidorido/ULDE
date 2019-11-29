package ULDE::Web::Controller::Widget::Modal;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

sub get_modal_content : Local : Args(3) {
	my ( $self, $c ) = @_;

	$c->stash(
		template 	=> 'widgets/modal',
	);

	if ($c->req->args->[0] eq 'document_review') {
		my $template_instance = $c->model('Component::Template::Instance', { id => $c->req->args->[2] });

		$c->stash(
			title 							=> $c->req->args->[1] eq 'submit_doc' 				&& 'Submit document for review' 																										||
														 $c->req->args->[1] eq 'return_doc' 				&& 'Return document to customer' 																										||
														 $c->req->args->[1] eq 'complete_doc' 			&& 'Mark document as completed'																											||
														 $c->req->args->[1] eq 'cancel_doc' 				&& ($template_instance->is_trial ? 'Delete trial product' : 'Cancel document')			||
														 $c->req->args->[1] eq 'archive_doc' 				&& 'Archive document'																																||
														 $c->req->args->[1] eq 'rename_doc' 				&& 'Rename document'																																||
														 $c->req->args->[1] eq 'activate_product' 	&& 'Activate product'																																||
														 $c->req->args->[1] eq 'reactivate_doc' 		&& ($template_instance->is_archived ? 'Unarchive Document' : 'Reactivate Document')	||
														 $c->req->args->[1] eq 'download_doc' 			&& $template_instance->name 																												||
														 $c->req->args->[1] eq 'sign_off_doc' 			&& 'Sign off document'																															||
														 $c->req->args->[1] eq 'sign_off_required'	&& 'Sign off required',

			data_options_submit => $c->req->args->[1] ne 'download_doc' ?
				{
					'sp-row-id' 			=> 'doc_' . $c->req->args->[2],
					'sp-template-id' 	=> $c->req->args->[2],
					'sp-change-to' 		=> $c->req->args->[1] eq 'submit_doc' 				&& 3 ||
															 $c->req->args->[1] eq 'activate_product'		&& 2 ||
															 $c->req->args->[1] eq 'return_doc'					&& 2 ||
															 $c->req->args->[1] eq 'complete_doc' 			&& 4 ||
															 $c->req->args->[1] eq 'cancel_doc' 				&& 5 ||
															 $c->req->args->[1] eq 'archive_doc' 				&& 6,
				} :
															undef,
			document_src 				=> $c->req->args->[1] eq 'download_doc' ? $c->uri_for($c->controller('DocumentProduction')->action_for('document'),['pdf',$c->req->args->[2]]) : undef,
			file_downloaded 		=> $c->req->args->[1] eq 'download_doc' && @{$template_instance->file} > 0 ? 1 : undef, # this will chnage when file handling has been finalised
			refresh_modal 			=> $c->req->args->[1] eq 'download_doc' && @{$template_instance->file} < 1 ? 1 : 0,
			bt_cancel 					=> $c->req->args->[1] eq 'download_doc' ? 'Close' : undef,
			no_bt_submit 				=> $c->req->args->[1] eq 'download_doc' ? 1 : undef,
			class_submit				=> $c->req->args->[1] eq 'cancel_doc' && $template_instance->is_trial ? [qw(delete_product)] :
														 $c->req->args->[1] eq 'reactivate_doc'															? [('reactivate_template', $template_instance->is_archived ? 'archived' : undef)] :
														 $c->req->args->[1] eq 'sign_off_doc'																? [qw(sign_off_template)] :
														 $c->req->args->[1] eq 'rename_doc'																	? [qw(rename_template)] :
														 ['change_status', $c->req->args->[1] eq 'complete_doc' && $c->check_user_roles( qw/can_sign_off/) && $template_instance->product_instance->sign_off_required($c->user->id) ? 'also_sign_off' : undef],
			class_cancel				=> [qw(close_modal)],
			bt_submit 					=> $c->req->args->[1] eq 'rename_doc' 																				? 'Rename' : 
														 $c->req->args->[1] eq 'activate_product' 																	? 'Activate' : 
														 $c->req->args->[1] eq 'reactivate_doc' && !$template_instance->is_archived	? 'Rectivate' : 
														 $c->req->args->[1] eq 'reactivate_doc' && $template_instance->is_archived	? 'Unarchive' : 
														 $c->req->args->[1] eq 'cancel_doc' && $template_instance->is_trial 				? 'Delete' : 
														 $c->req->args->[1] eq 'complete_doc' 																			? 'Complete' :
														 $c->req->args->[1] eq 'sign_off_required' 																	? 'Close' :
														 $c->req->args->[1] eq 'sign_off_doc' 																			? 'Sign off' :
														 undef,
			form_rename 				=> $c->req->args->[1] eq 'rename_doc' ? $c->model('Web::Component::Form::Template::Rename') : undef,		
			form_sign_off 			=> $c->req->args->[1] eq 'complete_doc' && $c->check_user_roles( qw/can_sign_off/) && $template_instance->product_instance->sign_off_required($c->user->id) ? $c->model('Web::Component::Form::Template::SignOff') : undef,
			context 						=> $c->req->args->[0],
			content 						=> $c->req->args->[1],
			customer_involved 	=> !$template_instance->product_instance->service_level->internal_office_use,
			template_instance 	=> $template_instance,
		);
	} elsif ($c->req->args->[0] eq 'customer_review') {
		my $customer = $c->model('Component::Customer', { id => $c->req->args->[2] });

		$c->stash(
			title 							=>	$c->req->args->[1] eq 'add_product' && 'Add product/s',

			data_options_submit =>
				{
					'sp-row-id' 			=> 'customer_' . $c->req->args->[2],
					'sp-customer-id' 	=> $c->req->args->[2],
				},
			class_submit				=> [qw(add_product)],
			class_cancel				=> [qw(close_modal)],
			bt_submit 					=> $c->req->args->[1] eq 'add_product' ? 'Proceed' :
														 undef,
			context 						=> $c->req->args->[0],
			content 						=> $c->req->args->[1],
			form_main_category 	=> $c->req->args->[1] eq 'add_product' ? $c->model('Web::Component::Form::Product::MainCategory') : undef,			
			customer 						=> $customer,
		);
	} elsif ($c->req->args->[0] eq 'customer_account') {
		my $template_instance = $c->model('Component::Template::Instance', { id => $c->req->args->[2] });
		$c->stash(
			title 							=> $c->req->args->[1] eq 'submit_doc' 	&& 'Submit document for review' 	||
														 $c->req->args->[1] eq 'complete_doc' && 'Mark document as completed'		||
														 $c->req->args->[1] eq 'archive_doc' 	&& 'Archive document' 						||
														 $c->req->args->[1] eq 'rename_doc' 	&& 'Rename document'							||
														 $c->req->args->[1] eq 'download_doc' && $template_instance->name,
			class_submit				=> [qw(change_status)],
			class_cancel				=> [qw(close_modal)],
			context 						=> $c->req->args->[0],
			content 						=> $c->req->args->[1],
			template_instance 	=> $template_instance
		);

		$c->req->args->[1] ne 'download_doc' ?
			$c->stash->{data_options_submit} = {
				'sp-row-id' 			=> 'doc_' . $c->req->args->[2],
				'sp-change-to' 		=> $c->req->args->[1] eq 'submit_doc' 	&& 3 ||
														 $c->req->args->[1] eq 'complete_doc' && 4 ||
														 $c->req->args->[1] eq 'archive_doc' 	&& 6
				}:
			$c->stash->{document_src} = $c->uri_for($c->controller('DocumentProduction')->action_for('document'),['pdf',$c->req->args->[2]]),
#			$c->stash->{bt_submit} 		= 'Save',
			$c->stash->{bt_cancel} 		= 'Close',
			$c->stash->{no_bt_submit} = 1;

	} elsif ($c->req->args->[0] eq 'assembler') {
		$c->stash(
			title 							=> $c->req->args->[1] eq 'submit_doc' 	&& 'Submit document for review' 	||
														 $c->req->args->[1] eq 'complete_doc' && 'Mark document as completed'		||
														 $c->req->args->[1] eq 'loading' 			&& 'Assembler starting up...',
			data_options_submit => {
				'sp-redirect-url' 		=> $c->req->args->[2] ? $c->uri_for('/account/documents', undef, { change_status_to => ${ $c->req->args->[1] eq 'submit_doc' ? \3 : \4}, instance_id => $c->req->args->[2] }) : undef
			},
			class_submit				=> [qw(change_status)],
			class_cancel				=> [qw(close_modal)],
			no_bt_submit				=> $c->req->args->[1] eq 'loading' ? 1 : undef,
			context 						=> $c->req->args->[0],
			content 						=> $c->req->args->[1],
			bt_cancel 					=> $c->req->args->[1] eq 'loading' ? 'Close' : undef,
			template_instance 	=> $c->req->args->[2] ? $c->model('Component::Template::Instance', { id => $c->req->args->[2] }) : undef
		);
	} elsif ($c->req->args->[0] eq 'customer_registration') {
		$c->stash(
			title 							=> $c->req->args->[1] eq 'registration_confirmation' 	&& 'Registration confirmation' 		||
														 $c->req->args->[1] eq 'registration_failure' 			&& 'Account registration failed'	||
														 $c->req->args->[1] eq 'consent_declaration' 				&& 'Consent declaration',
			class_cancel				=> [qw(close_modal)],
			no_bt_submit				=> $c->req->args->[1] eq 'consent_declaration' ? 0 : 1,
			class_submit				=> [qw(consent_given)],
			bt_submit 					=> 'Accept',
			bt_cancel 					=> $c->req->args->[1] eq 'consent_declaration' ? 'Reject' : 'Close',
			context 						=> $c->req->args->[0],
			content 						=> $c->req->args->[1],
			customer_account 		=> $c->req->args->[2] ? $c->model('Component::Account::Customer', { id => $c->req->args->[2] }) : undef
		);
	} elsif ($c->req->args->[0] eq 'quick_registration') {
		$c->stash(
			title 							=> 'Try before you buy',
			class_cancel				=> [qw(no_account)],
			class_submit				=> [qw(quick_registration)],
			bt_submit 					=> 'Sign in/Register',
			bt_cancel 					=> 'Register later',
			context 						=> $c->req->args->[0],
			content 						=> $c->req->args->[1],
			form_registration 	=> $c->model('Web::Component::Form::Account::Register')
		);
	} elsif ($c->req->args->[0] eq 'basket') {
		$c->stash(
			title 							=> $c->req->args->[1] eq 'process_payment' 		&& 'Processing payment'																	||
														 $c->req->args->[1] eq 'payment_failed' 		&& 'Payment failed' 																		||
														 $c->req->args->[1] eq 'voucher_valid'	 		&& "Voucher '" . $c->req->args->[2] . "' worked!" 			||
														 $c->req->args->[1] eq 'voucher_invalid' 		&& "Voucher '" . $c->req->args->[2] . "' is not valid"	||	
														 $c->req->args->[1] eq 'login_required' 		&& 'Account required',	
			class_cancel				=> [qw(close_modal)],
			no_bt_submit				=> 1,
			bt_cancel 					=> $c->req->args->[1] eq 'payment_failed' ? 'Review details' : 'Close',
			context 						=> $c->req->args->[0],
			content 						=> $c->req->args->[1],
			voucher 						=> $c->req->args->[1] eq 'voucher_valid' && $c->req->args->[2] ? $c->model('Component::DiscountVoucher', { code => $c->req->args->[2] }) : undef
		);
	} elsif ($c->req->args->[0] eq 'error_notification') {
		$c->stash(
			title 							=> $c->req->args->[1] eq 'product_not_added'		&& 'Failed to add product' ||
														 $c->req->args->[1] eq 'reviewer_not_created'	&& 'Failed to create account',
			class_cancel				=> [qw(close_modal)],
			no_bt_submit				=> 1,
			bt_cancel 					=> 'Close',
			context 						=> $c->req->args->[0],
			content 						=> $c->req->args->[1],
			product 						=> $c->req->args->[1] eq 'product_not_added' 		? $c->model('Component::Product', 	{ id => $c->req->args->[2] } ) : undef,
			errors 							=> $c->req->args->[1] eq 'reviewer_not_created' ? [split(':::', $c->req->args->[2])] : undef,
		);
	} elsif ($c->req->args->[0] eq 'reviewer_account') {
		my $reviewer = $c->model('Component::Reviewer', { id => $c->req->args->[2] });
		$c->stash(
			title 							=> 'Account created!',
			class_cancel				=> [qw(close_modal)],
			no_bt_submit				=> 1,
			bt_cancel 					=> 'Close',
			context 						=> $c->req->args->[0],
			content 						=> $c->req->args->[1],
			reviewer 						=> $reviewer
		);
	} elsif ($c->req->args->[0] eq 'product_list') {
		my $product = $c->model('Component::Product', 	{ id => $c->req->args->[2] });
		$c->stash(
			title 							=> 'Product succesfully added',
			class_cancel				=> [qw(close_modal)],
			no_bt_submit				=> 1,
			bt_cancel 					=> 'Close',
			context 						=> $c->req->args->[0],
			content 						=> $c->req->args->[1],
			product 						=> $product
		);		
	}
}

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->response->body('Matched ULDE::Web::Controller::Widget::Modal in Widget::Modal.');
}


__PACKAGE__->meta->make_immutable;

1;
