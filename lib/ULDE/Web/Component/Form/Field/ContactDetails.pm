package ULDE::Web::Component::Form::Field::ContactDetails;

use utf8;
use HTML::FormHandler::Moose;
extends 'HTML::FormHandler::Field::Compound';

has_field 'home_phone'	=> (
	label 		      => 'Home phone',
  do_label        => 0,
	type 			      => 'Telephone',
	name 			      => 'home_phone',
  html5_type_attr => 'Tel',
	element_class   => [qw(form_field home_phone)],
  element_attr    => { placeholder => 'Home phone' }

);

has_field 'work_phone' 	=> (
  label           => 'Work phone',
  do_label        => 0,
  type            => 'Telephone',
  name            => 'work_phone',
  html5_type_attr => 'Tel',
  element_class   => [qw(form_field work_phone)],
  element_attr    => { placeholder => 'Work phone' }

);

has_field 'mobile_number'  => (
  label           => 'Mobile number',
  do_label        => 0,
  type            => 'Mobile',
  name            => 'mobile_number',
  html5_type_attr => 'Tel',
  element_class   => [qw(form_field mobile_number)],
  element_attr    => { placeholder => 'Mobile number' }

);

no HTML::FormHandler::Moose;

__PACKAGE__->meta->make_immutable;

1;