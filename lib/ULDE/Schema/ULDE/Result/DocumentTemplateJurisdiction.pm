use utf8;
package ULDE::Schema::ULDE::Result::DocumentTemplateJurisdiction;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ULDE::Schema::ULDE::Result::DocumentTemplateJurisdiction

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

=head1 TABLE: C<document_template_jurisdiction>

=cut

__PACKAGE__->table("document_template_jurisdiction");

=head1 ACCESSORS

=head2 document_template

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 jurisdiction

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "document_template",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "jurisdiction",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</document_template>

=item * L</jurisdiction>

=back

=cut

__PACKAGE__->set_primary_key("document_template", "jurisdiction");

=head1 RELATIONS

=head2 document_template

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::DocumentTemplate>

=cut

__PACKAGE__->belongs_to(
  "document_template",
  "ULDE::Schema::ULDE::Result::DocumentTemplate",
  { id => "document_template" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" },
);

=head2 jurisdiction

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::Jurisdiction>

=cut

__PACKAGE__->belongs_to(
  "jurisdiction",
  "ULDE::Schema::ULDE::Result::Jurisdiction",
  { id => "jurisdiction" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-01-26 01:19:24
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:SHAQTZV4mTvps7MeATg2dA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
