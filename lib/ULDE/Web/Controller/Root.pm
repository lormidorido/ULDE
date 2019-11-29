package ULDE::Web::Controller::Root;
use Moose;
use namespace::autoclean;


BEGIN { extends 'Catalyst::Controller' }

__PACKAGE__->config(namespace => '');

sub begin :Private {
	my ( $self, $c ) = @_;

$c->response->body( '<!DOCTYPE HTML><html><head><meta http-equiv="Content-Type" content="text/html; charset=utf-8"></head><body><center><br><br>We are regrouping<br><br>\,,/(^_^)\,,/</center></body></html>' );

  unless ($c->req->params->{init_login}) {
	
#  $c->response->redirect($c->uri_for('/logout')), $c->detach() if !$c->user_exists && ($c->req->path =~ m|admin| || $c->req->path =~ m|account|);
  $c->response->redirect($c->uri_for('/logout')), $c->detach() if !$c->user_exists && ($c->req->path =~ m|account|);

  	$c->session->{params} = undef;

  	# get session object
  	$c->session->{params} = $c->model('Web::Component::Session', { session_id => $c->sessionid, host => $c->req->uri->host, referer => $c->req->referer || undef } ) if !$c->session->{params};

    # pre-processing functionality - triggered by query paramaters
    if ($c->req->params->{change_status_to}) {
      $c->model('Component::Template::Instance', { id => $c->req->params->{instance_id} })->change_status($c->req->params->{change_status_to});
    }

    $c->stash(
    	body_class				=> [(split '/' , $c->req->path), $c->session->{params}->srv_def->{associate} ? 'associate' : '', $c->user_in_realm('reviewer') ? 'reviewer' : $c->user_in_realm('customer') ? 'customer' : '' ],
    	active_menu_item	=>  $c->req->path =~ m|product/business| ? 2 : 
                            $c->req->path =~ m|product/personal| ? 3 : 
                            $c->req->path =~ m|about| ? 4 : 
                            $c->req->path =~ m|register| ? 5 : 
                            $c->req->path =~ m|help| ? 6 : 
                            $c->req->path =~ m|assembler| ? 7 : 
                            $c->req->path =~ m|admin| ? 8 :
                            $c->req->path =~ m|basket| ? 9 :
                            $c->req->path =~ m|messages| ? 10 :
                            $c->req->path =~ m|account| ? 11 :
                            1,
    	form_log_in 			=> !$c->user_exists ? $c->model('Web::Component::Form::Login') : undef,
      basket            => { count => $c->user_in_realm('reviewer') ? undef : $c->user_exists ? $c->model('Component::Account::Customer', { id => $c->model('Component::Customer', { id => $c->user->id })->account->id })->basket_count : $c->session->{params}->product_count },
      messenger         => { unread_count => $c->user_in_realm('reviewer') || !$c->user_exists ? undef : $c->model('Component::Account::Customer', { id => $c->model('Component::Customer', { id => $c->user->id })->account->id })->unread_customer_msg_count },
      console_msg       => undef
    );
  }
}

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

  if ($c->req->params->{init_login}) {
	 $c->stash(
      template        => 'ele_login'
    );
  } else {
  	$c->stash(
      template        => '/',
      tab             => 1,
      load_component  => {carousel => 1}
     );
    
  	push(@{$c->stash->{body_class}},'first-page')
  }
}

sub default :Path {
    my ( $self, $c ) = @_;
    $c->response->body( 'Page not found' );
    $c->response->status(404);
}

sub end : ActionClass('RenderView') {}

__PACKAGE__->meta->make_immutable;

1;
