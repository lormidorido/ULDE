use utf8;
package ULDE::Schema::ULDE::Result::FileFormat;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ULDE::Schema::ULDE::Result::FileFormat

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

=head1 TABLE: C<file_format>

=cut

__PACKAGE__->table("file_format");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'file_format_id_seq'

=head2 name

  data_type: 'text'
  default_value: 'pdf'
  is_nullable: 0

=head2 content_type

  data_type: 'text'
  default_value: 'application/pdf'
  is_nullable: 0

=head2 extension

  data_type: 'text'
  default_value: '.pdf'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "file_format_id_seq",
  },
  "name",
  { data_type => "text", default_value => "pdf", is_nullable => 0 },
  "content_type",
  {
    data_type     => "text",
    default_value => "application/pdf",
    is_nullable   => 0,
  },
  "extension",
  { data_type => "text", default_value => ".pdf", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 file_storages

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::FileStorage>

=cut

__PACKAGE__->has_many(
  "file_storages",
  "ULDE::Schema::ULDE::Result::FileStorage",
  { "foreign.file_format" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-08-03 18:34:03
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:B2h3MA7/plQ697lbP8OZwA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
