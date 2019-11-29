use utf8;
package ULDE::Schema::ULDE::Result::ProductDiscount;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ULDE::Schema::ULDE::Result::ProductDiscount

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

=head1 TABLE: C<product_discount>

=cut

__PACKAGE__->table("product_discount");

=head1 ACCESSORS

=head2 discount_voucher

  data_type: 'text'
  is_foreign_key: 1
  is_nullable: 0

=head2 product

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 service_definition

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 service_level

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "discount_voucher",
  { data_type => "text", is_foreign_key => 1, is_nullable => 0 },
  "product",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "service_definition",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "service_level",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</discount_voucher>

=item * L</product>

=item * L</service_definition>

=item * L</service_level>

=back

=cut

__PACKAGE__->set_primary_key(
  "discount_voucher",
  "product",
  "service_definition",
  "service_level",
);

=head1 RELATIONS

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

=head2 product_service_level

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::ProductServiceLevel>

=cut

__PACKAGE__->belongs_to(
  "product_service_level",
  "ULDE::Schema::ULDE::Result::ProductServiceLevel",
  {
    product => "product",
    service_definition => "service_definition",
    service_level => "service_level",
  },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-03-16 06:43:12
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ckDBZdKa5lzusUNA+bRx/Q


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
