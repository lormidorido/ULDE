package ULDE::Web::Controller::Product;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

sub index :Path :CaptureArgs(1) {
  my ( $self, $c ) = @_;

#  $c->stash(
#  	prod_id => $c->session->{params}->srv_def->{id},
#  	prod 		=> $c->model('Component::ServiceDefinition', { id => $c->session->{params}->srv_def->{id} } )->product->[0]->name
#  	);

  my $products = [grep { $c->req->args->[0] eq 'business' && $_->business || $c->req->args->[0] eq 'personal' && $_->personal } @{$c->model('Component::ServiceDefinition', { id => $c->session->{params}->srv_def->{id} } )->product}];

	$c->stash(
		template 							=> '/product/listing',
		business							=> $c->req->args->[0] eq 'business' ? 1 : 0,
		personal							=> $c->req->args->[0] eq 'personal' ? 1 : 0,
		products 							=> $products,
		categories						=> [do { my %seen; map { $_->category } sort { $a->category->display_order <=> $b->category->display_order } grep { !$seen{$_->category->id}++ } @{$products} }],
		modal 								=> [ { id => 'quick_registration', class => ['small'] }, { id => 'small', class => ['small'] } ],
		load_component  			=> { carousel => 1 },
		customer_association 	=> $c->user_in_realm('reviewer') & defined $c->session->{params}->customer_association ? $c->model('Component::Customer', { id => $c->session->{params}->customer_association }) : undef,
	);
}

__PACKAGE__->meta->make_immutable;

1;
