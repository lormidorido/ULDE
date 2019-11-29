use utf8;
package ULDE::Schema::ULDE::Result::Associate;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ULDE::Schema::ULDE::Result::Associate

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

=head1 TABLE: C<associate>

=cut

__PACKAGE__->table("associate");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'associate_id_seq'

=head2 name

  data_type: 'text'
  is_nullable: 0

=head2 host

  data_type: 'text'
  is_nullable: 1

=head2 img_logo

  data_type: 'text'
  is_nullable: 1

=head2 css_class

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "associate_id_seq",
  },
  "name",
  { data_type => "text", is_nullable => 0 },
  "host",
  { data_type => "text", is_nullable => 1 },
  "img_logo",
  { data_type => "text", is_nullable => 1 },
  "css_class",
  { data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<associate_domain_key>

=over 4

=item * L</host>

=back

=cut

__PACKAGE__->add_unique_constraint("associate_domain_key", ["host"]);

=head1 RELATIONS

=head2 associate_discount_vouchers

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::AssociateDiscountVoucher>

=cut

__PACKAGE__->has_many(
  "associate_discount_vouchers",
  "ULDE::Schema::ULDE::Result::AssociateDiscountVoucher",
  { "foreign.associate" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 customer_accounts

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::CustomerAccount>

=cut

__PACKAGE__->has_many(
  "customer_accounts",
  "ULDE::Schema::ULDE::Result::CustomerAccount",
  { "foreign.associate" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 product_instances

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::ProductInstance>

=cut

__PACKAGE__->has_many(
  "product_instances",
  "ULDE::Schema::ULDE::Result::ProductInstance",
  { "foreign.associate" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 review_service_responsibility_associates

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::ReviewServiceResponsibilityAssociate>

=cut

__PACKAGE__->has_many(
  "review_service_responsibility_associates",
  "ULDE::Schema::ULDE::Result::ReviewServiceResponsibilityAssociate",
  { "foreign.associate" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 review_services

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::ReviewService>

=cut

__PACKAGE__->has_many(
  "review_services",
  "ULDE::Schema::ULDE::Result::ReviewService",
  { "foreign.is_associate" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 service_definition_associates

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::ServiceDefinitionAssociate>

=cut

__PACKAGE__->has_many(
  "service_definition_associates",
  "ULDE::Schema::ULDE::Result::ServiceDefinitionAssociate",
  { "foreign.associate" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 service_definitions

Type: many_to_many

Composing rels: L</service_definition_associates> -> service_definition

=cut

__PACKAGE__->many_to_many(
  "service_definitions",
  "service_definition_associates",
  "service_definition",
);


# Created by DBIx::Class::Schema::Loader v0.07045 @ 2016-04-22 10:51:30
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:xY5MB8b0K7wFALlOKRAx6w


__PACKAGE__->many_to_many("discount_vouchers","associate_discount_vouchers", "discount_voucher");

__PACKAGE__->meta->make_immutable;
1;
