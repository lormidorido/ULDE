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

=head1 TABLE: C<role>

=cut

__PACKAGE__->table("role");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'roles_id_seq'

=head2 role

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
  "role",
  { data_type => "text", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 customer_roles

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::CustomerRole>

=cut

__PACKAGE__->has_many(
  "customer_roles",
  "ULDE::Schema::ULDE::Result::CustomerRole",
  { "foreign.role" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 reviewer_roles

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::ReviewerRole>

=cut

__PACKAGE__->has_many(
  "reviewer_roles",
  "ULDE::Schema::ULDE::Result::ReviewerRole",
  { "foreign.role" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 role_codes

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::RoleCode>

=cut

__PACKAGE__->has_many(
  "role_codes",
  "ULDE::Schema::ULDE::Result::RoleCode",
  { "foreign.role" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 codes

Type: many_to_many

Composing rels: L</role_codes> -> code

=cut

__PACKAGE__->many_to_many("codes", "role_codes", "code");

=head2 customers

Type: many_to_many

Composing rels: L</customer_roles> -> customer

=cut

__PACKAGE__->many_to_many("customers", "customer_roles", "customer");

=head2 reviewers

Type: many_to_many

Composing rels: L</reviewer_roles> -> reviewer

=cut

__PACKAGE__->many_to_many("reviewers", "reviewer_roles", "reviewer");


# Created by DBIx::Class::Schema::Loader v0.07045 @ 2016-04-23 04:48:34
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:hojjDIDzWedb/TFja7Hy9Q


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
