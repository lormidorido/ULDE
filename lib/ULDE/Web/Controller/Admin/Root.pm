package ULDE::Web::Controller::Admin::Root;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

sub admin : Global : Args(0) {
  my ( $self, $c ) = @_;

  $c->session->{params}->clear_customer_association;

	$c->stash(
		template 				=> '/admin/admin_area',
		tab 						=> $c->req->referer =~ /assembler/ ? 3 : 2,
		load_component  => { data_tables => 1, carousel => 1 },
		modal 					=> [
												{ id => 'change_status', class => ['small'] },
												{ id => 'small', class => ['small'] },
												{ id => 'medium', class => ['medium'] },
												{ id => 'account_registration', class => ['small'] },
												{ id => 'download_doc', class => ['large'] }
											 ],
		form_reviewer_registration 	=> $c->model('Web::Component::Form::Reviewer'),
		form_register_customer 			=> $c->model('Web::Component::Form::Account::RegisterByAdmin')
	);
}

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->response->body('Matched ULDE::Web::Controller::Admin::Root in Admin::Root.');
}


__PACKAGE__->meta->make_immutable;

1;
