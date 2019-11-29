package ULDE::Web::Component::Form::Payment::Basket;

use utf8;
use HTML::FormHandler::Moose;
extends 'ULDE::Web::Component::Form::Payment';

override 'build_form_element_attr' => sub { my $element_attr = super(); $element_attr->{name} = 'payment_details'; $element_attr->{id} = 'payment_details'; return $element_attr; }; 

has '+is_html5' => ( default => 1 );

has_field card_details		=> ( type => '+CardDetails' );
has_field billing_address	=> ( type => '+Address' );

has_field terms_engagement => (
  label         => 'I accept the terms and conditions of the Terms of Engagement.',
  do_label      => 0,
  type          => 'Checkbox',
  required      => 1,
  widget        => 'Checkbox',
  name          => 'terms_engagement',
  id            => 'terms_engagement',
  element_class => [qw(form_field terms_engagement)],
  element_attr  => { placeholder => 'I accept the terms and conditions of the Terms of Engagement', },
  tags          => { after_element => '<small class="error">Please accept terms of engagament.</small>' }
);

has_field terms_use_merchant => (
  label         => 'I acknowledge that I have read and accepted the website terms of use and merchant notice.',
  do_label      => 0,
  type          => 'Checkbox',
  required      => 1,
  widget        => 'Checkbox',
  name          => 'terms_use_merchant',
  id            => 'terms_use_merchant',
  element_class => [qw(form_field terms_use_merchant)],
  element_attr  => { placeholder => 'I acknowledge that I have read and accepted the website terms of use and merchant notice.', },
  tags          => { after_element => '<small class="error">Please accept terms of of use and merchant notice.</small>' }
);

has_field discount_voucher => (
  type          => 'Hidden',
  required      => 0,
  widget        => 'Hidden',
  name          => 'discount_voucher',
  id            => 'discount_voucher',
  element_class => [qw(form_field discount_voucher)],
);

#has_field 'reset' 							=> ( type => 'Reset', value => 'Reset fields', widget=> 'reset', element_class => [qw(form_field button reset right)] );

has_block 'card_details'		=> ( tag => 'fieldset', label => 'Card Details', render_list => [qw(card_details)]);
has_block 'billing_address'	=> ( tag => 'fieldset', label => 'Billing Address', render_list => [qw(billing_address)]);
has_block 'terms'	=> 				=> ( tag => 'fieldset', label => 'Terms', render_list => [qw(terms_engagement terms_use_merchant)]);

no HTML::FormHandler::Moose;

__PACKAGE__->meta->make_immutable;

1;