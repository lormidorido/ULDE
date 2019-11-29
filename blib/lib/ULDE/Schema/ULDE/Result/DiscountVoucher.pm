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

=head1 TABLE: C<discount_vouchers>

=cut

__PACKAGE__->table("discount_vouchers");

=head1 ACCESSORS

=head2 code

  data_type: 'text'
  is_nullable: 0

=head2 discount

  data_type: 'numeric'
  is_nullable: 1
  size: [5,5]

=head2 expires

  data_type: 'date'
  is_nullable: 1

=head2 max_uses

  data_type: 'smallint'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "code",
  { data_type => "text", is_nullable => 0 },
  "discount",
  { data_type => "numeric", is_nullable => 1, size => [5, 5] },
  "expires",
  { data_type => "date", is_nullable => 1 },
  "max_uses",
  { data_type => "smallint", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</code>

=back

=cut

__PACKAGE__->set_primary_key("code");

=head1 RELATIONS

=head2 customer_account_products

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::CustomerAccountProduct>

=cut

__PACKAGE__->has_many(
  "customer_account_products",
  "ULDE::Schema::ULDE::Result::CustomerAccountProduct",
  { "foreign.discount_voucher" => "self.code" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 product_fee_discounts

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::ProductFeeDiscount>

=cut

__PACKAGE__->has_many(
  "product_fee_discounts",
  "ULDE::Schema::ULDE::Result::ProductFeeDiscount",
  { "foreign.discount_voucher" => "self.code" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 product_service_levels

Type: many_to_many

Composing rels: L</product_fee_discounts> -> product_service_level

=cut

__PACKAGE__->many_to_many(
  "product_service_levels",
  "product_fee_discounts",
  "product_service_level",
);


# Created by DBIx::Class::Schema::Loader v0.07033 @ 2012-09-10 01:31:08
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:T96Ktek2Ci+Mn9MDZ0+LRw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
