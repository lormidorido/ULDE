package ULDE::Web::Controller::Product;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

ULDE::Web::Controller::Product - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

#sub listing :Local :Args(0) {
#	my ( $self, $c ) = @_;
	
	
#}

sub index :Path :CaptureArgs(1) {
   my ( $self, $c ) = @_;

#  $c->response->body('Matched ULDE::Web::Controller::Product in Product.');
	$c->stash(
		template 	=> '/product/listing',
		business	=> $c->req->args->[0] eq 'business' ? 1 : 0,
		personal	=> $c->req->args->[0] eq 'personal' ? 1 : 0,
	);
}


=head1 AUTHOR

A clever guy

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
