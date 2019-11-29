use utf8;
package ULDE::Schema::ULDE::Result::AssociateDiscountVoucher;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ULDE::Schema::ULDE::Result::AssociateDiscountVoucher

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<associate_discount_voucher>

=cut

__PACKAGE__->table("associate_discount_voucher");

=head1 ACCESSORS

=head2 associate

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 discount_voucher

  data_type: 'text'
  is_foreign_key: 1
  is_nullable: 0

=head2 default

  data_type: 'boolean'
  default_value: false
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "associate",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "discount_voucher",
  { data_type => "text", is_foreign_key => 1, is_nullable => 0 },
  "default",
  { data_type => "boolean", default_value => \"false", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</associate>

=item * L</discount_voucher>

=back

=cut

__PACKAGE__->set_primary_key("associate", "discount_voucher");

=head1 UNIQUE CONSTRAINTS

=head2 C<associate_discount_voucher_discount_voucher_key>

=over 4

=item * L</discount_voucher>

=back

=cut

__PACKAGE__->add_unique_constraint(
  "associate_discount_voucher_discount_voucher_key",
  ["discount_voucher"],
);

=head1 RELATIONS

=head2 associate

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::Associate>

=cut

__PACKAGE__->belongs_to(
  "associate",
  "ULDE::Schema::ULDE::Result::Associate",
  { id => "associate" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" },
);

=head2 discount_voucher

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::DiscountVoucher>

=cut

__PACKAGE__->belongs_to(
  "discount_voucher",
  "ULDE::Schema::ULDE::Result::DiscountVoucher",
  { code => "discount_voucher" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-07-24 02:17:25
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:gNJgY0zNWuiiqWIBMKxsrg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
