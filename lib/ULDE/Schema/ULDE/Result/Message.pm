use utf8;
package ULDE::Schema::ULDE::Result::Message;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ULDE::Schema::ULDE::Result::Message

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

=head1 TABLE: C<message>

=cut

__PACKAGE__->table("message");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'message_id_seq'

=head2 created

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 0
  original: {default_value => \"now()"}

=head2 content

  data_type: 'text'
  is_nullable: 1

=head2 reviewer

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 customer

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 communication

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 unread

  data_type: 'boolean'
  default_value: true
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "message_id_seq",
  },
  "created",
  {
    data_type     => "timestamp",
    default_value => \"current_timestamp",
    is_nullable   => 0,
    original      => { default_value => \"now()" },
  },
  "content",
  { data_type => "text", is_nullable => 1 },
  "reviewer",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "customer",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "communication",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "unread",
  { data_type => "boolean", default_value => \"true", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 communication

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::Communication>

=cut

__PACKAGE__->belongs_to(
  "communication",
  "ULDE::Schema::ULDE::Result::Communication",
  { id => "communication" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" },
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
    on_delete     => "CASCADE",
    on_update     => "NO ACTION",
  },
);

=head2 reviewer

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::Reviewer>

=cut

__PACKAGE__->belongs_to(
  "reviewer",
  "ULDE::Schema::ULDE::Result::Reviewer",
  { id => "reviewer" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "NO ACTION",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07045 @ 2016-03-07 07:43:26
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:bpmklUi5DaK97S9u6qCfLA

use DateTime::Format::Pg;

__PACKAGE__->inflate_column('created', {
    inflate => sub { DateTime::Format::Pg->parse_timestamp(shift); },
    deflate => sub { DateTime::Format::Pg->format_timestamp(shift); },
  });


__PACKAGE__->meta->make_immutable;
1;
