use utf8;
package ULDE::Schema::ULDE::Result::EventLog;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ULDE::Schema::ULDE::Result::EventLog

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

=head1 TABLE: C<event_log>

=cut

__PACKAGE__->table("event_log");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'event_log_id_seq'

=head2 customer

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 reviewer

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 product_instance

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 template_instance

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 event_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 timestamp

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 0
  original: {default_value => \"now()"}

=head2 detail

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "event_log_id_seq",
  },
  "customer",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "reviewer",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "product_instance",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "template_instance",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "event_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "timestamp",
  {
    data_type     => "timestamp",
    default_value => \"current_timestamp",
    is_nullable   => 0,
    original      => { default_value => \"now()" },
  },
  "detail",
  { data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

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

=head2 event

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::EventCode>

=cut

__PACKAGE__->belongs_to(
  "event",
  "ULDE::Schema::ULDE::Result::EventCode",
  { id => "event_id" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" },
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

=head2 template_instance

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::TemplateInstance>

=cut

__PACKAGE__->belongs_to(
  "template_instance",
  "ULDE::Schema::ULDE::Result::TemplateInstance",
  { id => "template_instance" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "NO ACTION",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-04-23 04:32:47
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:yj/U3SsK+gJ4uFQbe4JEyw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
