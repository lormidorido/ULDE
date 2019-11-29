package ULDE::Web::Component::Form::Account::RegisterByAdmin;

use HTML::FormHandler::Moose;
extends 'ULDE::Web::Component::Form::Account';

override 'build_form_element_attr' => sub { my $element_attr = super(); $element_attr->{name} = 'registration_by_admin'; $element_attr->{id} = 'registration_by_admin'; return $element_attr; };

has_field 'user_name'	=> (
	label 		    => 'email',
	do_label	    => 0,
	type 			    => 'Email',
	required 	    => 1,
	widget 		    => 'Text',
	name 			    => 'user_name',
  id            => 'user_name',
	element_class => [qw(form_field email)],
	element_attr 	=> { placeholder => 'Email address' },
  tags          => { after_element => '<small class="error">A valid email address is required.</small>' }
);

has_field 'register'		=> ( type => 'Submit', value => 'Register', widget=> 'submit', element_class => [qw(form_field button register right)]);

no HTML::FormHandler::Moose;

__PACKAGE__->meta->make_immutable;

1;

