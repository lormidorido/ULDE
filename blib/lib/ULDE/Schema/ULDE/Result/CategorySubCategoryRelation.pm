use utf8;
package ULDE::Schema::ULDE::Result::CategorySubCategoryRelation;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ULDE::Schema::ULDE::Result::CategorySubCategoryRelation

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

=head1 TABLE: C<category_sub_category_relations>

=cut

__PACKAGE__->table("category_sub_category_relations");

=head1 ACCESSORS

=head2 category

  data_type: 'smallint'
  is_foreign_key: 1
  is_nullable: 0

=head2 sub_category

  data_type: 'smallint'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "category",
  { data_type => "smallint", is_foreign_key => 1, is_nullable => 0 },
  "sub_category",
  { data_type => "smallint", is_foreign_key => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</category>

=item * L</sub_category>

=back

=cut

__PACKAGE__->set_primary_key("category", "sub_category");

=head1 RELATIONS

=head2 category

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::LegalCategory>

=cut

__PACKAGE__->belongs_to(
  "category",
  "ULDE::Schema::ULDE::Result::LegalCategory",
  { id => "category" },
  { is_deferrable => 0, on_delete => "CASCADE,", on_update => "NO ACTION" },
);

=head2 sub_category

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::LegalSubCategory>

=cut

__PACKAGE__->belongs_to(
  "sub_category",
  "ULDE::Schema::ULDE::Result::LegalSubCategory",
  { id => "sub_category" },
  { is_deferrable => 0, on_delete => "CASCADE,", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-06-07 03:39:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:B+7ke8FPYKBh1A8M2LcboA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
