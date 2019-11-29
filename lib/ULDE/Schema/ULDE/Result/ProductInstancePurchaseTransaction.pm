use utf8;
package ULDE::Schema::ULDE::Result::ProductInstancePurchaseTransaction;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ULDE::Schema::ULDE::Result::ProductInstancePurchaseTransaction

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

=head1 TABLE: C<product_instance_purchase_transaction>

=cut

__PACKAGE__->table("product_instance_purchase_transaction");

=head1 ACCESSORS

=head2 product_instance

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 purchase_transaction

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 discount_voucher

  data_type: 'text'
  is_foreign_key: 1
  is_nullable: 1

=head2 sub_total

  data_type: 'money'
  is_nullable: 1

=head2 vat_amount

  data_type: 'money'
  is_nullable: 1

=head2 total

  data_type: 'money'
  is_nullable: 1

=head2 discount

  data_type: 'money'
  is_nullable: 1

=head2 total_paid

  data_type: 'money'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "product_instance",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "purchase_transaction",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "discount_voucher",
  { data_type => "text", is_foreign_key => 1, is_nullable => 1 },
  "sub_total",
  { data_type => "money", is_nullable => 1 },
  "vat_amount",
  { data_type => "money", is_nullable => 1 },
  "total",
  { data_type => "money", is_nullable => 1 },
  "discount",
  { data_type => "money", is_nullable => 1 },
  "total_paid",
  { data_type => "money", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</product_instance>

=item * L</purchase_transaction>

=back

=cut

__PACKAGE__->set_primary_key("product_instance", "purchase_transaction");

=head1 UNIQUE CONSTRAINTS

=head2 C<product_instance_purchase_transaction_product_instance_key>

=over 4

=item * L</product_instance>

=back

=cut

__PACKAGE__->add_unique_constraint(
  "product_instance_purchase_transaction_product_instance_key",
  ["product_instance"],
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
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "NO ACTION",
  },
);

=head2 product_instance

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::ProductInstance>

=cut

__PACKAGE__->belongs_to(
  "product_instance",
  "ULDE::Schema::ULDE::Result::ProductInstance",
  { id => "product_instance" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" },
);

=head2 purchase_transaction

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::PurchaseTransaction>

=cut

__PACKAGE__->belongs_to(
  "purchase_transaction",
  "ULDE::Schema::ULDE::Result::PurchaseTransaction",
  { id => "purchase_transaction" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-07-23 21:00:27
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Jg1isHfgsItmqzkRoJRY9g


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
