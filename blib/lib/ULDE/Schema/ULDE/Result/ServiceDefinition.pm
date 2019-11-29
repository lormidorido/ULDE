use utf8;
package ULDE::Schema::ULDE::Result::ServiceDefinition;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ULDE::Schema::ULDE::Result::ServiceDefinition

=head1 DESCRIPTION

data type citext required for this table. Associated module needs to be added in 8.4

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

=head1 TABLE: C<service_definitions>

=cut

__PACKAGE__->table("service_definitions");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'service_specification_id_seq'

=head2 provider

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 url

  data_type: 'citext'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "service_specification_id_seq",
  },
  "provider",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "url",
  { data_type => "citext", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<service_definitions_url_key>

=over 4

=item * L</url>

=back

=cut

__PACKAGE__->add_unique_constraint("service_definitions_url_key", ["url"]);

=head1 RELATIONS

=head2 customer_account_credentials

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::CustomerAccountCredential>

=cut

__PACKAGE__->has_many(
  "customer_account_credentials",
  "ULDE::Schema::ULDE::Result::CustomerAccountCredential",
  { "foreign.service_definition" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 customer_accounts

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::CustomerAccount>

=cut

__PACKAGE__->has_many(
  "customer_accounts",
  "ULDE::Schema::ULDE::Result::CustomerAccount",
  { "foreign.service_definition" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 product_service_definitions

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::ProductServiceDefinition>

=cut

__PACKAGE__->has_many(
  "product_service_definitions",
  "ULDE::Schema::ULDE::Result::ProductServiceDefinition",
  { "foreign.service_definition" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 provider

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::Provider>

=cut

__PACKAGE__->belongs_to(
  "provider",
  "ULDE::Schema::ULDE::Result::Provider",
  { id => "provider" },
  { is_deferrable => 0, on_delete => "RESTRICT", on_update => "NO ACTION" },
);

=head2 service_definition_legal_areas

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::ServiceDefinitionLegalArea>

=cut

__PACKAGE__->has_many(
  "service_definition_legal_areas",
  "ULDE::Schema::ULDE::Result::ServiceDefinitionLegalArea",
  { "foreign.service_definition" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07033 @ 2012-09-10 01:31:08
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:HlndfOdittTFfhKDwC9cBQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
