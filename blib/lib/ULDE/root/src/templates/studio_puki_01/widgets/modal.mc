<%class>
    CLASS->no_wrap;
</%class>


<div class="sp-modal">
  <h3><% $c->stash->{title} %></h3>
  <div class="modal_content">
%		if ($c->stash->{content} eq 'submit_doc') {
%			if ($c->user_in_realm('reviewer')) {
				<p>Are you sure you want to changes the status of "<% $c->stash->{template_instance}->name %>" to <span class="status review">Review</span> for <span class="salutation"><% $c->stash->{template_instance}->customer->salutation %></span> (<% $c->stash->{template_instance}->customer->user_name %>)? This is normally done by the customer.</p>
				<p>Please note that the customer will no longer be able to edit the document after it has been submitted for <span class="status review">Review</span>.</p>
				<p>Do you wish to inform the customer that the document has been submitted for review?</p>
% 		} elsif ($c->user_in_realm('customer') && $c->stash->{context} eq 'customer_account') {
				<p>Are you sure you have answered all relevant questions in the document assembler and are ready to submit document <span class="instance_name">'<% $c->stash->{template_instance}->name %>'</span> for review? Do not worry though, our legal experts will notify you should there be any questions you may have missed.</p>
				<p>Once you have submitted the document for review, one of our legal experts will be in contact shortly. It is normally within 4 working hours. You will then be notified whether the document is complete or if further augmentations are required.</p>
% 		} elsif ($c->user_in_realm('customer') && $c->stash->{context} eq 'assembler') {
				<p>Are you sure you have answered all relevant questions and are ready to submit document <span class="instance_name">'<% $c->stash->{template_instance}->name %>'</span> for review? Do not worry though, our legal experts will notify you should there be any questions you may have missed.</p>
				<p>Once you have submitted the document for review, one of our legal experts will be in contact shortly. It is normally within 4 working hours. You will then be notified whether the document is complete or if further augmentations are required.</p>
				<p>You will be rediredted to your <span class="my_uklo_head">My UKLO</span> <span class="my_uklo_area">documents</span> area after submitting the document for review where you can manage your documents.</p> 
%			}
%		} elsif ($c->stash->{content} eq 'add_product') {
			<p>You are about to associate product/s with customer <span class="salutation"><% $c->stash->{customer}->salutation %></span>. Any products you choose in the product area will be added to <span class="salutation"><% $c->stash->{customer}->salutation %></span>'s account.</p>
			<p>You will be redirected to the product pages should you wish to proceed. Please specify whether to access the personal or business product pages:</p>
			<% $c->stash->{form_main_category}->render_start %>
			<% $c->stash->{form_main_category}->field('main_category')->render %>
			<% $c->stash->{form_main_category}->render_end %>
%		} elsif ($c->stash->{content} eq 'activate_product') {
			<p>You are about to <span class="status active">activate</span> product "<% $c->stash->{template_instance}->product_instance->name %>" for <span class="salutation"><% $c->stash->{template_instance}->customer->salutation %></span> (<% $c->stash->{template_instance}->customer->user_name %>).</p>
			<p>Please note that you are <span class="status active">activating</span> a product as opposed to an individual document. That is, all documents and services associated with the product will be <span class="status active">activated</span>. You are also bypassing the online purchase process and, hence, alternative off platform payment arrangements may be required.</p>
			<p>By <span class="status active">activating</span> the product no associated automatic procedures will be bypassed such as the provision of your terms of engagament to the customer. However, you can explicitly deactivate any such automated procedures below but, in order to remain compliant, please make alternative arrangements.</p>
			<p>Do you wish to bypass any automatic procedures associated with <span class="status active">activating</span> product "<% $c->stash->{template_instance}->product_instance->name %>"?</p>
			<p>Do you wish to notify the customer that the product "<% $c->stash->{template_instance}->product_instance->name %>" has been <span class="status active">activated?</span></p>
%		} elsif ($c->stash->{content} eq 'sign_off_required') {
			<p>This document cannot be downloaded before it has been signed off by a member of staff authorised to do so.</p>
%			if ($c->check_user_roles( qw/can_sign_off/ )) {
				<p>You are authorised to sign off documents. Please make sure you have reviewed the document by clicking on the edit document icon prior to signing it off.</p>
% 		} else {
				<p>Do you wish to notify relevant memmber of staff that this document is pending sign off?</p>
%			}			
%		} elsif ($c->stash->{content} eq 'sign_off_doc') {
			<p>You are about to sign off document "<% $c->stash->{template_instance}->name %>" for <span class="salutation"><% $c->stash->{template_instance}->customer->salutation %></span> (<% $c->stash->{template_instance}->customer->user_name %>). The document will be made available to download if you proceed.</p>
%			if ($c->stash->{customer_involved}) {
				<p>Do you you wish to notify the customer that the document has been signed off and ready is for download?</p>
%			} else {
% #				<p>Do you you wish to notify relevant member of staff that the document has been signed off and is ready for download?</p>
%			}
%		} elsif ($c->stash->{content} eq 'reactivate_doc') {
%			if ($c->stash->{template_instance}->is_archived) {
				<p>You are about to unarchive document "<% $c->stash->{template_instance}->name %>" for <span class="salutation"><% $c->stash->{template_instance}->customer->salutation %></span> (<% $c->stash->{template_instance}->customer->user_name %>). The document will be moved to your main document list.</p>
%			} else {

				<p>You are about to reactivate document "<% $c->stash->{template_instance}->name %>" for <span class="salutation"><% $c->stash->{template_instance}->customer->salutation %></span> (<% $c->stash->{template_instance}->customer->user_name %>).</p>
%				if (!$c->stash->{template_instance}->product_instance->service_level->includes_review && $c->stash->{customer_involved}) {
					<p>Please note that this document is intended to be managed by the customer unaided. You are, therefore, deviating from the normal processing of this type of document by reactivating it.</p>
%				} elsif ($c->stash->{customer_involved}) {
					<p>This is a legal expert review based document and, hence, by reactivating it will be returned to the review stage. That will enable you to edit it but not the customer. If you wish augmentations to be made by the customer you need to explicitly return it to the customer for further editing once it has been reactivated.</p>
%	 				if ($c->stash->{template_instance}->product_instance->sign_off_required($c->user->id)) {
%						if ($c->stash->{template_instance}->is_signed_off) {
							<p>This document is required to be, and has already been, signed off. Reactivating it, therfore, will require it to go through the sign off process again.</p>
%						}
%					}
%				}
%				if ($c->user_in_realm('reviewer') && $c->check_user_roles( qw/can_sign_off/ ) && !$c->stash->{template_instance}->is_archived) {
%	#				<p>Do you wish to notify person working on the document that it has been reactivated?</p>
%				}
%			}
%		} elsif ($c->stash->{content} eq 'download_doc') {
%			if ($c->stash->{file_downloaded}) {
				<iframe frameborder="0" seamless id="download_document" src="<% $c->stash->{document_src} %>"></iframe> 
% 		} else {
				<p>The document "<% $c->stash->{template_instance}->name %>" is being assembled and will be available shortly. It normally takes no more than half a minute to assemble. Please try to access the document again in 15 seconds or so.</p>
%	}
%		} elsif ($c->stash->{content} eq 'rename_doc') {
			<p>You are about to rename document "<% $c->stash->{template_instance}->name %>" for <span class="salutation"><% $c->stash->{template_instance}->customer->salutation %></span> (<% $c->stash->{template_instance}->customer->user_name %>).</p>
			<p>If you do not enter a new name the document will revert to its default name.</p>
			<% $c->stash->{form_rename}->render_start %>
			<% $c->stash->{form_rename}->field('new_name')->render %>
			<% $c->stash->{form_rename}->render_end %>
%			if ($c->stash->{customer_involved}) {
				<p>Do you wish to notify the customer that the document has been renamed?</p>
%			}
			<script type="text/javascript">$(document).ready(function(){ $(document).foundation('abide', 'reflow'); });</script>
%		} elsif ($c->stash->{content} eq 'return_doc') {
			<p>Are you sure you want to return the document "<% $c->stash->{template_instance}->name %>" to <span class="salutation"><% $c->stash->{template_instance}->customer->salutation %></span> (<% $c->stash->{template_instance}->customer->user_name %>) for further editing?</p>		
			<p>Do you wish to notify the customer that further editing is required?</p>
%		} elsif ($c->stash->{content} eq 'complete_doc') {
%			if ($c->user_in_realm('reviewer')) {
				<p>You are about to mark the document "<% $c->stash->{template_instance}->name %>" for <span class="salutation"><% $c->stash->{template_instance}->customer->salutation %></span> (<% $c->stash->{template_instance}->customer->user_name %>) as <span class="status completed">Completed</span>.

%				if ($c->stash->{customer_involved}) {
					Marking this document as <span class="status completed">Completed</span> will prevent the customer <% !$c->stash->{template_instance}->product_instance->sign_off_required($c->user->id) || !$c->check_user_roles( qw/can_sign_off/ ) ? ', and you,' : '' %> from making any further alterations.</p>
%				}

%				if (!$c->stash->{template_instance}->product_instance->service_level->includes_review && $c->stash->{customer_involved}) {
					<p>Please note that associated service level is "<% $c->stash->{template_instance}->product_instance->service_level->name %>" and, as such, the customer is expected to manage the product unaided online.</p>
%				} elsif ($c->stash->{template_instance}->status->id == 2 && $c->stash->{customer_involved}) {
					<p>Please note that associated service level is "<% $c->stash->{template_instance}->product_instance->service_level->name %>" and, as such, the customer is expected to submit the document for <span class="status review">Review.</span> Are you sure you want to bypass the <span class="status review">Review</span> stage and mark it as <span class="status completed">Completed</span>?</p>
%				}

% 			if ($c->stash->{template_instance}->product_instance->sign_off_required($c->user->id)) {
%					if ($c->check_user_roles( qw/can_sign_off/ )) {
						<p>This document is required to be <span class="status sign_off">Signed off</span> by a senior member of staff prior to making it available to the customer. You are authorised to do so.</p>
%	#					<p>Do you wish to sign off the document now as well if marking it as <span class="status completed">Completed</span>?</p>
						<% $c->stash->{form_sign_off}->render %>
%						if ($c->stash->{customer_involved}) {
							<p>If signing off the document now also, do you wish to notify the customer that the document is <span class="status completed">Completed</span> and ready to be downloaded?</p>
%						}
%					} else {
						<p>This document is required to be signed off by a senior member of staff prior to making it available to the customer. Do you wish to notify relevant person that the document is pending sign off?</p>
%					}
%				}

% 		} elsif ($c->user_in_realm('customer') && $c->stash->{context} eq 'customer_account') {
				<p>Are you sure you have answered all relevant questions in the document assembler and are ready to mark document <span class="instance_name">'<% $c->stash->{template_instance}->name %>'</span> as completed? Once you have marked the document as completed you will not be able to augment it further.</p>
				<p>Once you have marked the document as complete you can download any number of copies of it.</p>
% 		} elsif ($c->user_in_realm('customer') && $c->stash->{context} eq 'assembler') {
				<p>Are you sure you have answered all relevant questions in the document assembler and are ready to mark document <span class="instance_name">'<% $c->stash->{template_instance}->name %>'</span> as completed? Once you have marked the document as completed you will not be able to augment it further.</p>
				<p>Once you have marked the document as complete you can download any number of copies of it.</p>
				<p>You will be rediredted to your <span class="my_uklo_head">My UKLO</span> <span class="my_uklo_area">documents</span> area after submitting the document for review where you can manage your documents.</p> 
%			}
%		} elsif ($c->stash->{content} eq 'cancel_doc') {
%			if ($c->stash->{template_instance}->is_trial) {
				<p>Are you sure you want to <span class="status cancelled">delete</span> the trial document "<% $c->stash->{template_instance}->name %>" for <span class="salutation"><% $c->stash->{template_instance}->customer->salutation %></span> (<% $c->stash->{template_instance}->customer->user_name %>)? Associated trial product and all linked documents will be deleted and cannot be recovered.</p>
%	#			<p>Do you wish to notify the customer that the trial product has been deleted?</p>
%			} else {
				<p>Are you sure you want to <span class="status cancelled">Cancel</span> the document "<% $c->stash->{template_instance}->name %>" for <span class="salutation"><% $c->stash->{template_instance}->customer->salutation %></span> (<% $c->stash->{template_instance}->customer->user_name %>)? You will not be able to carry out any further alteration to the document and it can only be reactivated by a senior member of.</p>
%	#			<p>Do you wish to notify the customer that the document has been cancelled?</p>
%			}
%		} elsif ($c->stash->{content} eq 'archive_doc') {
			<p>You are about to <span class="status archived">archive</span> the document "<% $c->stash->{template_instance}->name %>". The document will be removed from your main document list but can be retrieved in the document <span class="status archived">archive</span> section.</p>
%		} elsif ($c->stash->{content} eq 'try_before_you_buy') {
			<p>You need to have an account with us to store and manage your documents. If you have an account already please sign in. If not, please register or continue without an account.</p>
			<p>Please note that you can register an account after trying our document assembler and any progress made to your trial document/s will be saved.</p>
			<p>Only fill in the password confirmation field if registering a new account with us.</p>
			<% $c->stash->{form_registration}->render_start %>
			<% $c->stash->{form_registration}->field('user_name')->render %>
			<% $c->stash->{form_registration}->field('password')->render %>
			<% $c->stash->{form_registration}->field('realm')->render %>
			<% $c->stash->{form_registration}->field('password_confirmation_quick_reg')->render %>
			<% $c->stash->{form_registration}->render_end %>
			<script type="text/javascript">$(document).ready(function(){ $(document).foundation('abide', 'reflow'); });</script>
%		} elsif ($c->stash->{content} eq 'registration_confirmation') {
%			if ($c->user_in_realm('reviewer')) {
				<p>Account succesfully create for <% $c->stash->{customer_account}->customer->[0]->full_name %>. The newly created account will appear in your customer list</p>
% 		} else {
				<p>Your account has been created!</p>
				<p>A registration confirmation has been sent to <% $c->stash->{customer_account}->customer->[0]->user_name %>. You will need to activate your account before accessing it. You do so by cliking on the activation link contained in the registration confirmed sent to your registered email account.</p>
%			}
%		} elsif ($c->stash->{content} eq 'registration_failure') {
%			if ($c->user_in_realm('reviewer')) {
				<p>A customer account is already associated with the email address you entered. Do you wish to include the customer account in your customer list?</p>
% 		} else {
				<p>The email address you entered is already associated with an account. Are you sure you have not registered an account with us previously? You can go to <a href="/help/">Account Recovery</a> in the help section for information on how to recover an account.</p>
				<p>Alternatively, check that the email address you entered is correct and try to register again.</p>
%			}
%		} elsif ($c->stash->{content} eq 'consent_declaration') {
			<p>Safeguarding your personal information is taken seriously at UK LawOnline. All personal information that you supply to us either in respect of yourself or other individuals in connection with the service will be treated in confidence by us and will be held and used by us for the purpose of providing and administering our products and services. This may involve the collection and processing of sensitive data (as defined in the Data Protection Act 1998) and if you use this site you will be giving your consent to such information being processed and used by us and for us to contact you in connection with our products and services.</p>
%			if ($c->session->{params}->srv_def->{associate}) {	
				<p>You accessed the UK Law Online site via a click-through from one of our affiliate partners. Please be advised that your registration details and purchase history will be shared with that affiliate partner. If you use this site you will be giving your consent to such information being shared with our affiliate partner.</p>
%			}
			<p>For more information on our data and privacy policy, please click <a href="https://www.clientspace.org/ukterms.asp?firm=EAC0C656&n=1" target="_blank">here</a></p>
%		} elsif ($c->stash->{content} eq 'process_payment') {
			<p>Please do not navigate away from this page. You will be notified when the payment has completed. It may take anyhting up to a minute to process the payment.</p>
			<p>Patience is bitter, but its fruit is sweet...</p>
%		} elsif ($c->stash->{content} eq 'payment_failed') {
			<p>The payment was not successful. Following error occured:</p>
			<p class="not_authorised">Payment not authorised</p>
			<p>Please verify that payment details entered are correct. Navigate back by clicking on the "back to checkout" button should you need to augment information entered. If the problem remains please contact us by phone or email and quote your customer number '<% $c->user->id %>'.</p>
%		} elsif ($c->stash->{content} eq 'voucher_valid') {
			<p>Hurray! You just landed yourself a <% $c->stash->{voucher}->percentage %> discount courtesy of <% $c->stash->{voucher}->associate ? $c->stash->{voucher}->associate->name : $c->session->{params}->srv_def->{provider}->{name} %>! The discount has been added to your running total.</p>
			<p>This voucher can be applied to any number of products should you want to further browse our product selection. Just remember to add the voucher code again when you process your shopping basket!</p>
%		} elsif ($c->stash->{content} eq 'voucher_invalid') {
			<p>Entered voucher code is not valid. Please make sure you entered it correctly and please note that the code is case sensitive.</p>
%		} elsif ($c->stash->{content} eq 'login_required') {
			<p>You need an account before checking out. Please login if you got an account or register should you not.</p>
			<p>You can login by clicking on the orange "LOG IN" button top right. To register, click on "Account registration" in the menu on the left hand side.</a></p>
%		} elsif ($c->stash->{content} eq 'product_not_added') {
			<p>Product "<% $c->stash->{product}->name %>" was not added as no customer has been selected. Please go to the customer list in your admin area and click on the add product icon for relevant customer and try again.</p>
%		} elsif ($c->stash->{content} eq 'reviewer_not_created') {
			<p>Failed to create admin account. The following errors where encountered:</p>
			<ul>
%			foreach (@{$c->stash->{errors}}) {
 				<li><%  /user_name_exists/ && 'Username exists' || /email_exists/ && 'Email address exists' || /reg_code_invalid/ && 'Registration code is invalid' || /senior_code_used/ && 'This registration code has already been used' %></li>
%			}
			</ul>
			<p>Please review details entered and try again</p>
%		} elsif ($c->stash->{content} eq 'reviewer_created') {
			<p>Account succesfully created. You will be logged on and redirected to the admin area.</p>
%		} elsif ($c->stash->{content} eq 'product_added') {
			<p>Product "<% $c->stash->{product}->name %>" added to customer account. You will see associated documents in your admin area.</p>
%		} elsif ($c->stash->{content} eq 'loading') {
			<p>Fasten your seat bealt. The document assembler is getting ready! Your document is being initialised. This may take up to a minute but is normally faster.</p>
			<p>This notification window will close once loaded.</p>
%		}
	</div>

	<div class="modal_control">
	  <a class="button <% $c->stash->{class_cancel} && join(' ', @{$c->stash->{class_cancel}}) %>"><% $c->stash->{bt_cancel} || 'Cancel' %></a>
% 	unless ($c->stash->{no_bt_submit}) {
	  	<a class="button <% $c->stash->{class_submit} && join(' ', @{$c->stash->{class_submit}}) %>" <% $c->stash->{data_options_submit} && join(' ', map { $_ . '="' . $c->stash->{data_options_submit}->{$_} . '"' } keys %{$c->stash->{data_options_submit}}) %>><% $c->stash->{bt_submit} || 'Submit' %></a>
%		}
  </div>
  <a class="close-reveal-modal" aria-label="Close">&#215;</a>
</div>

%	if ($c->stash->{refresh_modal}) {
		<script>
//			setInterval("$('#modal_download_doc').foundation('reveal', 'open', '<% $c->req->uri %>')", 2000);
		</script>
%	}	




