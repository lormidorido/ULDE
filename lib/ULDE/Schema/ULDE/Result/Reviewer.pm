use utf8;
package ULDE::Schema::ULDE::Result::Reviewer;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ULDE::Schema::ULDE::Result::Reviewer

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

=head1 TABLE: C<reviewer>

=cut

__PACKAGE__->table("reviewer");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'reviewer_id_seq'

=head2 title

  data_type: 'text'
  is_nullable: 1

=head2 first_name

  data_type: 'text'
  is_nullable: 1

=head2 surname

  data_type: 'text'
  is_nullable: 1

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

=head2 created

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 0
  original: {default_value => \"now()"}

=head2 email

  data_type: 'citext'
  is_nullable: 0

=head2 registration_code

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "reviewer_id_seq",
  },
  "title",
  { data_type => "text", is_nullable => 1 },
  "first_name",
  { data_type => "text", is_nullable => 1 },
  "surname",
  { data_type => "text", is_nullable => 1 },
  "user_name",
  { data_type => "text", is_nullable => 1 },
  "password",
  { data_type => "text", is_nullable => 1 },
  "status",
  { data_type => "text", default_value => "active", is_nullable => 0 },
  "created",
  {
    data_type     => "timestamp",
    default_value => \"current_timestamp",
    is_nullable   => 0,
    original      => { default_value => \"now()" },
  },
  "email",
  { data_type => "citext", is_nullable => 0 },
  "registration_code",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 event_logs

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::EventLog>

=cut

__PACKAGE__->has_many(
  "event_logs",
  "ULDE::Schema::ULDE::Result::EventLog",
  { "foreign.reviewer" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 messages

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::Message>

=cut

__PACKAGE__->has_many(
  "messages",
  "ULDE::Schema::ULDE::Result::Message",
  { "foreign.reviewer" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 registration_code

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::Code>

=cut

__PACKAGE__->belongs_to(
  "registration_code",
  "ULDE::Schema::ULDE::Result::Code",
  { id => "registration_code" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "SET NULL",
    on_update     => "NO ACTION",
  },
);

=head2 reviewer_customers

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::ReviewerCustomer>

=cut

__PACKAGE__->has_many(
  "reviewer_customers",
  "ULDE::Schema::ULDE::Result::ReviewerCustomer",
  { "foreign.reviewer" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 reviewer_responsibilities

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::ReviewerResponsibility>

=cut

__PACKAGE__->has_many(
  "reviewer_responsibilities",
  "ULDE::Schema::ULDE::Result::ReviewerResponsibility",
  { "foreign.reviewer" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 reviewer_responsibility_senior_reviewers

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::ReviewerResponsibility>

=cut

__PACKAGE__->has_many(
  "reviewer_responsibility_senior_reviewers",
  "ULDE::Schema::ULDE::Result::ReviewerResponsibility",
  { "foreign.senior_reviewer" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 reviewer_roles

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::ReviewerRole>

=cut

__PACKAGE__->has_many(
  "reviewer_roles",
  "ULDE::Schema::ULDE::Result::ReviewerRole",
  { "foreign.reviewer" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 customers

Type: many_to_many

Composing rels: L</reviewer_customers> -> customer

=cut

__PACKAGE__->many_to_many("customers", "reviewer_customers", "customer");

=head2 roles

Type: many_to_many

Composing rels: L</reviewer_roles> -> role

=cut

__PACKAGE__->many_to_many("roles", "reviewer_roles", "role");


# Created by DBIx::Class::Schema::Loader v0.07045 @ 2016-04-23 06:13:26
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:2PM6Gscd2ZyNFN1zlWg7+w


__PACKAGE__->many_to_many("responsibilities", "reviewer_responsibilities", "responsibility");

__PACKAGE__->meta->make_immutable;
1;
