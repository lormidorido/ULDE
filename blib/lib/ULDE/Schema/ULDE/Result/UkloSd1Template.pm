use utf8;
package ULDE::Schema::ULDE::Result::UkloSd1Template;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ULDE::Schema::ULDE::Result::UkloSd1Template

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

=head1 TABLE: C<uklo_sd1_templates>

=cut

__PACKAGE__->table("uklo_sd1_templates");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_nullable: 1

=head2 name

  data_type: 'text'
  is_nullable: 1

=head2 description

  data_type: 'text'
  is_nullable: 1

=head2 version

  data_type: 'text'
  is_nullable: 1

=head2 version_date

  data_type: 'timestamp'
  is_nullable: 1

=head2 document_assembly_provider

  data_type: 'text'
  is_nullable: 1

=head2 personal

  data_type: 'boolean'
  is_nullable: 1

=head2 business

  data_type: 'boolean'
  is_nullable: 1

=head2 area

  data_type: 'text'
  is_nullable: 1

=head2 category

  data_type: 'text'
  is_nullable: 1

=head2 sub_category

  data_type: 'text'
  is_nullable: 1

=head2 jurisdictions

  data_type: 'integer[]'
  is_nullable: 1

=head2 instance_count

  data_type: 'smallint'
  is_nullable: 1

=head2 review_count

  data_type: 'integer'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_nullable => 1 },
  "name",
  { data_type => "text", is_nullable => 1 },
  "description",
  { data_type => "text", is_nullable => 1 },
  "version",
  { data_type => "text", is_nullable => 1 },
  "version_date",
  { data_type => "timestamp", is_nullable => 1 },
  "document_assembly_provider",
  { data_type => "text", is_nullable => 1 },
  "personal",
  { data_type => "boolean", is_nullable => 1 },
  "business",
  { data_type => "boolean", is_nullable => 1 },
  "area",
  { data_type => "text", is_nullable => 1 },
  "category",
  { data_type => "text", is_nullable => 1 },
  "sub_category",
  { data_type => "text", is_nullable => 1 },
  "jurisdictions",
  { data_type => "integer[]", is_nullable => 1 },
  "instance_count",
  { data_type => "smallint", is_nullable => 1 },
  "review_count",
  { data_type => "integer", is_nullable => 1 },
);


# Created by DBIx::Class::Schema::Loader v0.07033 @ 2012-09-10 01:31:08
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:saaR42HLGMMHRRnd0+G2oA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
