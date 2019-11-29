use utf8;
package ULDE::Schema::ULDE::Result::ProviderCredentialRole;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ULDE::Schema::ULDE::Result::ProviderCredentialRole

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

=head1 TABLE: C<provider_credential_roles>

=cut

__PACKAGE__->table("provider_credential_roles");

=head1 ACCESSORS

=head2 provider_credential

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 role

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "provider_credential",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "role",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</provider_credential>

=item * L</role>

=back

=cut

__PACKAGE__->set_primary_key("provider_credential", "role");

=head1 RELATIONS

=head2 provider_credential

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::ProviderCredential>

=cut

__PACKAGE__->belongs_to(
  "provider_credential",
  "ULDE::Schema::ULDE::Result::ProviderCredential",
  { id => "provider_credential" },
  { is_deferrable => 0, on_delete => "CASCADE,", on_update => "NO ACTION" },
);

=head2 role

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::Role>

=cut

__PACKAGE__->belongs_to(
  "role",
  "ULDE::Schema::ULDE::Result::Role",
  { id => "role" },
  { is_deferrable => 0, on_delete => "CASCADE,", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-06-07 03:39:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:bisuyg7dClw3jQCFPWex7g


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
