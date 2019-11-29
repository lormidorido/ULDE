use utf8;
package ULDE::Schema::ULDE::Result::ReviewerResponsibility;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ULDE::Schema::ULDE::Result::ReviewerResponsibility

=head1 DESCRIPTION

Important to remember that there must always be one, and only one, reviewer linked to this table that is auhotised to sign off if, and only if, sign off is required
### UPDATE - now there can be many reviewers with sign off rights provided there is a senior junior relationshiip defined for all juniors 

primary attribute is to identify through a review service responsibility what review servive reviewer is part of (may be doing review for other services on an "external" basis)

currently primary set to default to true - this is a temp hack whilst sorting out ULDE::Component and link table atributes! (does not work for booleans)

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

=head1 TABLE: C<reviewer_responsibility>

=cut

__PACKAGE__->table("reviewer_responsibility");

=head1 ACCESSORS

=head2 responsibility

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 reviewer

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 primary

  data_type: 'boolean'
  default_value: true
  is_nullable: 0

=head2 senior_reviewer

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "responsibility",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "reviewer",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "primary",
  { data_type => "boolean", default_value => \"true", is_nullable => 0 },
  "senior_reviewer",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</responsibility>

=item * L</reviewer>

=back

=cut

__PACKAGE__->set_primary_key("responsibility", "reviewer");

=head1 RELATIONS

=head2 responsibility

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::ReviewServiceResponsibility>

=cut

__PACKAGE__->belongs_to(
  "responsibility",
  "ULDE::Schema::ULDE::Result::ReviewServiceResponsibility",
  { id => "responsibility" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" },
);

=head2 reviewer

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::Reviewer>

=cut

__PACKAGE__->belongs_to(
  "reviewer",
  "ULDE::Schema::ULDE::Result::Reviewer",
  { id => "reviewer" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" },
);

=head2 senior_reviewer

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::Reviewer>

=cut

__PACKAGE__->belongs_to(
  "senior_reviewer",
  "ULDE::Schema::ULDE::Result::Reviewer",
  { id => "senior_reviewer" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "SET NULL",
    on_update     => "NO ACTION",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07045 @ 2016-04-23 04:18:01
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:HwhMTXCkuvritLtxqjDd5g


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
