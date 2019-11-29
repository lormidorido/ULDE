use utf8;
package ULDE::Schema::ULDE::Result::CustomerAccountProduct;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ULDE::Schema::ULDE::Result::CustomerAccountProduct - products linked to customer account

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

=head1 TABLE: C<customer_account_products>

=cut

__PACKAGE__->table("customer_account_products");

=head1 ACCESSORS

=head2 customer_account

  data_type: 'integer'
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

=head2 created

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 0
  original: {default_value => \"now()"}

=head2 purchase_date

  data_type: 'timestamp'
  is_nullable: 1

=head2 purchase_fee

  data_type: 'money'
  is_nullable: 1

=head2 discount_voucher

  data_type: 'text'
  is_foreign_key: 1
  is_nullable: 1

=head2 quantity

  data_type: 'smallint'
  default_value: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "customer_account",
  { data_type => "integer", is_nullable => 0 },
  "product",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "service_definition",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "service_level",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "created",
  {
    data_type     => "timestamp",
    default_value => \"current_timestamp",
    is_nullable   => 0,
    original      => { default_value => \"now()" },
  },
  "purchase_date",
  { data_type => "timestamp", is_nullable => 1 },
  "purchase_fee",
  { data_type => "money", is_nullable => 1 },
  "discount_voucher",
  { data_type => "text", is_foreign_key => 1, is_nullable => 1 },
  "quantity",
  { data_type => "smallint", default_value => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</customer_account>

=item * L</product>

=item * L</service_definition>

=item * L</service_level>

=back

=cut

__PACKAGE__->set_primary_key(
  "customer_account",
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
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

=head2 document_instances

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::DocumentInstance>

=cut

__PACKAGE__->has_many(
  "document_instances",
  "ULDE::Schema::ULDE::Result::DocumentInstance",
  {
    "foreign.customer_account"   => "self.customer_account",
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
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 service_level

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::ServiceLevel>

=cut

__PACKAGE__->belongs_to(
  "service_level",
  "ULDE::Schema::ULDE::Result::ServiceLevel",
  { id => "service_level" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07033 @ 2012-09-10 01:31:08
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:LruM5ac9zAevMNF3bqQn9w


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
