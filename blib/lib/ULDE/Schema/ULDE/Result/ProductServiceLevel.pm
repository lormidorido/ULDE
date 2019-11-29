use utf8;
package ULDE::Schema::ULDE::Result::ProductServiceLevel;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ULDE::Schema::ULDE::Result::ProductServiceLevel

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

=head1 TABLE: C<product_service_levels>

=cut

__PACKAGE__->table("product_service_levels");

=head1 ACCESSORS

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

=head2 fee

  data_type: 'money'
  is_nullable: 1

=head2 min_fee

  data_type: 'money'
  is_nullable: 1

=head2 max_fee

  data_type: 'money'
  is_nullable: 1

=head2 srv_level_descr

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "product",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "service_definition",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "service_level",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "fee",
  { data_type => "money", is_nullable => 1 },
  "min_fee",
  { data_type => "money", is_nullable => 1 },
  "max_fee",
  { data_type => "money", is_nullable => 1 },
  "srv_level_descr",
  { data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</product>

=item * L</service_definition>

=item * L</service_level>

=back

=cut

__PACKAGE__->set_primary_key("product", "service_definition", "service_level");

=head1 RELATIONS

=head2 product_fee_discounts

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::ProductFeeDiscount>

=cut

__PACKAGE__->has_many(
  "product_fee_discounts",
  "ULDE::Schema::ULDE::Result::ProductFeeDiscount",
  {
    "foreign.product"            => "self.product",
    "foreign.service_definition" => "self.service_definition",
    "foreign.service_level"      => "self.service_level",
  },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 product_service_definition

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::ProductServiceDefinition>

=cut

__PACKAGE__->belongs_to(
  "product_service_definition",
  "ULDE::Schema::ULDE::Result::ProductServiceDefinition",
  { product => "product", service_definition => "service_definition" },
  { is_deferrable => 0, on_delete => "CASCADE,", on_update => "NO ACTION" },
);

=head2 service_level

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::ServiceLevel>

=cut

__PACKAGE__->belongs_to(
  "service_level",
  "ULDE::Schema::ULDE::Result::ServiceLevel",
  { id => "service_level" },
  { is_deferrable => 0, on_delete => "RESTRICT", on_update => "NO ACTION" },
);

=head2 discount_vouchers

Type: many_to_many

Composing rels: L</product_fee_discounts> -> discount_voucher

=cut

__PACKAGE__->many_to_many(
  "discount_vouchers",
  "product_fee_discounts",
  "discount_voucher",
);


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-06-07 03:39:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:W+Ur5rMCJtVeuiNNUb0rkw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
