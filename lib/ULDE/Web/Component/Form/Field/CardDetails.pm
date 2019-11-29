package ULDE::Web::Component::Form::Field::CardDetails;

use utf8;
use HTML::FormHandler::Moose;
extends 'HTML::FormHandler::Field::Compound';

has_field 'name_on_number' => (
  label         => 'Name as appears on card',
  do_label      => 0,
  type          => 'Text',
  required      => 1,
  widget        => 'Text',
  name          => 'name_on_card',
  id            => 'name_on_card',
  element_class => [qw(form_field name_on_card)],
  element_attr  => { placeholder => 'Name on card' },
  tags          => { after_element => '<small class="error">Name on card is required.</small>' }
);

has_field 'card_type' => (
  label           => 'Card type',
  do_label        => 0,
  type            => 'Select',
  empty_select  => '--- Select card type ----',
  required        => 1,
  name            => 'card_type',
  id              => 'card_type',
  element_class   => [qw(form_field select card_type)],
  element_attr    => { placeholder => 'Select card type' },
  tags            => { after_element => '<small class="error">Please select card type.</small>' },
  options         => [{ value => 'visa',        label => 'Visa'},
                      { value => 'mastercard',  label => 'Mastercard'},
                      { value => 'solo',        label => 'Solo'},
                      { value => 'maestro',     label => 'Maestro'}]
);

has_field 'card_number' => (
  label         => 'Card number',
  do_label      => 0,
  type          => 'Text',
  required      => 1,
  widget        => 'Text',
  name          => 'card_number',
  id            => 'card_number',
  element_class => [qw(form_field card_number)],
  element_attr  => { placeholder => 'Card number', pattern => 'card_number' },
  tags          => { after_element => '<small class="error">A valid card number is required.</small>' }
);

has_field 'ccv_number' => (
  label         => 'Card security number',
  do_label      => 0,
  type          => 'Text',
  required      => 1,
  widget        => 'Text',
  name          => 'ccv_number',
  id            => 'ccv_number',
  element_class => [qw(form_field ccv_number)],
  element_attr  => { placeholder => 'Card security number', pattern => 'cvv' },
  tags          => { after_element => '<small class="error">A valid card security number is required.</small>' }
);

has_field 'issue_number' => (
  label         => 'Issue number',
  do_label      => 0,
  type          => 'Text',
  required      => 0,
  widget        => 'Text',
  name          => 'issue_number',
  id            => 'issue_number',
  element_class => [qw(form_field issue_number)],
  element_attr  => { placeholder => 'Issue number', pattern => 'number' },
  tags          => { after_element => '<small class="error">A valid issue number is required for selected card type.</small>' }
);

has_field 'start_date' => (
  label           => 'Start date',
  do_label        => 0,
  type            => 'Date',
  html5_type_attr => 'Text',
  format          => 'mm/yy',
  required        => 0,
  name            => 'start_date',
  id              => 'start_date',
  element_class   => [qw(form_field mm_yy_date start_date)],
  element_attr    => { placeholder => 'Start date', pattern => 'mm_yy_date' },
  tags            => { after_element => '<small class="error">A valid expiry date is required.</small>' }
);


has_field 'exp_date' => (
  label           => 'Expiry date',
  do_label        => 0,
  type            => 'Date',
  html5_type_attr => 'Text',
  format          => 'mm/yy',
  required        => 1,
  name            => 'exp_date',
  id              => 'exp_date',
  element_class   => [qw(form_field mm_yy_date exp_date)],
  element_attr    => { placeholder => 'Expiry date', pattern => 'mm_yy_date' },
  tags            => { after_element => '<small class="error">A valid start date is required for selected card type.</small>' }
);

no HTML::FormHandler::Moose;

__PACKAGE__->meta->make_immutable;

1;