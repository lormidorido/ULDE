use utf8;
package ULDE::Schema::ULDE::Result::ReviewServiceResponsibility;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ULDE::Schema::ULDE::Result::ReviewServiceResponsibility

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

=head1 TABLE: C<review_service_responsibility>

=cut

__PACKAGE__->table("review_service_responsibility");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'review_accountability_id_seq'

=head2 review_service

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 created

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 0
  original: {default_value => \"now()"}

=head2 status

  data_type: 'text'
  default_value: 'active'
  is_nullable: 0

=head2 sign_off_required

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
    sequence          => "review_accountability_id_seq",
  },
  "review_service",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "created",
  {
    data_type     => "timestamp",
    default_value => \"current_timestamp",
    is_nullable   => 0,
    original      => { default_value => \"now()" },
  },
  "status",
  { data_type => "text", default_value => "active", is_nullable => 0 },
  "sign_off_required",
  { data_type => "boolean", default_value => \"false", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 review_service

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::ReviewService>

=cut

__PACKAGE__->belongs_to(
  "review_service",
  "ULDE::Schema::ULDE::Result::ReviewService",
  { id => "review_service" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "NO ACTION",
  },
);

=head2 review_service_responsibility_associates

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::ReviewServiceResponsibilityAssociate>

=cut

__PACKAGE__->has_many(
  "review_service_responsibility_associates",
  "ULDE::Schema::ULDE::Result::ReviewServiceResponsibilityAssociate",
  { "foreign.review_service_responsibility" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 review_service_responsibility_codes

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::ReviewServiceResponsibilityCode>

=cut

__PACKAGE__->has_many(
  "review_service_responsibility_codes",
  "ULDE::Schema::ULDE::Result::ReviewServiceResponsibilityCode",
  { "foreign.review_service_responsibility" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 reviewer_responsibilities

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::ReviewerResponsibility>

=cut

__PACKAGE__->has_many(
  "reviewer_responsibilities",
  "ULDE::Schema::ULDE::Result::ReviewerResponsibility",
  { "foreign.responsibility" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07045 @ 2016-04-22 20:55:16
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:HMGuR8oAIt7dhAFH/LSHOg


__PACKAGE__->many_to_many("associates", "review_service_responsibility_associates", "associate");

__PACKAGE__->meta->make_immutable;
1;
