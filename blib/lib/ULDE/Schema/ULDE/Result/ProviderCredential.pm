use utf8;
package ULDE::Schema::ULDE::Result::ProviderCredential;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ULDE::Schema::ULDE::Result::ProviderCredential

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

=head1 TABLE: C<provider_credentials>

=cut

__PACKAGE__->table("provider_credentials");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'credentials_id_seq'

=head2 user_name

  data_type: 'citext'
  is_nullable: 0

=head2 password

  data_type: 'text'
  is_nullable: 0

=head2 last_login

  data_type: 'timestamp'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "credentials_id_seq",
  },
  "user_name",
  { data_type => "citext", is_nullable => 0 },
  "password",
  { data_type => "text", is_nullable => 0 },
  "last_login",
  { data_type => "timestamp", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</user_name>

=back

=cut

__PACKAGE__->set_primary_key("user_name");

=head1 UNIQUE CONSTRAINTS

=head2 C<provider_credentials_id_key>

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->add_unique_constraint("provider_credentials_id_key", ["id"]);

=head1 RELATIONS

=head2 provider_credential_roles

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::ProviderCredentialRole>

=cut

__PACKAGE__->has_many(
  "provider_credential_roles",
  "ULDE::Schema::ULDE::Result::ProviderCredentialRole",
  { "foreign.provider_credential" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 roles

Type: many_to_many

Composing rels: L</provider_credential_roles> -> role

=cut

__PACKAGE__->many_to_many("roles", "provider_credential_roles", "role");


# Created by DBIx::Class::Schema::Loader v0.07033 @ 2012-09-10 01:51:52
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:E2FxSoK/0hCCtG+ylqEnUw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
