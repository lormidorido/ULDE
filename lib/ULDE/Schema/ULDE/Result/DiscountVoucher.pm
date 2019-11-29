use utf8;
package ULDE::Schema::ULDE::Result::DiscountVoucher;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ULDE::Schema::ULDE::Result::DiscountVoucher

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

=head1 TABLE: C<discount_voucher>

=cut

__PACKAGE__->table("discount_voucher");

=head1 ACCESSORS

=head2 code

  data_type: 'text'
  is_nullable: 0

=head2 discount

  data_type: 'numeric'
  is_nullable: 1
  size: [2,2]

=head2 expires

  data_type: 'date'
  is_nullable: 1

=head2 max_uses

  data_type: 'smallint'
  is_nullable: 1

=head2 active

  data_type: 'boolean'
  default_value: true
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "code",
  { data_type => "text", is_nullable => 0 },
  "discount",
  { data_type => "numeric", is_nullable => 1, size => [2, 2] },
  "expires",
  { data_type => "date", is_nullable => 1 },
  "max_uses",
  { data_type => "smallint", is_nullable => 1 },
  "active",
  { data_type => "boolean", default_value => \"true", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</code>

=back

=cut

__PACKAGE__->set_primary_key("code");

=head1 RELATIONS

=head2 associate_discount_voucher

Type: might_have

Related object: L<ULDE::Schema::ULDE::Result::AssociateDiscountVoucher>

=cut

__PACKAGE__->might_have(
  "associate_discount_voucher",
  "ULDE::Schema::ULDE::Result::AssociateDiscountVoucher",
  { "foreign.discount_voucher" => "self.code" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 product_discounts

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::ProductDiscount>

=cut

__PACKAGE__->has_many(
  "product_discounts",
  "ULDE::Schema::ULDE::Result::ProductDiscount",
  { "foreign.discount_voucher" => "self.code" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 purchase_transactions

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::PurchaseTransaction>

=cut

__PACKAGE__->has_many(
  "purchase_transactions",
  "ULDE::Schema::ULDE::Result::PurchaseTransaction",
  { "foreign.discount_voucher" => "self.code" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 service_definition_discount_voucher

Type: might_have

Related object: L<ULDE::Schema::ULDE::Result::ServiceDefinitionDiscountVoucher>

=cut

__PACKAGE__->might_have(
  "service_definition_discount_voucher",
  "ULDE::Schema::ULDE::Result::ServiceDefinitionDiscountVoucher",
  { "foreign.discount_voucher" => "self.code" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 product_service_levels

Type: many_to_many

Composing rels: L</product_discounts> -> product_service_level

=cut

__PACKAGE__->many_to_many(
  "product_service_levels",
  "product_discounts",
  "product_service_level",
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-07-28 23:29:09
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Qar4zBsQ+VNdBv/d8d8AwQ

__PACKAGE__->meta->make_immutable;
1;
