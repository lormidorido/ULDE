use utf8;
package ULDE::Schema::ULDE::Result::ProductServiceDefinition;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ULDE::Schema::ULDE::Result::ProductServiceDefinition

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

=head1 TABLE: C<product_service_definitions>

=cut

__PACKAGE__->table("product_service_definitions");

=head1 ACCESSORS

=head2 product

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 service_definition

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 description

  data_type: 'text'
  is_nullable: 1

=head2 active

  data_type: 'boolean'
  default_value: true
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "product",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "service_definition",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "description",
  { data_type => "text", is_nullable => 1 },
  "active",
  { data_type => "boolean", default_value => \"true", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</product>

=item * L</service_definition>

=back

=cut

__PACKAGE__->set_primary_key("product", "service_definition");

=head1 RELATIONS

=head2 customer_account_products

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::CustomerAccountProduct>

=cut

__PACKAGE__->has_many(
  "customer_account_products",
  "ULDE::Schema::ULDE::Result::CustomerAccountProduct",
  {
    "foreign.product" => "self.product",
    "foreign.service_definition" => "self.service_definition",
  },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 product

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::Product>

=cut

__PACKAGE__->belongs_to(
  "product",
  "ULDE::Schema::ULDE::Result::Product",
  { id => "product" },
  { is_deferrable => 0, on_delete => "CASCADE,", on_update => "NO ACTION" },
);

=head2 product_service_levels

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::ProductServiceLevel>

=cut

__PACKAGE__->has_many(
  "product_service_levels",
  "ULDE::Schema::ULDE::Result::ProductServiceLevel",
  {
    "foreign.product" => "self.product",
    "foreign.service_definition" => "self.service_definition",
  },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 service_definition

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::ServiceDefinition>

=cut

__PACKAGE__->belongs_to(
  "service_definition",
  "ULDE::Schema::ULDE::Result::ServiceDefinition",
  { id => "service_definition" },
  { is_deferrable => 0, on_delete => "CASCADE,", on_update => "NO ACTION" },
);

=head2 shopping_baskets

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::ShoppingBasket>

=cut

__PACKAGE__->has_many(
  "shopping_baskets",
  "ULDE::Schema::ULDE::Result::ShoppingBasket",
  {
    "foreign.product" => "self.product",
    "foreign.service_definition" => "self.service_definition",
  },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-06-07 03:39:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:8sOga6BR60cN2/0WUbVm4w


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
