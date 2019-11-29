package ULDE::Web::Component::Form::Field::Country;

use utf8;
use HTML::FormHandler::Moose;
use ULDE::Component::Country;
extends 'HTML::FormHandler::Field::Select';

has countries	=> (is => 'ro', isa => 'ULDE::Component::Country', required => 1, builder => '_build_countries');

sub _build_countries {
	ULDE::Component::Country->new({ all => 1 });
}

sub build_options {
	my $self = shift;

  [
 		map {
 			{
 				value => $_->id, label => $_->name
 			}
 		} sort {$a->name cmp $b->name } $self->countries->all
  ];
}

no HTML::FormHandler::Moose;

__PACKAGE__->meta->make_immutable;

1;