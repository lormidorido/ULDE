use utf8;
package ULDE::Schema::ULDE::Result::DocumentTemplate;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ULDE::Schema::ULDE::Result::DocumentTemplate

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

=head1 TABLE: C<document_templates>

=cut

__PACKAGE__->table("document_templates");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'document_template_id_seq'

=head2 name

  data_type: 'text'
  is_nullable: 0

=head2 description

  data_type: 'text'
  is_nullable: 1

=head2 foreign_template_id

  data_type: 'integer'
  is_nullable: 1

=head2 document_assembly_provider

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 area

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 category

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 sub_category

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 personal

  data_type: 'boolean'
  default_value: false
  is_nullable: 0

=head2 business

  data_type: 'boolean'
  default_value: false
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "document_template_id_seq",
  },
  "name",
  { data_type => "text", is_nullable => 0 },
  "description",
  { data_type => "text", is_nullable => 1 },
  "foreign_template_id",
  { data_type => "integer", is_nullable => 1 },
  "document_assembly_provider",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "area",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "category",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "sub_category",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "personal",
  { data_type => "boolean", default_value => \"false", is_nullable => 0 },
  "business",
  { data_type => "boolean", default_value => \"false", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 area

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::LegalArea>

=cut

__PACKAGE__->belongs_to(
  "area",
  "ULDE::Schema::ULDE::Result::LegalArea",
  { id => "area" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "SET NULL",
    on_update     => "NO ACTION",
  },
);

=head2 category

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::LegalCategory>

=cut

__PACKAGE__->belongs_to(
  "category",
  "ULDE::Schema::ULDE::Result::LegalCategory",
  { id => "category" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

=head2 document_assembly_provider

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::DocumentAssemblyProvider>

=cut

__PACKAGE__->belongs_to(
  "document_assembly_provider",
  "ULDE::Schema::ULDE::Result::DocumentAssemblyProvider",
  { id => "document_assembly_provider" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
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
  { "foreign.template" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 document_template_jurisdictions

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::DocumentTemplateJurisdiction>

=cut

__PACKAGE__->has_many(
  "document_template_jurisdictions",
  "ULDE::Schema::ULDE::Result::DocumentTemplateJurisdiction",
  { "foreign.document_template" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 document_template_versions

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::DocumentTemplateVersion>

=cut

__PACKAGE__->has_many(
  "document_template_versions",
  "ULDE::Schema::ULDE::Result::DocumentTemplateVersion",
  { "foreign.document_template" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 product_document_templates

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::ProductDocumentTemplate>

=cut

__PACKAGE__->has_many(
  "product_document_templates",
  "ULDE::Schema::ULDE::Result::ProductDocumentTemplate",
  { "foreign.document_template" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 sub_category

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::LegalSubCategory>

=cut

__PACKAGE__->belongs_to(
  "sub_category",
  "ULDE::Schema::ULDE::Result::LegalSubCategory",
  { id => "sub_category" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

=head2 jurisdictions

Type: many_to_many

Composing rels: L</document_template_jurisdictions> -> jurisdiction

=cut

__PACKAGE__->many_to_many(
  "jurisdictions",
  "document_template_jurisdictions",
  "jurisdiction",
);


# Created by DBIx::Class::Schema::Loader v0.07033 @ 2012-09-10 01:31:08
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:6e23i2DaU7KRR3wb8n6Yww


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
