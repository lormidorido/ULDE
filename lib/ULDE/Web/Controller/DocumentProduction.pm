package ULDE::Web::Controller::DocumentProduction;
use Moose;
use namespace::autoclean;
use List::Util qw(first);

BEGIN { extends 'Catalyst::Controller'; }

# add chanined actions here - my $assembler = $c->model('Interface::DocumentAssembler') in all actions

sub assembler : Global : Args(3) {
# 0: product_id || product_instance_id
# 1: template_id || template_instance_id
# 2: 1 ? instances || not instances
  my ( $self, $c ) = @_;

	my $assembler = $c->model('Interface::DocumentAssembler');

	my $product = $c->req->args->[2] ? $c->model('Component::Product::Instance', { id => $c->req->args->[0] }) : $c->model('Component::Product', { id => $c->req->args->[0] });

	my $assembler_argument;

	if (!$c->req->args->[2]) {
		# create instance if template
		# possible to get template_instance_id when trial account?
		# need to stop reviewers and admin from adding templates here
		if ($c->user_in_realm('customer')) {
			my $customer_account = $c->model('Component::Account::Customer', { id => $c->session->{params}->customer_account_id });
			$assembler_argument->{instance_id} = $customer_account->add_product_instance($product->id)->create_template_instance($c->req->args->[1],$c->user->id)->foreign_id;
			$c->stash->{basket}->{count}++;
		} elsif (!$c->user_exists) {
			$c->session->{params}->add_product($c->req->args->[0]);
			$c->stash->{basket}->{count} = $c->session->{params}->product_count;

			# assuming not pack!
			$assembler_argument->{template_id} = $product->template_h->{$c->req->args->[1]}->foreign_id;
		}
		# increment basket count

	} else {
		$assembler_argument->{instance_id} = $product->template_instance_h->{$c->req->args->[1]}->foreign_id;
	}

	$c->stash(
		template 					=> '/product/doc_assembler',
#		login_required 		=> 0, # $c->user_exists ? 1 : 0,
		awaiting_logon 		=> $c->user_exists && !$c->session->{params}->assembler_logon ? 1 : 0,
		assembler_src 		=> $assembler->get_assembler_url($c->user_in_realm('reviewer') ? 'reviewer' : $c->user_in_realm('customer') ? 'customer' : undef, $assembler_argument),
		redirect_url 			=> $c->user_in_realm('reviewer') ? $c->uri_for($c->controller('Admin::Root')->action_for('admin')) : $c->uri_for('/account/documents'),
		buttons 					=> [
#														{ create => $c->user_in_realm('reviewer'), name => 'Contact client', href => 'javascript:false;' },
														{ create => $c->user_in_realm('reviewer'), name => 'Document list', href => $c->uri_for($c->controller('Admin::Root')->action_for('admin')) },
														{ create => !$c->req->args->[2] || $product->status->name eq 'trial', name => 'Purchase product', href => $c->uri_for('/account/basket') },
														{ create => $c->user_in_realm('customer') && $c->req->args->[2] && $product->status->name eq 'active' && $product->template_instance_h->{$c->req->args->[1]}->status->name eq 'active' && $product->get_service_level->includes_review, name => 'Submit for review', href => $c->uri_for($c->controller('Widget::Modal')->action_for('get_modal_content'),['assembler','submit_doc',$c->req->args->[1]]), attributes => { 'data-reveal-ajax' => 'true', 'data-reveal-id' => 'modal_change_status' } },
														{ create => $c->user_in_realm('customer') && $c->req->args->[2] && $product->status->name eq 'active' && $product->template_instance_h->{$c->req->args->[1]}->status->name eq 'active' && !$product->get_service_level->includes_review, name => 'Mark as completed', href => $c->uri_for($c->controller('Widget::Modal')->action_for('get_modal_content'),['assembler','complete_doc',$c->req->args->[1]]), attributes => { 'data-reveal-ajax' => 'true', 'data-reveal-id' => 'modal_change_status' } },
														{ create => $c->user_in_realm('customer'), name => 'My documents', href => $c->uri_for('/account/documents') },
														{ create => $c->req->referer =~ /product/ ? 1 : 0, name => 'Back to products', href => $c->uri_for('/product/' . ${$c->req->args->[2] && $product->product->personal || !$c->req->args->[2] && $product->personal ? \'personal' : \'business'}) }
												],
		heading 					=> $c->req->args->[2] ? $product->template_instance_h->{$c->req->args->[1]}->name : $product->template_h->{$c->req->args->[1]}->name,
		sub_heading 			=> $c->user_exists ? 'Progress is automatically saved so you can return to it later' : 'Login or register to save progress automatically so you can return to it later',
		modal 						=> [ { id => 'change_status', class => ['small'] }, { id => 'small', class => ['small'] } ],
		modal_loading_src => $c->user_exists && !$c->session->{params}->assembler_logon ? $c->uri_for($c->controller('Widget::Modal')->action_for('get_modal_content'),['assembler', 'loading', 0]) : undef
	);
}

sub assembler_engine : Global : Args(1) {
	my ( $self, $c ) = @_;

	my $assembler = $c->model('Interface::DocumentAssembler');
	$assembler->get_rapidocs($c->req->args->[0]);
	$c->response->body($assembler->response->{rapidocs_html});

}

sub assembler_login_frame : Global : Args(0) { 
	my ( $self, $c ) = @_;

	$c->stash( template => '/product/assembler_login_frame' );

}

sub assembler_login : Global : Args(0) { 
	my ( $self, $c ) = @_;

	my $assembler = $c->model('Interface::DocumentAssembler');

	my $customer_account = $c->model('Component::Account::Customer', { id => $c->session->{params}->customer_account_id }) if $c->user_in_realm('customer');

	$c->stash(
		template 			=> '/product/assembler_login',
		login_url			=> $assembler->get_login_url($c->user_in_realm('reviewer') ? 'reviewer' : 'customer'),
#		login_details => $c->user_in_realm('reviewer') ? ['Rrichard','hulifux3'] : $customer_account->foreign_account->[0]->foreign_login_details,
		login_details => $c->user_in_realm('reviewer') ? ['Rrichard','hulifux3'] : $customer_account->foreign_account->foreign_login_details,
		form_id 			=> $c->user_in_realm('reviewer') ? 'login' : 'login-form'
	);
}

sub document : Global : Args(2) {
	my ( $self, $c ) = @_;

	$c->serve_static_file($c->model('Component::FileStorage')->storage_root . $c->model('Component::Template::Instance', { id => $c->req->args->[1] })->file->[-1]->name);

}

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->response->body('Matched ULDE::Web::Controller::DocumentProduction in DocumentProduction.');
}

__PACKAGE__->meta->make_immutable;

1;
