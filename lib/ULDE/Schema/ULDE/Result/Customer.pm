use utf8;
package ULDE::Schema::ULDE::Result::Customer;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ULDE::Schema::ULDE::Result::Customer

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

=head1 TABLE: C<customer>

=cut

__PACKAGE__->table("customer");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'customer_id_seq'

=head2 account

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 title

  data_type: 'text'
  is_nullable: 1

=head2 first_name

  data_type: 'text'
  is_nullable: 1

=head2 surname

  data_type: 'text'
  is_nullable: 1

=head2 created

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 0
  original: {default_value => \"now()"}

=head2 user_name

  data_type: 'text'
  is_nullable: 1

=head2 password

  data_type: 'text'
  is_nullable: 1

=head2 status

  data_type: 'text'
  default_value: 'active'
  is_nullable: 0

=head2 dob

  data_type: 'date'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "customer_id_seq",
  },
  "account",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "title",
  { data_type => "text", is_nullable => 1 },
  "first_name",
  { data_type => "text", is_nullable => 1 },
  "surname",
  { data_type => "text", is_nullable => 1 },
  "created",
  {
    data_type     => "timestamp",
    default_value => \"current_timestamp",
    is_nullable   => 0,
    original      => { default_value => \"now()" },
  },
  "user_name",
  { data_type => "text", is_nullable => 1 },
  "password",
  { data_type => "text", is_nullable => 1 },
  "status",
  { data_type => "text", default_value => "active", is_nullable => 0 },
  "dob",
  { data_type => "date", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<customers_user_name_key>

=over 4

=item * L</user_name>

=back

=cut

__PACKAGE__->add_unique_constraint("customers_user_name_key", ["user_name"]);

=head1 RELATIONS

=head2 account

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::CustomerAccount>

=cut

__PACKAGE__->belongs_to(
  "account",
  "ULDE::Schema::ULDE::Result::CustomerAccount",
  { id => "account" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" },
);

=head2 customer_addresses

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::CustomerAddress>

=cut

__PACKAGE__->has_many(
  "customer_addresses",
  "ULDE::Schema::ULDE::Result::CustomerAddress",
  { "foreign.customer" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 customer_roles

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::CustomerRole>

=cut

__PACKAGE__->has_many(
  "customer_roles",
  "ULDE::Schema::ULDE::Result::CustomerRole",
  { "foreign.customer" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 event_logs

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::EventLog>

=cut

__PACKAGE__->has_many(
  "event_logs",
  "ULDE::Schema::ULDE::Result::EventLog",
  { "foreign.customer" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 messages

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::Message>

=cut

__PACKAGE__->has_many(
  "messages",
  "ULDE::Schema::ULDE::Result::Message",
  { "foreign.customer" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 reviewer_customers

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::ReviewerCustomer>

=cut

__PACKAGE__->has_many(
  "reviewer_customers",
  "ULDE::Schema::ULDE::Result::ReviewerCustomer",
  { "foreign.customer" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 template_instances

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::TemplateInstance>

=cut

__PACKAGE__->has_many(
  "template_instances",
  "ULDE::Schema::ULDE::Result::TemplateInstance",
  { "foreign.customer" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 addresses

Type: many_to_many

Composing rels: L</customer_addresses> -> address

=cut

__PACKAGE__->many_to_many("addresses", "customer_addresses", "address");

=head2 reviewers

Type: many_to_many

Composing rels: L</reviewer_customers> -> reviewer

=cut

__PACKAGE__->many_to_many("reviewers", "reviewer_customers", "reviewer");

=head2 roles

Type: many_to_many

Composing rels: L</customer_roles> -> role

=cut

__PACKAGE__->many_to_many("roles", "customer_roles", "role");


# Created by DBIx::Class::Schema::Loader v0.07045 @ 2016-04-21 15:03:58
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:mcEkMKLRbbimL80arA3qwQ


use DateTime::Format::Pg;

__PACKAGE__->inflate_column('dob', {
        inflate => sub { DateTime::Format::Pg->parse_date(shift); },
        deflate => sub { DateTime::Format::Pg->format_date(shift); },
    });

__PACKAGE__->meta->make_immutable;
1;
