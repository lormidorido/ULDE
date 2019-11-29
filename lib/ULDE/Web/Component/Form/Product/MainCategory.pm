package ULDE::Web::Component::Form::Product::MainCategory;

use HTML::FormHandler::Moose;
extends 'ULDE::Web::Component::Form::Product';

has_field 'main_category'	=> (
	label 					=> 'Main category',
	do_label 				=> 0,
	type 			    	=> 'Select',
	required 	    	=> 0,
	widget 		    	=> 'RadioGroup',
#	name 			    	=> 'main_category',
#  id            	=> 'main_category',
	element_class 	=> [qw(form_field main_category)],
	options 				=> [{ value => 'business', label => 'Business', default => 1 }, { value => 'personal', label => 'Personal' }],
	default 				=> 'business'
);

no HTML::FormHandler::Moose;

__PACKAGE__->meta->make_immutable;

1;

