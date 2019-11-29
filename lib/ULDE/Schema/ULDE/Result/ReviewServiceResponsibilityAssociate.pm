use utf8;
package ULDE::Schema::ULDE::Result::ReviewServiceResponsibilityAssociate;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ULDE::Schema::ULDE::Result::ReviewServiceResponsibilityAssociate

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

=head1 TABLE: C<review_service_responsibility_associate>

=cut

__PACKAGE__->table("review_service_responsibility_associate");

=head1 ACCESSORS

=head2 review_service_responsibility

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 associate

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 created

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 0
  original: {default_value => \"now()"}

=head2 active

  data_type: 'boolean'
  default_value: true
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "review_service_responsibility",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "associate",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "created",
  {
    data_type     => "timestamp",
    default_value => \"current_timestamp",
    is_nullable   => 0,
    original      => { default_value => \"now()" },
  },
  "active",
  { data_type => "boolean", default_value => \"true", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</review_service_responsibility>

=item * L</associate>

=back

=cut

__PACKAGE__->set_primary_key("review_service_responsibility", "associate");

=head1 RELATIONS

=head2 associate

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::Associate>

=cut

__PACKAGE__->belongs_to(
  "associate",
  "ULDE::Schema::ULDE::Result::Associate",
  { id => "associate" },
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


# Created by DBIx::Class::Schema::Loader v0.07045 @ 2016-04-14 23:00:05
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ROeii02LKhMCAY7PYRnUtw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
