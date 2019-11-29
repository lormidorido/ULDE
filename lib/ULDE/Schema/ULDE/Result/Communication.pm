use utf8;
package ULDE::Schema::ULDE::Result::Communication;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ULDE::Schema::ULDE::Result::Communication

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

=head1 TABLE: C<communication>

=cut

__PACKAGE__->table("communication");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'communication_id_seq'

=head2 customer_account

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 active

  data_type: 'boolean'
  default_value: true
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

=head2 name

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "communication_id_seq",
  },
  "customer_account",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "active",
  { data_type => "boolean", default_value => \"true", is_nullable => 1 },
  "product_instance",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "created",
  {
    data_type     => "timestamp",
    default_value => \"current_timestamp",
    is_nullable   => 0,
    original      => { default_value => \"now()" },
  },
  "name",
  { data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 customer_account

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::CustomerAccount>

=cut

__PACKAGE__->belongs_to(
  "customer_account",
  "ULDE::Schema::ULDE::Result::CustomerAccount",
  { id => "customer_account" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" },
);

=head2 messages

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::Message>

=cut

__PACKAGE__->has_many(
  "messages",
  "ULDE::Schema::ULDE::Result::Message",
  { "foreign.communication" => "self.id" },
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


# Created by DBIx::Class::Schema::Loader v0.07045 @ 2016-03-07 07:43:26
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Jv+1h45CEygWE1WHbY/B0A

use DateTime::Format::Pg;

__PACKAGE__->inflate_column('created', {
    inflate => sub { DateTime::Format::Pg->parse_timestamp(shift); },
    deflate => sub { DateTime::Format::Pg->format_timestamp(shift); },
  });

__PACKAGE__->meta->make_immutable;
1;
