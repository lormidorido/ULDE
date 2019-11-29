use utf8;
package ULDE::Schema::ULDE::Result::Role;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ULDE::Schema::ULDE::Result::Role

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

=head1 TABLE: C<roles>

=cut

__PACKAGE__->table("roles");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'roles_id_seq'

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
    sequence          => "roles_id_seq",
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

=head2 customer_account_credential_roles

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::CustomerAccountCredentialRole>

=cut

__PACKAGE__->has_many(
  "customer_account_credential_roles",
  "ULDE::Schema::ULDE::Result::CustomerAccountCredentialRole",
  { "foreign.role" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 provider_credential_roles

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::ProviderCredentialRole>

=cut

__PACKAGE__->has_many(
  "provider_credential_roles",
  "ULDE::Schema::ULDE::Result::ProviderCredentialRole",
  { "foreign.role" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 customer_account_credentials

Type: many_to_many

Composing rels: L</customer_account_credential_roles> -> customer_account_credential

=cut

__PACKAGE__->many_to_many(
  "customer_account_credentials",
  "customer_account_credential_roles",
  "customer_account_credential",
);

=head2 provider_credentials

Type: many_to_many

Composing rels: L</provider_credential_roles> -> provider_credential

=cut

__PACKAGE__->many_to_many(
  "provider_credentials",
  "provider_credential_roles",
  "provider_credential",
);


# Created by DBIx::Class::Schema::Loader v0.07033 @ 2012-09-10 01:51:52
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:pNv0LGOC1U5g9Qt+XnSSig


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
