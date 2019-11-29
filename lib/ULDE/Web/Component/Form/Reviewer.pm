package ULDE::Web::Component::Form::Reviewer;

use utf8;
use HTML::FormHandler::Moose;
extends 'ULDE::Web::Component::Form';

sub build_form_element_attr { { 'data-abide' => 'ajax', name => 'reviewer_registration', id => 'reviewer_registration' } } 

has '+is_html5' => ( default => 1 );

has_field 'user_name'	=> (
	label 		    => 'Username',
	do_label	    => 0,
	type 			    => 'Text',
	required 	    => 1,
	widget 		    => 'Text',
	name 			    => 'user_name',
  id            => 'user_name',
	element_class => [qw(form_field user_name)],
	element_attr 	=> { placeholder => 'Your username', pattern => '(\S{8,})' },
  tags          => { after_element => '<small class="error">Your username must be at least 8 characters long and not contain any spaces.</small>' }
);

has_field 'password' 	=> (
	label 		    => 'Password',
	do_label		  => 0,
	type 			    => 'Password',
	required      => 1,
  widget        => 'Password',
	name 			    => 'password',
	id 				    => 'password',
	element_class => [qw(form_field password)],
	element_attr 	=> { placeholder => 'Password', pattern => '(?=^.*[a-z])(?=^.*[A-Z])(?=^.*[0-9])(\S{8,})' }, # 1 lc, 1 uc, 1 digit, no spaces and min 8 characters
  tags          => { after_element => '<small class="error">Your password must be at least 8 characters with 1 number, 1 capital and 1 small letter.</small>' }
);

has_field 'password_confirmation' 	=> (
	label 		    => 'Confirm password',
	do_label		  => 0,
	type 			    => 'Password',
	required 	    => 1,
  widget        => 'Password',
	name 			    => 'password_confirmation',
	id 				    => 'password_confirmation',
	element_class => [qw(form_field password)],
	element_attr 	=> { placeholder => 'Confirm password', 'data-equalto' => 'password' },
  tags          => { after_element => '<small class="error">The passwords do not match.</small>' }
);

has_field 'email'	=> (
	label 		    => 'Email',
	do_label	    => 0,
	type 			    => 'Email',
	required 	    => 1,
	widget 		    => 'Text',
	name 			    => 'email',
  id            => 'email',
	element_class => [qw(form_field email)],
	element_attr 	=> { placeholder => 'Your email address' },
  tags          => { after_element => '<small class="error">A valid email address is required.</small>' }
);

has_field 'first_name' => (
	label 		    => 'Name',
  do_label      => 0,
	type 			    => 'Text',
	required 	    => 1,
	name 			    => 'first_name',
	element_class => [qw(form_field customer_name)],
  element_attr  => { placeholder => 'First Name' },
  tags          => { after_element => '<small class="error">Your name is required.</small>' }
);

has_field 'surname' => (
	label 		    => 'Surname',
  do_label      => 0,
	type 			    => 'Text',
	required 	    => 1,
	name 			    => 'surname',
	element_class => [qw(form_field customer_surname)],
  element_attr  => { placeholder => 'Surname' },
  tags          => { after_element => '<small class="error">Your surname is required.</small>' }
);

has_field 'registration_code' => (
	label 		    => 'Registration code',
  do_label      => 0,
	type 			    => 'Text',
	required 	    => 1,
	name 			    => 'registration_code',
	element_class => [qw(form_field registration_code)],
	wrapper_class => [qw(right reg_code)],
  element_attr  => { placeholder => 'Registration code' },
  tags          => { after_element => '<small class="error">A registration code is required.</small>' }
);

has_field 'register'	=> ( type => 'Submit', value => 'Register', widget=> 'submit', element_class => [qw(form_field button register right)]);
has_field 'reset' 		=> ( type => 'Reset', value => 'Reset fields', widget=> 'reset', element_class => [qw(form_field button reset right)] );

has_block 'reviewer_registration'	=> (
	tag 					=> 'fieldset',
	label 				=> 'Account details',
	render_list 	=> [qw(first_name surname user_name email password password_confirmation register reset registration_code)]
);

no HTML::FormHandler::Moose;

__PACKAGE__->meta->make_immutable;

1;