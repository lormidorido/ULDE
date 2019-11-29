package ULDE::Web::Component::Form::Field::Address;

use utf8;
use HTML::FormHandler::Moose;
extends 'HTML::FormHandler::Field::Compound';

has_field 'line_1'		=> (
	type 					=> 'Text',
	label 				=> 'Address line 1',
  do_label    	=> 0,
	required			=> 1,
	element_class => [qw(form_field address_1)],
  element_attr  => { placeholder => 'Address line 1' },
  tags          => { after_element => '<small class="error">At least one address line is required.</small>' }
);

has_field 'line_2'		=> (
	type 					=> 'Text', 
	label 				=> 'Address line 2',
  do_label    	=> 0,
  required			=> 0,
	element_class => [qw(form_field address_2)],
  element_attr  => { placeholder => 'Address line 2' }
);

has_field 'line_3'		=> (
	type 					=> 'Text',
	label 				=> 'Address line 3',
  do_label    	=> 0,
  required			=> 0,
	element_class => [qw(form_field address_3)],
  element_attr  => { placeholder => 'Address line 3' }
);

has_field 'town'			=> (
	type 					=> 'Text', 
	label 				=> 'Town',
  do_label    	=> 0,
	required			=> 1, 
	element_class => [qw(form_field town)],
  element_attr  => { placeholder => 'Town' },
  tags          => { after_element => '<small class="error">Town is required.</small>' }
);

has_field 'county'		=> (
	type 					=> 'Text', 
	label 				=> 'County', 
  do_label    	=> 0,
	required			=> 0, 
	element_class => [qw(form_field county)],
  element_attr  => { placeholder => 'County' }
);

has_field 'postcode'	=> (
	type 					=> 'Postcode', 
	label 				=> 'Postcode',
  do_label    	=> 0,
	required			=> 1, 
	element_class => [qw(form_field postcode)],
  element_attr  => { placeholder => 'Postcode' },
  tags          => { after_element => '<small class="error">Postcode is required.</small>' }
);

has_field 'country'		=> (
	type 					=> 'Country', 
	label 				=> 'Country',
	empty_select	=> '--- Select Country ----',
  do_label    	=> 0,
	required			=> 1,
	element_class => [qw(form_field country)],
  tags          => { after_element => '<small class="error">Please select country.</small>' }

);


no HTML::FormHandler::Moose;
__PACKAGE__->meta->make_immutable;
1;