package ULDE::Web::Controller::HelpCentre;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }


sub base :Chained("/") :PathPart("help") :CaptureArgs(0) {
    my ( $self, $c ) = @_;

  $c->stash(
		template 	=> '/help/help_centre',
		tab			=> 2
	);
}

sub root :Chained("base") :PathPart("") :Args(0) {
 
}

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

}

__PACKAGE__->meta->make_immutable;

1;
