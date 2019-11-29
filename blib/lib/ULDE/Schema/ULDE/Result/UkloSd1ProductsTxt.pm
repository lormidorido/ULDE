use utf8;
package ULDE::Schema::ULDE::Result::UkloSd1ProductsTxt;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ULDE::Schema::ULDE::Result::UkloSd1ProductsTxt

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

=head1 TABLE: C<uklo_sd1_products_txt>

=cut

__PACKAGE__->table("uklo_sd1_products_txt");

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

=head2 provider

  data_type: 'text'
  is_nullable: 1

=head2 service_level_id

  data_type: 'integer'
  is_nullable: 1

=head2 service_url

  data_type: 'citext'
  is_nullable: 1

=head2 template_count

  data_type: 'integer'
  is_nullable: 1

=head2 business

  data_type: 'text'
  is_nullable: 1

=head2 personal

  data_type: 'text'
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

=head2 service_level

  data_type: 'text'
  is_nullable: 1

=head2 service_level_description

  data_type: 'text'
  is_nullable: 1

=head2 price_ex_vat

  data_type: 'text'
  is_nullable: 1

=head2 min_price

  data_type: 'text'
  is_nullable: 1

=head2 max_price

  data_type: 'text'
  is_nullable: 1

=head2 jurisdictions

  data_type: 'integer[]'
  is_nullable: 1

=head2 templates

  data_type: 'integer[]'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_nullable => 1 },
  "name",
  { data_type => "text", is_nullable => 1 },
  "description",
  { data_type => "text", is_nullable => 1 },
  "provider",
  { data_type => "text", is_nullable => 1 },
  "service_level_id",
  { data_type => "integer", is_nullable => 1 },
  "service_url",
  { data_type => "citext", is_nullable => 1 },
  "template_count",
  { data_type => "integer", is_nullable => 1 },
  "business",
  { data_type => "text", is_nullable => 1 },
  "personal",
  { data_type => "text", is_nullable => 1 },
  "area",
  { data_type => "text", is_nullable => 1 },
  "category",
  { data_type => "text", is_nullable => 1 },
  "sub_category",
  { data_type => "text", is_nullable => 1 },
  "service_level",
  { data_type => "text", is_nullable => 1 },
  "service_level_description",
  { data_type => "text", is_nullable => 1 },
  "price_ex_vat",
  { data_type => "text", is_nullable => 1 },
  "min_price",
  { data_type => "text", is_nullable => 1 },
  "max_price",
  { data_type => "text", is_nullable => 1 },
  "jurisdictions",
  { data_type => "integer[]", is_nullable => 1 },
  "templates",
  { data_type => "integer[]", is_nullable => 1 },
);


# Created by DBIx::Class::Schema::Loader v0.07033 @ 2012-09-10 01:31:08
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:UKJiVCWLCPx6PNthK3rMtA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
