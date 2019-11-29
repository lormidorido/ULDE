<%init>
    use utf8;
    use List::Util qw(max first);
</%init>
<div class="row collapse">
	<div class="medium-16 columns">

	<ul class="tabs sp-tabs-v vertical show-for-medium-up" data-tab role="tablist" data-options="scroll_to_content: false">
%		if ($c->user_exists) {
			<li class="tab-title <% $c->stash->{tab} == 1 && 'active' %>" role="presentational"><a role="tab" tabindex="0" aria-selected="true" controls="t0">Overview</a></li>
			<li class="tab-title <% $c->stash->{tab} == 2 && 'active' %>" role="presentational"><a href="#t1" role="tab" tabindex="0" aria-selected="false" controls="t1">Customers</a></li>
			<li class="tab-title <% $c->stash->{tab} == 3 && 'active' %>" role="presentational"><a href="#t2" role="tab" tabindex="0" aria-selected="false" controls="t2">Documents</a></li>
<!--		<li class="tab-title <% $c->stash->{tab} == 4 && 'active' %>" role="presentational"><a href="#t3" role="tab" tabindex="0" aria-selected="false" controls="t3">Communications</a></li> -->
%		} else {
			<li class="tab-title <% $c->stash->{tab} == 10 && 'active' %>" role="presentational"><a role="tab" tabindex="10" aria-selected="true" controls="t10">Admin registration</a></li>
%		}
	</ul>
	<div class="tabs-content sp-tabs-content-v">
%		if ($c->user_exists) {
		  <div class="content <% $c->stash->{tab} == 1 && 'active' %>" id="t0">
		    <h4><span class="admin_area_head">Admin area</span> Overview</h4>
		  </div>

		  <div class="content sp-customer sp-tabs-table-content <% $c->stash->{tab} == 2 && 'active' %>" id="t1">
			  <div class="sp-slider-customer">
			  	<div>
				  	<div class="row collapse">
				  		<div class="medium-12 xlarge-12 columns">
					  		<div class="sp-tabs-table-head">
						    	<h4><span class="admin_area_head">Admin area</span> Customers</h4>
						  	</div>
						  </div>
				  		<div class="medium-4 xlarge-4 columns">
								<ul class="inline-list controls right">
										<li><a class="button tiny sp-add-customer">Add customer</a></li>
								</ul>
							</div>
						</div>
				    <table cellspacing="0" class="display sp-tables" id="tb_customer_review" role="grid">
				    	<thead>
				    		<tr>
				    			<th></th>
				    			<th>ID</th>
				    			<th>Status</th>
				    			<th>Name</th>
				    			<th>Created</th>
				    		</tr>
				    	</thead>
				    </table>
				  </div>
			  	<div>
				  	<div class="row collapse">
				  		<div class="medium-12 xlarge-12 columns">
					  		<div class="sp-tabs-table-head">
						    	<h4><span class="admin_area_head">Admin area</span> Add Costumer</h4>
						  	</div>
						  </div>
				  		<div class="medium-4 xlarge-4 columns">
								<ul class="inline-list controls right">
										<li><a class="button tiny sp-back-customer">Back to customers</a></li>
								</ul>
							</div>
						</div>
			  		<div class="content">
					  	<% $c->stash->{form_register_customer}->render_start %>
					  	<fieldset>
					  		<legend>Customer details</legend>
						  	<% $c->stash->{form_register_customer}->field('customers.0.first_name')->render %>
						  	<% $c->stash->{form_register_customer}->field('customers.0.surname')->render %>						   	
						  	<% $c->stash->{form_register_customer}->field('user_name')->render %>
						  	<% $c->stash->{form_register_customer}->field('register')->render %>						   	
						  	<% $c->stash->{form_register_customer}->field('reset')->render %>						   	
					   </fieldset>
					   <% $c->stash->{form_register_customer}->render_end %>								
						</div>
					</div>
				</div>
			</div>

		  <div class="content sp-document sp-tabs-table-content <% $c->stash->{tab} == 3 && 'active' %>" id="t2">
		  	<div class="sp-tabs-table-head">
		    	<h4><span class="admin_area_head">Admin area</span> Documents</h4>
			    <ul class="sub-nav sp-filter-nav medium-block-grid-7">
					  <li class="text-center"><a sp-status="0" href="#" onclick="javascript:return false;">All</a></li>
					  <li class="text-center"><a sp-status="2" href="#" onclick="javascript:return false;">Active</a></li>
					  <li class="text-center"><a sp-status="3" href="#" onclick="javascript:return false;">Review</a></li>
					  <li class="text-center"><a sp-status="7" href="#" onclick="javascript:return false;">Sign off</a></li>
					  <li class="text-center"><a sp-status="4" href="#" onclick="javascript:return false;">Completed</a></li>
					  <li class="text-center"><a sp-status="5" href="#" onclick="javascript:return false;">Cancelled</a></li>
					  <li class="text-center"><a sp-status="6" href="#" onclick="javascript:return false;">Archived</a></li>
					</ul>
		    </div>
		    <table cellspacing="0" class="display sp-tables" id="tb_document_review" role="grid">
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
		  <div class="content <% $c->stash->{tab} == 4 && 'active' %>" id="t3">
		    <h4><span class="admin_area_head">Admin area</span> Communications</h4>
		  </div>
%		} else {
		  <div class="content <% $c->stash->{tab} == 2 && 'active' %>" id="t10">
		    <h4><span class="admin_area_head">Admin area</span> Registration</h4>
		   <% $c->stash->{form_reviewer_registration}->render_start %>
		   <% $c->stash->{form_reviewer_registration}->block('reviewer_registration')->render %>
		   <% $c->stash->{form_reviewer_registration}->render_end %>
		  </div>


%		}

	</div>
</div>


