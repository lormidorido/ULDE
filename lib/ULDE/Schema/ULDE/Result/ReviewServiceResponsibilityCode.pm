use utf8;
package ULDE::Schema::ULDE::Result::ReviewServiceResponsibilityCode;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ULDE::Schema::ULDE::Result::ReviewServiceResponsibilityCode

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

=head1 TABLE: C<review_service_responsibility_code>

=cut

__PACKAGE__->table("review_service_responsibility_code");

=head1 ACCESSORS

=head2 review_service_responsibility

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 code

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 primary

  data_type: 'boolean'
  default_value: false
  is_nullable: 0

=head2 senior_reviewer_code

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "review_service_responsibility",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "code",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "primary",
  { data_type => "boolean", default_value => \"false", is_nullable => 0 },
  "senior_reviewer_code",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</review_service_responsibility>

=item * L</code>

=back

=cut

__PACKAGE__->set_primary_key("review_service_responsibility", "code");

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

=head2 review_service_responsibility

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::ReviewServiceResponsibility>

=cut

__PACKAGE__->belongs_to(
  "review_service_responsibility",
  "ULDE::Schema::ULDE::Result::ReviewServiceResponsibility",
  { id => "review_service_responsibility" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" },
);

=head2 senior_reviewer_code

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::Code>

=cut

__PACKAGE__->belongs_to(
  "senior_reviewer_code",
  "ULDE::Schema::ULDE::Result::Code",
  { id => "senior_reviewer_code" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "SET NULL",
    on_update     => "NO ACTION",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07045 @ 2016-04-23 12:02:15
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:rbbxCTR3A3XO7YsX7tHKfg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
