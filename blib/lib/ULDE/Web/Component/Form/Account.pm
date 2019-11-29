package ULDE::Web::Component::Form::Account;

use HTML::FormHandler::Moose
extends 'HTML::FormHandler';
with 'HTML::FormHandler::Render::Util';





no HTML::FormHandler::Moose;
__PACKAGE__->meta->make_immutable;

1;