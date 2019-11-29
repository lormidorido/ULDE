<%init>
    use utf8;
    use List::Util qw(first min);
</%init>
<div class="row collapse">
	<div class="medium-16 columns">
		<ul class="tabs sp-tabs-v vertical show-for-medium-up" data-tab="" role="tablist">
%    	if ($c->user_exists) {
				<li class="tab-title <% $c->stash->{tab} == 1 && 'active' %>" role="presentational"><a href="#t1" role="tab" tabindex="0" aria-selected="false" controls="t1">Overview</a></li>
%				if ($c->stash->{basket}->{count}) {
					<li class="tab-title basket <% $c->stash->{tab} == 7 && 'active' %>" role="presentational"><a href="#t7" role="tab" tabindex="0" aria-selected="false" controls="t7">My basket ( <span class="count"><% $c->stash->{basket}->{count} || 0 %></span> )</a></li>
%				}

% #				<li class="tab-title <% $c->stash->{tab} == 2 && 'active' %>" role="presentational"><a href="#t2" role="tab" tabindex="0" aria-selected="false" controls="t2">My products</a></li>
				<li class="tab-title <% $c->stash->{tab} == 3 && 'active' %>" role="presentational"><a href="#t3" role="tab" tabindex="0" aria-selected="false" controls="t3">My documents</a></li>
% #				<li class="tab-title <% $c->stash->{tab} == 4 && 'active' %>" role="presentational"><a href="#t4" role="tab" tabindex="0" aria-selected="false" controls="t4">My legal advice</a></li>
				<li class="tab-title <% $c->stash->{tab} == 5 && 'active' %>" role="presentational"><a href="#t5" role="tab" tabindex="0" aria-selected="false" controls="t5">My messages ( <span class="count"><% $c->stash->{messenger}->{unread_count} || 0 %></span> )</a></li>
<!--
				<li class="tab-title <% $c->stash->{tab} == 6 && 'active' %>" role="presentational"><a href="#t6" role="tab" tabindex="0" aria-selected="false" controls="t6">My account settings</a></li>
-->
%			} else {
				<li class="tab-title <% $c->stash->{tab} == 8 && 'active' %>" role="presentational"><a href="#t1" role="tab" tabindex="0" aria-selected="false" controls="t1">Account registration</a></li>
%				if ($c->stash->{basket}->{count}) {
					<li class="tab-title <% $c->stash->{tab} == 7 && 'active' %>" role="presentational"><a href="#t7" role="tab" tabindex="0" aria-selected="false" controls="t7">Shopping basket ( <span class="count"><% $c->stash->{basket}->{count} || 0 %></span> )</a></li>
%				}
%			}
		</ul>

		<div class="tabs-content sp-tabs-content-v">
%			if ($c->user_exists) {
			  <div class="content <% $c->stash->{tab} == 1 && 'active' %>" id="t1">
			  	<h4><span class="my_uklo_head">My UKLO</span> Overview</h4>
			  </div>
			  <div class="content <% $c->stash->{tab} == 2 && 'active' %>" id="t2">
			    <h4><span class="my_uklo_head">My UKLO</span> Products</h4>
			  </div>
			 	<div class="content sp-tabs-table-content <% $c->stash->{tab} == 3 && 'active' %>" id="t3">
			  	<div class="sp-tabs-table-head">
			    	<h4><span class="my_uklo_head">My UKLO</span> Documents</h4>
				    <ul class="sub-nav sp-filter-nav medium-block-grid-6">
						  <li class="text-center"><a sp-status="0" href="#" onclick="javascript:return false;">All</a></li>
						  <li class="text-center"><a sp-status="2" href="#" onclick="javascript:return false;">Active</a></li>
						  <li class="text-center"><a sp-status="3" href="#" onclick="javascript:return false;">Review</a></li>
						  <li class="text-center"><a sp-status="4" href="#" onclick="javascript:return false;">Completed</a></li>
						  <li class="text-center"><a sp-status="5" href="#" onclick="javascript:return false;">Cancelled</a></li>
						  <li class="text-center"><a sp-status="6" href="#" onclick="javascript:return false;">Archived</a></li>
						</ul>
			    </div>
			    <table cellspacing="0" class="display sp-tables" id="tb_document_customer" role="grid">
			    	<thead>
			    		<tr>
			    			<th></th>
			    			<th>ID</th>
			    			<th>Status</th>
			    			<th>Document</th>
			    			<th>Customer</th>
			    			<th>Updated</th>
			    		</tr>
			    	</thead>
			    </table>
			  </div>
			  <div class="content <% $c->stash->{tab} == 4 && 'active' %>" id="t4">
			  <h4><span class="my_uklo_head">My UKLO</span> Legal advice</h4>

			  </div>
			  <div class="content <% $c->stash->{tab} == 5 && 'active' %>" id="t5">
					<h5 class="right sp-active-threads">There are <span class="sp-thread-count"><% $c->stash->{account}->active_thread_count %></span> active threads</b></h5>
			  	<h4><span class="my_uklo_head">My UKLO</span> Messages</h4>

				  <div class="row collapse">

			      <div class="columns medium-collapse medium-16" id="sp-messenger">
						  <div class="row collapse">
			        
			          <div class="columns medium-collapse medium-12 large-13 sp-messenger-messages">
			            <div class="sp-slider">
%											foreach my $message_thread (@{$c->stash->{account}->communication}) {
%												my $i = scalar @{$message_thread->message};
												<div>
													<div class="sp-thread-header"><h5 class="sp-thread-head"><% $message_thread->product ? 'Product review' : 'Support request' %> - <span class="sp-thread-name"><% $message_thread->name %></span></h5></div>
%													foreach my $message (@{$message_thread->message}) {
							            	<div class="sp-message">
								              <span class="right"><span class="sp-date"><% $c->stash->{account}->format_date_uk($message->created) %></span> <span class="sp-time"><% $c->stash->{account}->format_time_uk($message->created) %></span></span>
								              <h5><% $message->customer ? $message->customer->salutation : $message->reviewer ? 'Legal review expert' : 'Support team' %></h5>
								              <% $message->content %>
								              <% --$i ? '<hr />' : '' %>
								            </div>
%													}
												</div>
%											}
		              </div>
			          </div>
			          <div class="columns medium-4 large-3 sp-messenger-threads-side-bar">
		              <div class="sp-threads-header"><h5 class="sp-threads-head">Message threads</h5></div>
		              <ul class="sp-threads">
%										my $i = 0;
%		              	foreach my $message_thread (@{$c->stash->{account}->communication}) {
		                	<li>
		                		<a sp-thread-id="<% $i++ %>" class="sp-thread-link" ><% ($message_thread->product && 'Product review' || 'Support request') %> ( <span class="sp-unread-msg-count"><% $message_thread->unread_customer_msg_count %></span> )</a>
		                	</li>
%		              	}
			          </div>
			       	</div>
						  <div class="row collapse">
			          <div class="columns medium-collapse medium-12 large-13 sp-editor-container">
			          	<form method="post">
						    		<textarea id="sp-editor">Hello, World!</textarea>
						  		</form>
						  		<a class="button send_msg">Send message</a>
			          </div>
			        </div>
			      </div>
		    	</div>

			  </div>
			  <div class="content <% $c->stash->{tab} == 6 && 'active' %>" id="t6">
			  <h4><span class="my_uklo_head">My UKLO</span> Account settings</h4>

			  </div>
%			} else {
			  <div class="content <% $c->stash->{tab} == 8 && 'active' %> registration" id="t1">
			  	<h4><span class="my_uklo_head">My UKLO</span> Registration</h4>
			  	<% #$c->stash->{form_account_registration}->render %>
			  	<% $c->stash->{form_account_registration}->render_start %>
			  	<% $c->stash->{form_account_registration}->block('quick_reg')->render %>
			  	<fieldset>
			  		<legend>About you</legend>
				  	<% $c->stash->{form_account_registration}->field('customers.0.first_name')->render %>
				  	<% $c->stash->{form_account_registration}->field('customers.0.surname')->render %>
				  	<% $c->stash->{form_account_registration}->field('customers.0.dob')->render %>
			  	</fieldset>
			  	<fieldset>
			  		<legend>Your postal address</legend>
			  		<% $c->stash->{form_account_registration}->field('customers.0.address')->render %>
			  	</fieldset>
			  	<fieldset>
			  		<legend>Your contact details</legend>
			  		<% $c->stash->{form_account_registration}->field('customers.0.contact_details')->render %>
			  	</fieldset>
			  	<% $c->stash->{form_account_registration}->field('full_registration')->render %>
			  	<% $c->stash->{form_account_registration}->field('reset')->render %>
		  		<% $c->stash->{form_account_registration}->render_end %>
		  	</div>
%			}


%			if ($c->stash->{basket}->{count}) {

			  <div class="content payment <% $c->stash->{tab} == 7 && 'active' %>" id="t7">
					<div class="<% $c->user_exists && 'sp-slider' %> show-for-medium-up">

%	#					basket slide starts
						<div class="basket">
%		  				if (!$c->user_exists && 0) {
						  	<h5 class="right value">Basket value from: <b>£<% $c->stash->{basket}->{min_cost} %> inc. VAT</b></h5>
%							}
					  	<h4><span class="my_uklo_head">My UKLO</span> Basket</h4>
					  	<table class="display sp-tables" id="tb_basket" role="grid">
					  		<thead>
					  			<tr>
					  				<th>Product</th>
%					  				if ($c->user_exists) {
					  					<th>Service level</th>
					  					<th>Price (inc. VAT)</th>
% 									} else {
					  					<th>Quantity</th>
					  					<th>Price from (inc. VAT)</th>
%										}
					  			</tr>
					  		</thead>
%					  		if ($c->user_exists) {
%									foreach my $product_instance (sort { $a->name cmp $b->name } @{$c->stash->{basket}->{products}}) {
										<tr class="product_instance_row <% $product_instance->id %>">
											<td class="product_name"><div><% $product_instance->name %></div></td>
%											if (@{$product_instance->product->service_level} > 1) {
												<td class="service_level"><a class="button split tiny"><div class="service_level_name"><% $product_instance->service_level && $product_instance->service_level->name || (first { $_->default } @{$product_instance->product->service_level})->name %></div><span data-dropdown="sp-sl-<% $product_instance->id %>"></span></a></td>
												<td class="fee"><% $product_instance->service_level && $product_instance->service_level->price || (first { $_->default } @{$product_instance->product->service_level})->price %></td>
%											} else {
												<td class="service_level"><a class="button tiny"><% $product_instance->product->service_level->[0]->name %></a></td>
												<td class="fee"><% $product_instance->product->service_level->[0]->price %></td>							
%											}
										</tr>
%									}
%								} else {
%									foreach my $product (sort { $a->name cmp $b->name } @{$c->stash->{basket}->{products}}) {
										<tr class="product_row <% $product->id %>">
											<td class="product_name"><div><% $product->name %></div></td>
											<td class="quantity">
												<select>
													<option value="1" <% $product->quantity == 1 && 'selected' %>>1</option>
													<option value="2" <% $product->quantity == 2 && 'selected' %>>2</option>
													<option value="3" <% $product->quantity == 3 && 'selected' %>>3</option>
													<option value="4" <% $product->quantity == 4 && 'selected' %>>4</option>
													<option value="5" <% $product->quantity == 5 && 'selected' %>>5</option>
												</select>
											</td>
											<td class="fee">£<% min map { (my $price = $_->price) =~ s/^.//; $price } grep { $_->customer_applicable } @{$product->service_level} %></td>
										</tr>
%									}
%								}
					  	</table>
					  	<div class="row collapse">
%					  		if ($c->user_exists) {
						  		<div class="medium-6 medium-offset-1 xlarge-offset-3 columns">
						  			<div class="discount_cogs">
											<input type="text" name="discount_code" id="discount_code">
											<img src="<%  $.static_root %>/imgs/discount_cogs.png" alt="" usemap="#discount_cogs">
											<map name="discount_cogs">
												<area class="code_submitted" coords="145,132,35" shape="circle" href="javascript:false"></area>
											</map>
						  			</div>
						  		</div>
									<div class="medium-6 medium-offset-3 xlarge-offset-1 columns">
										<div class="summary">
									  	<table class="display sp-tables tb_total" role="grid">
												<tr class="sub_total hide">
													<td>Subtotal (ex. VAT)</td>
													<td>£<% $c->stash->{basket}->{cost}->{sub_total} %></td>
												</tr>
												<tr class="vat_amount hide">
													<td>VAT</td>
													<td>£<% $c->stash->{basket}->{cost}->{vat_amount} %></td>
												</tr>
												<tr class="total">
													<td>Total (inc. VAT)</td>
													<td>£<% $c->stash->{basket}->{cost}->{total_with_vat} %></td>
												</tr>
												<tr class="discount <% !$c->stash->{basket}->{cost}->{global_discount} && 'hide' %>">
													<td>Discount (<span class="percentage"><% $c->stash->{basket}->{cost}->{global_discount} && $c->stash->{basket}->{cost}->{global_discount}->{percentage} %></span>)</td>
													<td>£<% $c->stash->{basket}->{cost}->{global_discount} && $c->stash->{basket}->{cost}->{discount_amount} %></td>
												</tr>
												<tr class="to_pay <% !$c->stash->{basket}->{cost}->{global_discount} && 'hide' %>">
													<td>To pay</td>
													<td>£<% $c->stash->{basket}->{cost}->{global_discount} && $c->stash->{basket}->{cost}->{total_with_discount} %></td>
												</tr>
											</table>
											<a class="button to_checkout">Proceed to checkout</a>
										</div>
									</div>
								</div>
% 						} else {
								<a class="button to_register right">Proceed to checkout</a>								
%							}
						</div>
%	#					basket slide ends

%						if ($c->user_exists) {

% #						checkout slide starts	
							<div class="checkout">
						  	<h5 class="right value">Basket value: <b>£<% $c->stash->{basket}->{cost}->{global_discount} ? $c->stash->{basket}->{cost}->{total_with_discount} : $c->stash->{basket}->{cost}->{total_with_vat} %> inc. VAT</b></h5>
						  	<h4><span class="my_uklo_head">My UKLO</span> Checkout</h4>
						  	<% $c->stash->{basket_payment_form}->render_start %>
					  		<div class="row collapse">
					  			<div class="medium-8 columns">
							  		<% $c->stash->{basket_payment_form}->block('card_details')->render %>
							  	</div>
							  	<div class="medium-8 columns">
							  		<% $c->stash->{basket_payment_form}->block('billing_address')->render %>
						  		</div>
						  	</div>
						  	<% $c->stash->{basket_payment_form}->block('terms')->render %>
						  	<% $c->stash->{basket_payment_form}->field('discount_voucher')->render %>
						  	<% $c->stash->{basket_payment_form}->render_end %>
						  	<ul class="inline-list controls right">
						  		<li><a class="button to_basket">Back to basket</a></li>
						  		<li><a href="javascript:false" class="button process_payment">Process payment</a></li>
						  	</ul>
						 	</div>
% #						checkout slide ends

% #						purchase confirmation slide start
							<div class="confirm_purchase">
						  	<h4><span class="my_uklo_head">My UKLO</span> Confirm purchase</h4>			  	
						  	<div class="row collapse" data-equalizer>
						  		<div class="medium-12 columns" data-equalizer-watch>
										<div class="payment_details">
									  	<table class="display sp-tables tb_payment_details" role="grid">
												<tr>
													<td>Name on card</td>
													<td class="name_on_card"><div></div></td>
												</tr>
												<tr>
													<td>Card number</td>
													<td class="card_number"><div></div></td>
												</tr>
												<tr>
													<td>Issue number</td>
													<td class="issue_number"><div></div></td>
												</tr>
												<tr>
													<td>Start date</td>
													<td class="start_date"><div></div></td>
												</tr>
												<tr>
													<td>Expiry date</td>
													<td class="exp_date"><div></div></td>
												</tr>
												<tr>
													<td>Billing address</td>
													<td class="address"><div>e</div></td>
												</tr>
												<tr>
													<td></td>
													<td class="town"><div>d</div></td>
												</tr>
												<tr>
													<td></td>
													<td class="postcode"><div>j</div></td>
												</tr>
											</table>
										</div>
						  		</div>
									<div class="medium-4 columns" data-equalizer-watch>
										<img class="right" src="<%  $.static_root %>/imgs/chase_payment_logo.png" alt="">
										<div class="summary">
									  	<table class="display sp-tables tb_total" role="grid">
												<tr class="sub_total hide">
													<td>Subtotal (ex. VAT)</td>
													<td>£<% $c->stash->{basket}->{cost}->{sub_total} %></td>
												</tr>
												<tr class="vat_amount hide">
													<td>VAT</td>
													<td>£<% $c->stash->{basket}->{cost}->{vat_amount} %></td>
												</tr>
												<tr class="total">
													<td>Total (inc. VAT)</td>
													<td>£<% $c->stash->{basket}->{cost}->{total_with_vat} %></td>
												</tr>
												<tr class="discount <% !$c->stash->{basket}->{cost}->{global_discount} && 'hide' %>">
													<td>Discount (<span class="percentage"><% $c->stash->{basket}->{cost}->{global_discount} && $c->stash->{basket}->{cost}->{global_discount}->{percentage} %></span>)</td>
													<td>£<% $c->stash->{basket}->{cost}->{global_discount} && $c->stash->{basket}->{cost}->{discount_amount} %></td>
												</tr>
												<tr class="to_pay <% !$c->stash->{basket}->{cost}->{global_discount} && 'hide' %>">
													<td>To pay</td>
													<td>£<% $c->stash->{basket}->{cost}->{global_discount} && $c->stash->{basket}->{cost}->{total_with_discount} %></td>
												</tr>
											</table>
										</div>
									</div>
								</div>
						  	<ul class="inline-list controls right">
						  		<li><a class="button to_checkout">Back to checkout</a></li>
						  		<li><a href="javascript:false" class="button pay_now">Confirm payment</a></li>
						  	</ul>
						  	<p>If the information is correct, press 'Confirm payment'. If the information is incorrect, please press 'Back to checkout' to augment your details.</p>
						  	<p>Please do not click 'Confirm payment' multiple times or it could result in a duplicated charges. Please wait for the payment to process as it may take up to a minute for your credit card payment to be approved. Transactions will be billed as DirectLaw.</p>
						 	</div>
% #						purchase confirmation slide ends

% #						purchase summary slide starts
							<div class="purchase_summary">
								<h5 class="right order_number">Order number: <b></b></h5>
							 	<h4><span class="my_uklo_head">My UKLO</span> Purchase summary</h4>
						  	<table class="display sp-tables" id="tb_summary" role="grid">
						  		<thead>
						  			<tr>
						  				<th>Product</th>
						  				<th>Service level</th>
						  				<th>Price (inc. VAT)</th>
						  			</tr>
						  		</thead>
%									foreach my $product_instance (sort { $a->name cmp $b->name } @{$c->stash->{basket}->{products}}) {
										<tr class="product_instance_row <% $product_instance->id %>">
											<td class="product_name"><div><% $product_instance->name %></div></td>
%											if (@{$product_instance->product->service_level} > 1) {
												<td class="service_level"><div class="service_level_name"><% $product_instance->service_level && $product_instance->service_level->name || (first { $_->default } @{$product_instance->product->service_level})->name %></div></td>
												<td class="fee"><% $product_instance->service_level && $product_instance->service_level->price || (first { $_->default } @{$product_instance->product->service_level})->price %></td>
%											} else {
												<td class="service_level"><% $product_instance->product->service_level->[0]->name %></td>
												<td class="fee"><% $product_instance->product->service_level->[0]->price %></td>							
%											}
										</tr>
%									}
						  	</table>
						  	<div class="row collapse">
						  		<div class="medium-9 columns">
						  			<h5>Purchase succeeded! You are ready to go.</h5>
										<p>Thank you for your purchase. There is no need to note the purchase details. You can access them anytime in the My UKLO product section.</p>
						  			<p>You can now go to your My UKLO product section by clicking on the green button bottom right. There you will to get an overview of your products and instructions on how to proceed.</p>
						  		</div>
									<div class="medium-6 medium-offset-1 columns">
										<div class="summary">
									  	<table class="display sp-tables tb_total" role="grid">
												<tr class="sub_total hide">
													<td>Subtotal (ex. VAT)</td>
													<td>£<% $c->stash->{basket}->{cost}->{sub_total} %></td>
												</tr>
												<tr class="vat_amount hide">
													<td>VAT</td>
													<td>£<% $c->stash->{basket}->{cost}->{vat_amount} %></td>
												</tr>
												<tr class="total">
													<td>Total (inc. VAT)</td>
													<td>£<% $c->stash->{basket}->{cost}->{total_with_vat} %></td>
												</tr>
												<tr class="discount <% !$c->stash->{basket}->{cost}->{global_discount} && 'hide' %>">
													<td>Discount (<span class="percentage"><% $c->stash->{basket}->{cost}->{global_discount} && $c->stash->{basket}->{cost}->{global_discount}->{percentage} %></span>)</td>
													<td>£<% $c->stash->{basket}->{cost}->{global_discount} && $c->stash->{basket}->{cost}->{discount_amount} %></td>
												</tr>
												<tr class="to_pay <% !$c->stash->{basket}->{cost}->{global_discount} && 'hide' %>">
													<td>Paid</td>
													<td>£<% $c->stash->{basket}->{cost}->{global_discount} && $c->stash->{basket}->{cost}->{total_with_discount} %></td>
												</tr>
											</table>
											<a href="<% $c->uri_for('/account/templates') %>" class="button to_products">Go to your active products</a>
										</div>
									</div>	  	
								</div>
							</div>
% #						purchase summary slide ends
%						} # if user exists
					</div>
				</div>


%	  		if ($c->user_exists) {
%					# create drop down menu content (cannot be in the slick slider for some reason...)
%					foreach my $product_instance (sort { $a->name cmp $b->name } @{$c->stash->{basket}->{products}}) {
%						if (@{$product_instance->product->service_level} > 1) {
							<ul id="sp-sl-<% $product_instance->id %>" class="f-dropdown" data-dropdown-content>
%								foreach my $sl (@{$product_instance->product->service_level}) {
								 	<li><a class="service_level_item" service_level="<% $sl->id %>" product_instance="<% $product_instance->id %>"><% $sl->name %></a></li>
%								}
							</ul>
%						}
%					}			
%				}
%			} # basket ends
		</div>
	</div>
</div>
<div class="panel sp-panel" style="display:none">
		<h5>Quick registration</h5>
		<p>Some paragraph.</p>
</div>