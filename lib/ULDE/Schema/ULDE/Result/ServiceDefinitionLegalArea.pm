use utf8;
package ULDE::Schema::ULDE::Result::ServiceDefinitionLegalArea;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ULDE::Schema::ULDE::Result::ServiceDefinitionLegalArea

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

=head1 TABLE: C<service_definition_legal_area>

=cut

__PACKAGE__->table("service_definition_legal_area");

=head1 ACCESSORS

=head2 service_definition

  data_type: 'smallint'
  is_foreign_key: 1
  is_nullable: 0

=head2 area

  data_type: 'smallint'
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
  "service_definition",
  { data_type => "smallint", is_foreign_key => 1, is_nullable => 0 },
  "area",
  { data_type => "smallint", is_foreign_key => 1, is_nullable => 0 },
  "description",
  { data_type => "text", is_nullable => 1 },
  "active",
  { data_type => "boolean", default_value => \"true", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</service_definition>

=item * L</area>

=back

=cut

__PACKAGE__->set_primary_key("service_definition", "area");

=head1 RELATIONS

=head2 area

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::LegalArea>

=cut

__PACKAGE__->belongs_to(
  "area",
  "ULDE::Schema::ULDE::Result::LegalArea",
  { id => "area" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" },
);

=head2 service_definition

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::ServiceDefinition>

=cut

__PACKAGE__->belongs_to(
  "service_definition",
  "ULDE::Schema::ULDE::Result::ServiceDefinition",
  { id => "service_definition" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-01-26 01:19:24
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:JBGeAUY1Lr0zoRyKzCHkdQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
