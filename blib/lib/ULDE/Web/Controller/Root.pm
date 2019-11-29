package ULDE::Web::Controller::Root;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

__PACKAGE__->config(namespace => '');

sub begin :Private {
	my ( $self, $c ) = @_;
	
	$c->session->{details} = undef if $c->req->params->{c};

	# get session object
	$c->session->{details} = $c->model('Component::Session')->new(uri => $c->req->uri->as_string, referrer_id => $c->req->params->{r}) if !$c->session->{details} || $c->req->params->{r};

  $c->stash(
  	body_class				=> [split '/' , $c->req->path],
  	active_menu_item	=> $c->req->path =~ m|product/business| ? 2 : $c->req->path =~ m|product/personal| ? 3 : $c->req->path =~ m|about| ? 4 : 1
  )

#  	)
}

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    # $c->response->body( $c->welcome_message );
	
	# $c->stash(  template => 'text.mn' );
	push(@{$c->stash->{body_class}},'first-page')
}

sub about :Local :Args(0) {
	my ( $self, $c ) = @_;
	
	
}

sub faq :Local :Args(0) {
	my ( $self, $c ) = @_;
	
	
}

sub default :Path {
    my ( $self, $c ) = @_;
    $c->response->body( 'Page not found' );
    $c->response->status(404);
}

sub end : ActionClass('RenderView') {}

__PACKAGE__->meta->make_immutable;

1;
