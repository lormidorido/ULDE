use utf8;
package ULDE::Schema::ULDE::Result::TemplateInstanceFileStorage;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ULDE::Schema::ULDE::Result::TemplateInstanceFileStorage

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

=head1 TABLE: C<template_instance_file_storage>

=cut

__PACKAGE__->table("template_instance_file_storage");

=head1 ACCESSORS

=head2 template_instance

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 file

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "template_instance",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "file",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</template_instance>

=item * L</file>

=back

=cut

__PACKAGE__->set_primary_key("template_instance", "file");

=head1 UNIQUE CONSTRAINTS

=head2 C<template_instance_file_storage_file_key>

=over 4

=item * L</file>

=back

=cut

__PACKAGE__->add_unique_constraint("template_instance_file_storage_file_key", ["file"]);

=head1 RELATIONS

=head2 file

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::FileStorage>

=cut

__PACKAGE__->belongs_to(
  "file",
  "ULDE::Schema::ULDE::Result::FileStorage",
  { id => "file" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" },
);

=head2 template_instance

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::TemplateInstance>

=cut

__PACKAGE__->belongs_to(
  "template_instance",
  "ULDE::Schema::ULDE::Result::TemplateInstance",
  { id => "template_instance" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-08-04 00:50:35
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:/IZZr6iTA3gnn2+vYMXW2Q


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
