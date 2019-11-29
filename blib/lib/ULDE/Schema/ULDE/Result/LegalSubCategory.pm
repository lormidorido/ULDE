use utf8;
package ULDE::Schema::ULDE::Result::LegalSubCategory;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ULDE::Schema::ULDE::Result::LegalSubCategory

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

=head1 TABLE: C<legal_sub_categories>

=cut

__PACKAGE__->table("legal_sub_categories");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'legal_sub_categories_id_seq'

=head2 name

  data_type: 'text'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "legal_sub_categories_id_seq",
  },
  "name",
  { data_type => "text", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 category_sub_category_relations

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::CategorySubCategoryRelation>

=cut

__PACKAGE__->has_many(
  "category_sub_category_relations",
  "ULDE::Schema::ULDE::Result::CategorySubCategoryRelation",
  { "foreign.sub_category" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 document_templates

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::DocumentTemplate>

=cut

__PACKAGE__->has_many(
  "document_templates",
  "ULDE::Schema::ULDE::Result::DocumentTemplate",
  { "foreign.sub_category" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 products

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::Product>

=cut

__PACKAGE__->has_many(
  "products",
  "ULDE::Schema::ULDE::Result::Product",
  { "foreign.sub_category" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 categories

Type: many_to_many

Composing rels: L</category_sub_category_relations> -> category

=cut

__PACKAGE__->many_to_many("categories", "category_sub_category_relations", "category");


# Created by DBIx::Class::Schema::Loader v0.07033 @ 2012-09-10 01:31:08
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:eenFlj6uajBjK1L8zdoUyQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
