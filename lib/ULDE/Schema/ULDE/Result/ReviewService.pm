use utf8;
package ULDE::Schema::ULDE::Result::ReviewService;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ULDE::Schema::ULDE::Result::ReviewService

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

=head1 TABLE: C<review_service>

=cut

__PACKAGE__->table("review_service");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'review_service_id_seq'

=head2 name

  data_type: 'text'
  is_nullable: 1

=head2 correspondence_identifier

  data_type: 'text'
  is_nullable: 1

=head2 img_logo

  data_type: 'text'
  is_nullable: 1

=head2 css_class

  data_type: 'text'
  is_nullable: 1

=head2 is_associate

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
    sequence          => "review_service_id_seq",
  },
  "name",
  { data_type => "text", is_nullable => 1 },
  "correspondence_identifier",
  { data_type => "text", is_nullable => 1 },
  "img_logo",
  { data_type => "text", is_nullable => 1 },
  "css_class",
  { data_type => "text", is_nullable => 1 },
  "is_associate",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 is_associate

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::Associate>

=cut

__PACKAGE__->belongs_to(
  "is_associate",
  "ULDE::Schema::ULDE::Result::Associate",
  { id => "is_associate" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "SET NULL",
    on_update     => "NO ACTION",
  },
);

=head2 review_service_responsibilities

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::ReviewServiceResponsibility>

=cut

__PACKAGE__->has_many(
  "review_service_responsibilities",
  "ULDE::Schema::ULDE::Result::ReviewServiceResponsibility",
  { "foreign.review_service" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07045 @ 2016-04-22 10:51:30
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:aKrQc6kEjRE6fKePcKI6/w


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
