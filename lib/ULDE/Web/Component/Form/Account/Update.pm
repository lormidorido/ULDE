package ULDE::Web::Component::Form::Account::Update;

use HTML::FormHandler::Moose;
extends 'ULDE::Web::Component::Form::Account';


  has_field 'update'  => ( type => 'Submit', value => 'update', widget=> 'submit', element_class => ['login']);

no HTML::FormHandler::Moose;

__PACKAGE__->meta->make_immutable;

1;

