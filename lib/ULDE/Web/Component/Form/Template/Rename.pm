package ULDE::Web::Component::Form::Template::Rename;

use HTML::FormHandler::Moose;
extends 'ULDE::Web::Component::Form::Template';

has_field 'new_name'	=> (
	label 		    => 'New name',
	do_label	    => 0,
	type 			    => 'Text',
	required 	    => 1,
	widget 		    => 'Text',
	name 			    => 'new_name',
  id            => 'new_name',
	element_class => [qw(form_field new_name)],
	element_attr 	=> { placeholder => 'New name' },
  tags          => { after_element => '<small class="error">A valid new name is required.</small>' }
);

no HTML::FormHandler::Moose;

__PACKAGE__->meta->make_immutable;

1;

