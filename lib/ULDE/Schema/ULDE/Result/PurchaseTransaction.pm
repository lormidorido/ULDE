use utf8;
package ULDE::Schema::ULDE::Result::PurchaseTransaction;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ULDE::Schema::ULDE::Result::PurchaseTransaction

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

=head1 TABLE: C<purchase_transaction>

=cut

__PACKAGE__->table("purchase_transaction");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'purchase_transaction_id_seq'

=head2 order_number

  data_type: 'text'
  is_nullable: 0

=head2 reference_number

  data_type: 'text'
  is_nullable: 0

=head2 date

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 0
  original: {default_value => \"now()"}

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

=head2 discount_amount

  data_type: 'money'
  is_nullable: 1

=head2 payable

  data_type: 'money'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "purchase_transaction_id_seq",
  },
  "order_number",
  { data_type => "text", is_nullable => 0 },
  "reference_number",
  { data_type => "text", is_nullable => 0 },
  "date",
  {
    data_type     => "timestamp",
    default_value => \"current_timestamp",
    is_nullable   => 0,
    original      => { default_value => \"now()" },
  },
  "discount_voucher",
  { data_type => "text", is_foreign_key => 1, is_nullable => 1 },
  "sub_total",
  { data_type => "money", is_nullable => 1 },
  "vat_amount",
  { data_type => "money", is_nullable => 1 },
  "total",
  { data_type => "money", is_nullable => 1 },
  "discount_amount",
  { data_type => "money", is_nullable => 1 },
  "payable",
  { data_type => "money", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

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

=head2 product_instances

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::ProductInstance>

=cut

__PACKAGE__->has_many(
  "product_instances",
  "ULDE::Schema::ULDE::Result::ProductInstance",
  { "foreign.purchase_transaction" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-07-25 00:52:04
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:D8po9wPGDpMU8e4gWDl0uA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
