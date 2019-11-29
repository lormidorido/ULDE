package ULDE::Web::Component::Form::Login;

use utf8;
use HTML::FormHandler::Moose;
extends 'ULDE::Web::Component::Form';
with 'HTML::FormHandler::Render::Simple';

  has_field 'user_name'	=> ( label => 'Username', type => 'Email', required => 1, widget => 'text', name => 'login_user_name', element_class => ['login']);
  has_field 'password' 	=> ( label => 'Password', type => 'Password', required => 1, name => 'login_password', id => 'login_password', element_class => ['login']);
  has_field 'log_in'  	=> ( type => 'Submit', name => 'log_in', value => 'log in', widget=> 'submit', element_class => ['login']);
#  has_field 'realm'			=> ( type => 'Hidden', name => 'realm', default => 'reviewer');
#  has_field 'permanent'	=> ( type => 'Checkbox', label => 'Keep me logged on', name => 'permanent', id => 'permanent');

# no HTML::FormHandler::Moose;
__PACKAGE__->meta->make_immutable;

1;