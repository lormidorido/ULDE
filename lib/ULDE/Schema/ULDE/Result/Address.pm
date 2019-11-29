use utf8;
package ULDE::Schema::ULDE::Result::Address;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ULDE::Schema::ULDE::Result::Address

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

=head1 TABLE: C<address>

=cut

__PACKAGE__->table("address");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'address_id_seq'

=head2 line_1

  data_type: 'text'
  is_nullable: 0

=head2 line_2

  data_type: 'text'
  is_nullable: 1

=head2 line_3

  data_type: 'text'
  is_nullable: 1

=head2 line_4

  data_type: 'text'
  is_nullable: 1

=head2 town

  data_type: 'text'
  is_nullable: 1

=head2 county

  data_type: 'text'
  is_nullable: 1

=head2 postcode

  data_type: 'text'
  is_nullable: 0

=head2 country

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 is_biz

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
    sequence          => "address_id_seq",
  },
  "line_1",
  { data_type => "text", is_nullable => 0 },
  "line_2",
  { data_type => "text", is_nullable => 1 },
  "line_3",
  { data_type => "text", is_nullable => 1 },
  "line_4",
  { data_type => "text", is_nullable => 1 },
  "town",
  { data_type => "text", is_nullable => 1 },
  "county",
  { data_type => "text", is_nullable => 1 },
  "postcode",
  { data_type => "text", is_nullable => 0 },
  "country",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "is_biz",
  { data_type => "boolean", default_value => \"false", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 country

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::Country>

=cut

__PACKAGE__->belongs_to(
  "country",
  "ULDE::Schema::ULDE::Result::Country",
  { id => "country" },
  { is_deferrable => 0, on_delete => "RESTRICT", on_update => "NO ACTION" },
);

=head2 customer_addresses

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::CustomerAddress>

=cut

__PACKAGE__->has_many(
  "customer_addresses",
  "ULDE::Schema::ULDE::Result::CustomerAddress",
  { "foreign.address" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 customers

Type: many_to_many

Composing rels: L</customer_addresses> -> customer

=cut

__PACKAGE__->many_to_many("customers", "customer_addresses", "customer");


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-04-21 02:56:37
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:sthjgbUQiMUh/ys4MIEQyw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
