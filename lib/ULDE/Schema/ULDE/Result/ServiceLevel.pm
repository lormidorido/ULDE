use utf8;
package ULDE::Schema::ULDE::Result::ServiceLevel;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ULDE::Schema::ULDE::Result::ServiceLevel

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

=head1 TABLE: C<service_level>

=cut

__PACKAGE__->table("service_level");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'service_level_id_seq'

=head2 name

  data_type: 'text'
  is_nullable: 0

=head2 description

  data_type: 'text'
  is_nullable: 1

=head2 includes_review

  data_type: 'boolean'
  default_value: false
  is_nullable: 0

=head2 internal_office_use

  data_type: 'boolean'
  default_value: false
  is_nullable: 0

=head2 customer_communication

  data_type: 'boolean'
  default_value: false
  is_nullable: 0

=head2 corporate_client_description

  data_type: 'text'
  is_nullable: 1

=head2 customer_applicable

  data_type: 'boolean'
  default_value: false
  is_nullable: 0

=head2 corporate_client_applicable

  data_type: 'boolean'
  default_value: false
  is_nullable: 0

=head2 default_product_instance_status

  data_type: 'integer'
  default_value: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "service_level_id_seq",
  },
  "name",
  { data_type => "text", is_nullable => 0 },
  "description",
  { data_type => "text", is_nullable => 1 },
  "includes_review",
  { data_type => "boolean", default_value => \"false", is_nullable => 0 },
  "internal_office_use",
  { data_type => "boolean", default_value => \"false", is_nullable => 0 },
  "customer_communication",
  { data_type => "boolean", default_value => \"false", is_nullable => 0 },
  "corporate_client_description",
  { data_type => "text", is_nullable => 1 },
  "customer_applicable",
  { data_type => "boolean", default_value => \"false", is_nullable => 0 },
  "corporate_client_applicable",
  { data_type => "boolean", default_value => \"false", is_nullable => 0 },
  "default_product_instance_status",
  { data_type => "integer", default_value => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 product_service_levels

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::ProductServiceLevel>

=cut

__PACKAGE__->has_many(
  "product_service_levels",
  "ULDE::Schema::ULDE::Result::ProductServiceLevel",
  { "foreign.service_level" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07045 @ 2016-04-21 06:08:24
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:zu6aMN9EiIb45BsnndhqyQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
