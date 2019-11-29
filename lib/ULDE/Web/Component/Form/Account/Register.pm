package ULDE::Web::Component::Form::Account::Register;

use utf8;
use HTML::FormHandler::Moose;
extends 'ULDE::Web::Component::Form::Account';

# I have included quick_reg in the standard reg form. Need to create a nquickReg form when got time that merges login and quick reg in one

override 'build_form_element_attr' => sub { my $element_attr = super(); $element_attr->{name} = 'registration'; $element_attr->{id} = 'registration'; return $element_attr; };

# sub build_render_list { [qw(quick_reg customers register reset)] }

has_field 'user_name'	=> (
	label 		    => 'Username',
	do_label	    => 0,
	type 			    => 'Email',
	required 	    => 1,
	widget 		    => 'Text',
	name 			    => 'user_name',
  id            => 'user_name',
	element_class => [qw(form_field email)],
	element_attr 	=> { placeholder => 'Your email address' },
  tags          => { after_element => '<small class="error">A valid email address is required.</small>' }
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

# only now when quick_reg form does not exists
has_field 'password_confirmation_quick_reg'	=> (
	label 		    => 'Confirm password if registering',
	do_label		  => 0,
	type 			    => 'Password',
	required 	    => 0,
  widget        => 'Password',
	name 			    => 'password_confirmation_quick_reg',
	id 				    => 'password_confirmation_quick_reg',
	element_class => [qw(form_field password)],
	element_attr 	=> { placeholder => 'Confirm password (only if registering)', 'data-equalto' => 'password' },
  tags          => { after_element => '<small class="error">The passwords do not match.</small>' }
);

# only now when quick_reg form does not exists
has_field 'realm'		=> ( type => 'Hidden', name => 'realm', default => 'customer');


has_block 'quick_reg'						=> (
	tag 					=> 'fieldset',
	label 				=> 'Quick registration',
	render_list 	=> [qw(user_name password password_confirmation quick_registration reset)]
);

has_field 'full_registration'		=> ( type => 'Submit', value => 'Full registration', widget=> 'submit', element_class => [qw(form_field button register right)]);

has_field 'quick_registration'	=> ( type => 'Submit', value => 'Quick registration', widget=> 'submit', element_class => [qw(form_field button register right)]);

no HTML::FormHandler::Moose;

__PACKAGE__->meta->make_immutable;

1;

