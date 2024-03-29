use utf8;
package ULDE::Schema::ULDE::Result::ServiceDefinitionUrl;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ULDE::Schema::ULDE::Result::ServiceDefinitionUrl

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

=head1 TABLE: C<service_definition_url>

=cut

__PACKAGE__->table("service_definition_url");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'service_definition_url_id_seq'

=head2 service_definition

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 name

  data_type: 'citext'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "service_definition_url_id_seq",
  },
  "service_definition",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "name",
  { data_type => "citext", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 service_definition

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::ServiceDefinition>

=cut

__PACKAGE__->belongs_to(
  "service_definition",
  "ULDE::Schema::ULDE::Result::ServiceDefinition",
  { id => "service_definition" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "NO ACTION",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-06-14 15:59:07
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:HeMxtEERqV7cZfFSPtozUQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
