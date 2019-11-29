package ULDE::Web::Component::Form;

use HTML::FormHandler::Moose;
extends 'HTML::FormHandler';

has '+field_name_space' => ( default => 'ULDE::Web::Component::Form::Field' );

no HTML::FormHandler::Moose;

__PACKAGE__->meta->make_immutable;

1;