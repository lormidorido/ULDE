use utf8;
package ULDE::Schema::ULDE::Result::Jurisdiction;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ULDE::Schema::ULDE::Result::Jurisdiction

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

=head1 TABLE: C<jurisdictions>

=cut

__PACKAGE__->table("jurisdictions");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'jurisdiction_id_seq'

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
    sequence          => "jurisdiction_id_seq",
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

=head2 document_template_jurisdictions

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::DocumentTemplateJurisdiction>

=cut

__PACKAGE__->has_many(
  "document_template_jurisdictions",
  "ULDE::Schema::ULDE::Result::DocumentTemplateJurisdiction",
  { "foreign.jurisdiction" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 product_jurisdictions

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::ProductJurisdiction>

=cut

__PACKAGE__->has_many(
  "product_jurisdictions",
  "ULDE::Schema::ULDE::Result::ProductJurisdiction",
  { "foreign.jurisdiction" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 document_templates

Type: many_to_many

Composing rels: L</document_template_jurisdictions> -> document_template

=cut

__PACKAGE__->many_to_many(
  "document_templates",
  "document_template_jurisdictions",
  "document_template",
);

=head2 products

Type: many_to_many

Composing rels: L</product_jurisdictions> -> product

=cut

__PACKAGE__->many_to_many("products", "product_jurisdictions", "product");


# Created by DBIx::Class::Schema::Loader v0.07033 @ 2012-09-10 01:31:08
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:SGmmODPPT48beoeoTXuE2A


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
