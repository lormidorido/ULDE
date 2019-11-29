package ULDE::Web::Component::Form::Template;

use utf8;
use HTML::FormHandler::Moose;
extends 'ULDE::Web::Component::Form';

sub build_form_element_attr { { 'data-abide' => 'ajax' } } 

has '+is_html5' => ( default => 1 );

no HTML::FormHandler::Moose;

__PACKAGE__->meta->make_immutable;

1;
