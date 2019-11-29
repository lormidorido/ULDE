use utf8;
package ULDE::Schema::ULDE::Result::ProductDocumentTemplate;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ULDE::Schema::ULDE::Result::ProductDocumentTemplate

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

=head1 TABLE: C<product_document_template>

=cut

__PACKAGE__->table("product_document_template");

=head1 ACCESSORS

=head2 product

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 document_template

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 instance_count

  data_type: 'smallint'
  default_value: 1
  is_nullable: 0

=head2 review_count

  data_type: 'integer'
  default_value: 1
  is_nullable: 0

=head2 description

  data_type: 'text'
  is_nullable: 1

=head2 primary_template

  data_type: 'boolean'
  default_value: false
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "product",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "document_template",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "instance_count",
  { data_type => "smallint", default_value => 1, is_nullable => 0 },
  "review_count",
  { data_type => "integer", default_value => 1, is_nullable => 0 },
  "description",
  { data_type => "text", is_nullable => 1 },
  "primary_template",
  { data_type => "boolean", default_value => \"false", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</product>

=item * L</document_template>

=back

=cut

__PACKAGE__->set_primary_key("product", "document_template");

=head1 RELATIONS

=head2 document_template

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::DocumentTemplate>

=cut

__PACKAGE__->belongs_to(
  "document_template",
  "ULDE::Schema::ULDE::Result::DocumentTemplate",
  { id => "document_template" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" },
);

=head2 product

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::Product>

=cut

__PACKAGE__->belongs_to(
  "product",
  "ULDE::Schema::ULDE::Result::Product",
  { id => "product" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-04-13 22:59:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:qVdMODipx1c3SvfBNF7yww


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
