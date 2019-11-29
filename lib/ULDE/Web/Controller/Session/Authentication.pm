package ULDE::Web::Controller::Session::Authentication;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

sub login :Global : Args(0) {
  my ( $self, $c ) = @_;

  $c->req->params->{'login_user_name'} && $c->authenticate({
		user_name => $c->req->params->{'login_user_name'},
		password 	=> $c->req->params->{'login_password'},
	}, $c->find_user({ user_name => $c->req->params->{'login_user_name'}, password => $c->req->params->{'login_password'}}) ? 'customer' : 'reviewer' );

  if ($c->user_in_realm('customer')) {
	  # add account id to session object
	  $c->session->{params}->customer_account_id($c->model('Component::Customer', { id => $c->user->id })->account->id);
	  $c->session->{params}->customer_id($c->user->id);

	  # check if customer account is linked to an associate
	  my $customer_account = $c->model('Component::Account::Customer', { id => $c->session->{params}->customer_account_id });
		$c->session->{params}->link_associate($customer_account->associate) if $customer_account && $customer_account->associate;
		$c->session->{params}->delink_associate($customer_account->associate) if $customer_account && !$customer_account->associate;		
		$c->session->{params}->session_basket_to_account();
	} elsif ($c->user_in_realm('reviewer')) {

	}

#  $c->go('Root','index');
}

sub logout :Global :Args(0) {
	my ( $self, $c ) = @_;

	$c->session->{params}->clear_customer_account_id;
	$c->session->{params}->clear_account_id;
	$c->session->{params}->clear_assembler_logon;

	$c->logout();
	$c->go('Root','index');
}

__PACKAGE__->meta->make_immutable;

1;
