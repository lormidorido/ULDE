use utf8;
package ULDE::Schema::ULDE::Result::ShoppingBasket;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ULDE::Schema::ULDE::Result::ShoppingBasket

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

=head1 TABLE: C<shopping_basket>

=cut

__PACKAGE__->table("shopping_basket");

=head1 ACCESSORS

=head2 customer_account

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 product

  data_type: 'integer'
  is_nullable: 0

=head2 service_definition

  data_type: 'integer'
  is_nullable: 0

=head2 service_level

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 quantity

  data_type: 'smallint'
  default_value: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "customer_account",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "product",
  { data_type => "integer", is_nullable => 0 },
  "service_definition",
  { data_type => "integer", is_nullable => 0 },
  "service_level",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "quantity",
  { data_type => "smallint", default_value => 1, is_nullable => 1 },
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

=head2 customer_account

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::CustomerAccount>

=cut

__PACKAGE__->belongs_to(
  "customer_account",
  "ULDE::Schema::ULDE::Result::CustomerAccount",
  { id => "customer_account" },
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
  { is_deferrable => 0, on_delete => "RESTRICT", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-03-01 22:59:10
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:NXrh2002SA+gLdUfW9U3FQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
