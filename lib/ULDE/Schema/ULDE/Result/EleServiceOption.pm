use utf8;
package ULDE::Schema::ULDE::Result::EleServiceOption;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ULDE::Schema::ULDE::Result::EleServiceOption

=head1 DESCRIPTION

This is just a temporary table required whilt using ELE's paymentt gateway 

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

=head1 TABLE: C<ele_service_option>

=cut

__PACKAGE__->table("ele_service_option");

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

=head2 foreign_id

  data_type: 'integer'
  is_nullable: 1

=head2 name

  data_type: 'text'
  is_nullable: 1

=head2 description

  data_type: 'text'
  is_nullable: 1

=head2 price

  data_type: 'money'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "product",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "service_definition",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "service_level",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "foreign_id",
  { data_type => "integer", is_nullable => 1 },
  "name",
  { data_type => "text", is_nullable => 1 },
  "description",
  { data_type => "text", is_nullable => 1 },
  "price",
  { data_type => "money", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</product>

=item * L</service_definition>

=item * L</service_level>

=back

=cut

__PACKAGE__->set_primary_key("product", "service_definition", "service_level");

=head1 UNIQUE CONSTRAINTS

=head2 C<ele_service_option_foreign_id_key>

=over 4

=item * L</foreign_id>

=back

=cut

__PACKAGE__->add_unique_constraint("ele_service_option_foreign_id_key", ["foreign_id"]);

=head1 RELATIONS

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
  { is_deferrable => 0, on_delete => "RESTRICT", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-07-30 23:01:56
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:50CaOeOfQ0UkqvL1+9CfzA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
