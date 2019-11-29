use utf8;
package ULDE::Schema::ULDE::Result::Country;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ULDE::Schema::ULDE::Result::Country

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

=head1 TABLE: C<country>

=cut

__PACKAGE__->table("country");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'country_id_seq'

=head2 name

  data_type: 'text'
  is_nullable: 1

=head2 iso_code

  data_type: 'text'
  is_nullable: 1

=head2 phone_code

  data_type: 'text'
  is_nullable: 1

=head2 time_zone

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "country_id_seq",
  },
  "name",
  { data_type => "text", is_nullable => 1 },
  "iso_code",
  { data_type => "text", is_nullable => 1 },
  "phone_code",
  { data_type => "text", is_nullable => 1 },
  "time_zone",
  { data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 addresses

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::Address>

=cut

__PACKAGE__->has_many(
  "addresses",
  "ULDE::Schema::ULDE::Result::Address",
  { "foreign.country" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-01-26 01:19:24
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:fu0/aOo3d7FnMtvnO3yYkw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
