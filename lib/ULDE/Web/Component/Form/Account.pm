package ULDE::Web::Component::Form::Account;

use utf8;
use HTML::FormHandler::Moose;
extends 'ULDE::Web::Component::Form';

sub build_form_element_attr { { 'data-abide' => 'ajax' } } 

has '+is_html5' => ( default => 1 );

has_field 'customers'          	=> ( type => 'Repeatable' );
has_field 'customers.contains'	=> ( type => '+Customer' );
has_field 'reset' 							=> ( type => 'Reset', value => 'Reset fields', widget=> 'reset', element_class => [qw(form_field button reset right)] );

# has_block 'about_you'       		=> ( tag => 'fieldset', label => 'About you', render_list => [qw(customers)]);

no HTML::FormHandler::Moose;

__PACKAGE__->meta->make_immutable;

1;