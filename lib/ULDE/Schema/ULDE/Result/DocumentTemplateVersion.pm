use utf8;
package ULDE::Schema::ULDE::Result::DocumentTemplateVersion;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ULDE::Schema::ULDE::Result::DocumentTemplateVersion

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

=head1 TABLE: C<document_template_version>

=cut

__PACKAGE__->table("document_template_version");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'document_template_versions_id_seq'

=head2 document_template

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 version

  data_type: 'text'
  is_nullable: 1

=head2 date

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 0
  original: {default_value => \"now()"}

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "document_template_versions_id_seq",
  },
  "document_template",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "version",
  { data_type => "text", is_nullable => 1 },
  "date",
  {
    data_type     => "timestamp",
    default_value => \"current_timestamp",
    is_nullable   => 0,
    original      => { default_value => \"now()" },
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 document_template

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::DocumentTemplate>

=cut

__PACKAGE__->belongs_to(
  "document_template",
  "ULDE::Schema::ULDE::Result::DocumentTemplate",
  { id => "document_template" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "NO ACTION",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-01-26 01:19:24
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ZLUosq4zFM03BA9vmyFKLQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
