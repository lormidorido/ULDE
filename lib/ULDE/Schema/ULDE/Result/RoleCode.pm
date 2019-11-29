use utf8;
package ULDE::Schema::ULDE::Result::RoleCode;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ULDE::Schema::ULDE::Result::RoleCode

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

=head1 TABLE: C<role_code>

=cut

__PACKAGE__->table("role_code");

=head1 ACCESSORS

=head2 role

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 code

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "role",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "code",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</role>

=item * L</code>

=back

=cut

__PACKAGE__->set_primary_key("role", "code");

=head1 RELATIONS

=head2 code

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::Code>

=cut

__PACKAGE__->belongs_to(
  "code",
  "ULDE::Schema::ULDE::Result::Code",
  { id => "code" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" },
);

=head2 role

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::Role>

=cut

__PACKAGE__->belongs_to(
  "role",
  "ULDE::Schema::ULDE::Result::Role",
  { id => "role" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07045 @ 2016-04-23 04:48:34
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:tRooloiqdkl4ylCz/VM0RQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
