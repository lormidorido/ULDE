package ULDE::Web::Controller::Account;

use Moose;
use namespace::autoclean;
#use ULDE::Web::Service::WebSite::ELE;
#use Data::Dumper;
#use Data::Format::Pretty::HTML qw(format_pretty);

BEGIN { extends 'Catalyst::Controller'; }

sub base :Chained('/') :PathPart('account') :CaptureArgs(0) {
  my ( $self, $c ) = @_;

  $c->stash(
		template 				=> '/account/customer_area',
	);
}

sub root :Chained('base') :PathPart('') :Args(0) {
  my ( $self, $c ) = @_;
}

sub account :Chained('base') PathPart('') Args(1) {
  my ( $self, $c ) = @_;

  $c->stash(
  	tab 	=> 	$c->req->args->[0] eq 'products' 	? 2 :
  						$c->req->args->[0] eq 'documents'	? 3 :
  						$c->req->args->[0] eq 'advice' 		? 4 :
  						$c->req->args->[0] eq 'messages' 	? 5 :
  						$c->req->args->[0] eq 'settings' 	? 6 :
  						$c->req->args->[0] eq 'basket' 		? 7 :
  						$c->req->args->[0] eq 'register' 	? 8 :
  						1
  );

  if ($c->user_in_realm('customer')) {
	  $c->stash(
			load_component  		=> { data_tables => 1, carousel => 1, date_picker => 1, tinymce => 1 },
			basket_payment_form => $c->model('Web::Component::Form::Payment::Basket'),
			modal 							=>  [ { id => 'payment_processing', class => ['small'] },
                                { id => 'payment_failed', class => ['small'] },
                                { id => 'change_status', class => ['small'] },
                                { id => 'download_doc', class => ['large'] }
                              ]
		);

    $c->stash->{account}            = $c->model('Component::Account::Customer', { id => $c->session->{params}->customer_account_id });

    $c->stash->{basket}->{products} = $c->stash->{account}->basket;
    $c->stash->{basket}->{cost}     = $c->stash->{account}->basket_cost;

  } else {
	  $c->stash(
			form_account_registration	 => $c->model('Web::Component::Form::Account::Register'),
			load_component						 => { date_picker => 1 },
			modal 										 =>  [
                                      { id => 'account_registration', class => ['small'] },
                                      { id => 'consent_declaration', class => ['small'] },
                                      { id => 'login_required', class => ['small'] }
                                    ],
		);

    $c->stash->{basket}->{products} = $c->session->{params}->product;
#    $c->stash->{basket}->{min_cost} = $c->session->{params}->product_min_cost;
	}
}

__PACKAGE__->meta->make_immutable;

1;
