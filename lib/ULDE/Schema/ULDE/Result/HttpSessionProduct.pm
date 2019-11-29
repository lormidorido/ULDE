use utf8;
package ULDE::Schema::ULDE::Result::HttpSessionProduct;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ULDE::Schema::ULDE::Result::HttpSessionProduct

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

=head1 TABLE: C<http_session_product>

=cut

__PACKAGE__->table("http_session_product");

=head1 ACCESSORS

=head2 session

  data_type: 'char'
  is_foreign_key: 1
  is_nullable: 0
  size: 72

=head2 service_definition

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 product

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 service_level

  data_type: 'integer'
  is_nullable: 1

=head2 quantity

  data_type: 'integer'
  default_value: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "session",
  { data_type => "char", is_foreign_key => 1, is_nullable => 0, size => 72 },
  "service_definition",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "product",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "service_level",
  { data_type => "integer", is_nullable => 1 },
  "quantity",
  { data_type => "integer", default_value => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</session>

=item * L</service_definition>

=item * L</product>

=back

=cut

__PACKAGE__->set_primary_key("session", "service_definition", "product");

=head1 RELATIONS

=head2 product_service_definition

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::ProductServiceDefinition>

=cut

__PACKAGE__->belongs_to(
  "product_service_definition",
  "ULDE::Schema::ULDE::Result::ProductServiceDefinition",
  { product => "product", service_definition => "service_definition" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" },
);

=head2 session

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::HttpSession>

=cut

__PACKAGE__->belongs_to(
  "session",
  "ULDE::Schema::ULDE::Result::HttpSession",
  { id => "session" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-07-17 13:29:34
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:C+ag8Lg7ROf2wBvSOf2LGg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
