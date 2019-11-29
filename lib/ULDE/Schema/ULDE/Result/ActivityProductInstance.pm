use utf8;
package ULDE::Schema::ULDE::Result::ActivityProductInstance;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ULDE::Schema::ULDE::Result::ActivityProductInstance

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

=head1 TABLE: C<activity_product_instance>

=cut

__PACKAGE__->table("activity_product_instance");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'activity_id_seq'

=head2 timestamp

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 0
  original: {default_value => \"now()"}

=head2 activity_id

  data_type: 'integer'
  is_nullable: 0

=head2 product_instance

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "activity_id_seq",
  },
  "timestamp",
  {
    data_type     => "timestamp",
    default_value => \"current_timestamp",
    is_nullable   => 0,
    original      => { default_value => \"now()" },
  },
  "activity_id",
  { data_type => "integer", is_nullable => 0 },
  "product_instance",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 product_instance

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::ProductInstance>

=cut

__PACKAGE__->belongs_to(
  "product_instance",
  "ULDE::Schema::ULDE::Result::ProductInstance",
  { id => "product_instance" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07045 @ 2016-04-16 06:17:45
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Su0XCT25eCE0RmchhU/yRw


use DateTime::Format::Pg;

__PACKAGE__->inflate_column('timestamp', {
        inflate => sub { DateTime::Format::Pg->parse_timestamp(shift); },
        deflate => sub { DateTime::Format::Pg->format_timestamp(shift); },
    });

__PACKAGE__->meta->make_immutable;
1;
