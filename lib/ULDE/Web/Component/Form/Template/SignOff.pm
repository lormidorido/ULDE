package ULDE::Web::Component::Form::Template::SignOff;

use HTML::FormHandler::Moose;
extends 'ULDE::Web::Component::Form::Template';

has_field 'sign_off'	=> (
	label 		    => 'Do you wish to sign off the document now as well as marking it as Completed?',
	do_label	    => 1,
	type 			    => 'Checkbox',
	required 	    => 1,
	widget 		    => 'Checkbox',
	name 			    => 'sign_off',
  id            => 'sign_off',
  label_class		=> 'checkbox',
	element_class => [qw(form_field sign_off)],
#	element_attr 	=> { placeholder => 'New name' },
#  tags          => { after_element => '<small class="error">A valid new name is required.</small>' }
);

no HTML::FormHandler::Moose;

__PACKAGE__->meta->make_immutable;

1;

