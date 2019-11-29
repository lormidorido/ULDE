use utf8;
package ULDE::Schema::ULDE::Result::TemplateInstance;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ULDE::Schema::ULDE::Result::TemplateInstance

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

=head1 TABLE: C<template_instance>

=cut

__PACKAGE__->table("template_instance");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'document_instance_id_seq'

=head2 template

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 product_instance

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 created

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 0
  original: {default_value => \"now()"}

=head2 foreign_id

  data_type: 'integer'
  is_nullable: 1

=head2 status

  data_type: 'integer'
  default_value: 2
  is_foreign_key: 1
  is_nullable: 0

=head2 name

  data_type: 'text'
  is_nullable: 1

=head2 customer

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 archived

  data_type: 'boolean'
  default_value: false
  is_nullable: 0

=head2 signed_off

  data_type: 'boolean'
  default_value: false
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "document_instance_id_seq",
  },
  "template",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "product_instance",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "created",
  {
    data_type     => "timestamp",
    default_value => \"current_timestamp",
    is_nullable   => 0,
    original      => { default_value => \"now()" },
  },
  "foreign_id",
  { data_type => "integer", is_nullable => 1 },
  "status",
  {
    data_type      => "integer",
    default_value  => 2,
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "name",
  { data_type => "text", is_nullable => 1 },
  "customer",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "archived",
  { data_type => "boolean", default_value => \"false", is_nullable => 0 },
  "signed_off",
  { data_type => "boolean", default_value => \"false", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 activity_template_instances

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::ActivityTemplateInstance>

=cut

__PACKAGE__->has_many(
  "activity_template_instances",
  "ULDE::Schema::ULDE::Result::ActivityTemplateInstance",
  { "foreign.template_instance" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 customer

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::Customer>

=cut

__PACKAGE__->belongs_to(
  "customer",
  "ULDE::Schema::ULDE::Result::Customer",
  { id => "customer" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "SET NULL",
    on_update     => "NO ACTION",
  },
);

=head2 event_logs

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::EventLog>

=cut

__PACKAGE__->has_many(
  "event_logs",
  "ULDE::Schema::ULDE::Result::EventLog",
  { "foreign.template_instance" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 product_instance

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::ProductInstance>

=cut

__PACKAGE__->belongs_to(
  "product_instance",
  "ULDE::Schema::ULDE::Result::ProductInstance",
  { id => "product_instance" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "NO ACTION",
  },
);

=head2 status

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::StatusCode>

=cut

__PACKAGE__->belongs_to(
  "status",
  "ULDE::Schema::ULDE::Result::StatusCode",
  { id => "status" },
  { is_deferrable => 0, on_delete => "RESTRICT", on_update => "NO ACTION" },
);

=head2 template

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::DocumentTemplate>

=cut

__PACKAGE__->belongs_to(
  "template",
  "ULDE::Schema::ULDE::Result::DocumentTemplate",
  { id => "template" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "NO ACTION",
  },
);

=head2 template_instance_file_storages

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::TemplateInstanceFileStorage>

=cut

__PACKAGE__->has_many(
  "template_instance_file_storages",
  "ULDE::Schema::ULDE::Result::TemplateInstanceFileStorage",
  { "foreign.template_instance" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07045 @ 2016-04-16 03:49:07
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:wXp2kwAfcAhsmQ08slx51Q

__PACKAGE__->many_to_many("files", "template_instance_file_storages", "file");

use DateTime::Format::Pg;

__PACKAGE__->inflate_column('created', {
        inflate => sub { DateTime::Format::Pg->parse_timestamp(shift); },
        deflate => sub { DateTime::Format::Pg->format_timestamp(shift); },
    });

__PACKAGE__->meta->make_immutable;
1;
