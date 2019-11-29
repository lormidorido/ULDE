use utf8;
package ULDE::Schema::ULDE::Result::Code;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ULDE::Schema::ULDE::Result::Code

=head1 DESCRIPTION

attribute type citext requires yum install postgresql93-contrib

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

=head1 TABLE: C<code>

=cut

__PACKAGE__->table("code");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'code_id_seq'

=head2 code

  data_type: 'citext'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "code_id_seq",
  },
  "code",
  { data_type => "citext", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 review_service_responsibility_code_senior_reviewer_codes

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::ReviewServiceResponsibilityCode>

=cut

__PACKAGE__->has_many(
  "review_service_responsibility_code_senior_reviewer_codes",
  "ULDE::Schema::ULDE::Result::ReviewServiceResponsibilityCode",
  { "foreign.senior_reviewer_code" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 review_service_responsibility_codes

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::ReviewServiceResponsibilityCode>

=cut

__PACKAGE__->has_many(
  "review_service_responsibility_codes",
  "ULDE::Schema::ULDE::Result::ReviewServiceResponsibilityCode",
  { "foreign.code" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 reviewers

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::Reviewer>

=cut

__PACKAGE__->has_many(
  "reviewers",
  "ULDE::Schema::ULDE::Result::Reviewer",
  { "foreign.registration_code" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 role_codes

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::RoleCode>

=cut

__PACKAGE__->has_many(
  "role_codes",
  "ULDE::Schema::ULDE::Result::RoleCode",
  { "foreign.code" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 roles

Type: many_to_many

Composing rels: L</role_codes> -> role

=cut

__PACKAGE__->many_to_many("roles", "role_codes", "role");


# Created by DBIx::Class::Schema::Loader v0.07045 @ 2016-04-23 12:02:15
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:lD2vfoQ6XvhiAYvJPgp0yg


__PACKAGE__->many_to_many("review_service_responsibilities", "review_service_responsibility_codes", "review_service_responsibility");

__PACKAGE__->meta->make_immutable;
1;
