package ULDE::Web::Component::Form::Field::Customer;

use utf8;
use HTML::FormHandler::Moose;
extends 'HTML::FormHandler::Field::Compound';

# sub build_render_list { [qw(about_you address contact_details)] }

has_field 'first_name'	 => (
	label 		    => 'Name',
  do_label      => 0,
	type 			    => 'Text',
	required 	    => 1,
	name 			    => 'first_name',
	element_class => [qw(form_field customer_name)],
  element_attr  => { placeholder => 'First Name' },
  tags          => { after_element => '<small class="error">Name is required.</small>' }
);

has_field 'surname' => (
	label 		    => 'Surname',
  do_label      => 0,
	type 			    => 'Text',
	required 	    => 1,
	name 			    => 'surname',
	element_class => [qw(form_field customer_surname)],
  element_attr  => { placeholder => 'Surname' },
  tags          => { after_element => '<small class="error">Surname is required.</small>' }
);

has_field 'dob'     => (
  label           => 'Date of birth',
  do_label        => 0,
  type            => 'Date',
  html5_type_attr => 'Text',
  format          => 'dd/mm/yyyy',
  required        => 0,
  name            => 'dob',
  element_class   => [qw(form_field date customer_dob)],
  element_attr    => { placeholder => 'Date of birth', pattern => 'date' },
  tags            => { after_element => '<small class="error">Invalid format, non-existent date or you are not alive. Date format is dd/mm/yyyy.</small>' }
);

# has_block 'about_you'       => ( tag => 'fieldset', label => 'About you', render_list => [qw(name surname dob)]);

has_field 'address'         => ( type => '+Address' );

has_field 'contact_details' => ( type => '+ContactDetails' );

no HTML::FormHandler::Moose;

__PACKAGE__->meta->make_immutable;

1;