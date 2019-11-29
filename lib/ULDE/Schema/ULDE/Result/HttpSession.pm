use utf8;
package ULDE::Schema::ULDE::Result::HttpSession;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ULDE::Schema::ULDE::Result::HttpSession

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

=head1 TABLE: C<http_sessions>

=cut

__PACKAGE__->table("http_sessions");

=head1 ACCESSORS

=head2 id

  data_type: 'char'
  is_nullable: 0
  size: 72

=head2 session_data

  data_type: 'text'
  is_nullable: 1

=head2 expires

  data_type: 'integer'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "char", is_nullable => 0, size => 72 },
  "session_data",
  { data_type => "text", is_nullable => 1 },
  "expires",
  { data_type => "integer", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 http_session_products

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::HttpSessionProduct>

=cut

__PACKAGE__->has_many(
  "http_session_products",
  "ULDE::Schema::ULDE::Result::HttpSessionProduct",
  { "foreign.session" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-07-17 01:28:51
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:MNUjE0GBDYbaPyt1c9w7eg


__PACKAGE__->many_to_many("product_service_definitions", "http_session_products", "product_service_definition");

__PACKAGE__->meta->make_immutable;
1;
