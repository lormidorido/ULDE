use utf8;
package ULDE::Schema::ULDE::Result::CustomerAccount;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ULDE::Schema::ULDE::Result::CustomerAccount

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

=head1 TABLE: C<customer_account>

=cut

__PACKAGE__->table("customer_account");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'customer_accounts_id_seq'

=head2 service_definition

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 created

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 0
  original: {default_value => \"now()"}

=head2 status

  data_type: 'text'
  default_value: 'active'
  is_nullable: 0

=head2 business_name

  data_type: 'text'
  is_nullable: 1

=head2 associate

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 foreign_account

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "customer_accounts_id_seq",
  },
  "service_definition",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "created",
  {
    data_type     => "timestamp",
    default_value => \"current_timestamp",
    is_nullable   => 0,
    original      => { default_value => \"now()" },
  },
  "status",
  { data_type => "text", default_value => "active", is_nullable => 0 },
  "business_name",
  { data_type => "text", is_nullable => 1 },
  "associate",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "foreign_account",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 associate

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::Associate>

=cut

__PACKAGE__->belongs_to(
  "associate",
  "ULDE::Schema::ULDE::Result::Associate",
  { id => "associate" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "SET NULL",
    on_update     => "NO ACTION",
  },
);

=head2 communications

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::Communication>

=cut

__PACKAGE__->has_many(
  "communications",
  "ULDE::Schema::ULDE::Result::Communication",
  { "foreign.customer_account" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 customers

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::Customer>

=cut

__PACKAGE__->has_many(
  "customers",
  "ULDE::Schema::ULDE::Result::Customer",
  { "foreign.account" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 foreign_account

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::ForeignAccount>

=cut

__PACKAGE__->belongs_to(
  "foreign_account",
  "ULDE::Schema::ULDE::Result::ForeignAccount",
  { id => "foreign_account" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "SET NULL",
    on_update     => "NO ACTION",
  },
);

=head2 product_instances

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::ProductInstance>

=cut

__PACKAGE__->has_many(
  "product_instances",
  "ULDE::Schema::ULDE::Result::ProductInstance",
  { "foreign.customer_account" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 service_definition

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::ServiceDefinition>

=cut

__PACKAGE__->belongs_to(
  "service_definition",
  "ULDE::Schema::ULDE::Result::ServiceDefinition",
  { id => "service_definition" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "NO ACTION",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07045 @ 2016-04-23 18:24:40
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:9MCFK+zDBGFH8vOAdndpQw

use DateTime::Format::Pg;

__PACKAGE__->inflate_column('created', {
        inflate => sub { DateTime::Format::Pg->parse_timestamp(shift); },
        deflate => sub { DateTime::Format::Pg->format_timestamp(shift); },
    });

__PACKAGE__->many_to_many("product_service_definitions", "product_instances", "product_service_definition");
#__PACKAGE__->many_to_many("product_service_definitions", "customer_account_products", "product_service_definition");

__PACKAGE__->meta->make_immutable;
1;
