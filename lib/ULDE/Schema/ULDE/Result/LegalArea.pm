use utf8;
package ULDE::Schema::ULDE::Result::LegalArea;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ULDE::Schema::ULDE::Result::LegalArea

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

=head1 TABLE: C<legal_area>

=cut

__PACKAGE__->table("legal_area");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'legal_areas_id_seq'

=head2 name

  data_type: 'text'
  is_nullable: 0

=head2 description

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "legal_areas_id_seq",
  },
  "name",
  { data_type => "text", is_nullable => 0 },
  "description",
  { data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 document_templates

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::DocumentTemplate>

=cut

__PACKAGE__->has_many(
  "document_templates",
  "ULDE::Schema::ULDE::Result::DocumentTemplate",
  { "foreign.area" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 products

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::Product>

=cut

__PACKAGE__->has_many(
  "products",
  "ULDE::Schema::ULDE::Result::Product",
  { "foreign.legal_area" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 service_definition_legal_areas

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::ServiceDefinitionLegalArea>

=cut

__PACKAGE__->has_many(
  "service_definition_legal_areas",
  "ULDE::Schema::ULDE::Result::ServiceDefinitionLegalArea",
  { "foreign.area" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-03-09 00:44:23
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:h9sV93QR4eBqvs/vmbz4gg


__PACKAGE__->many_to_many("service_definitions", "service_definition_legal_areas", "service_definition");

__PACKAGE__->meta->make_immutable;
1;
