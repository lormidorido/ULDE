use utf8;
package ULDE::Schema::ULDE::Result::ProductInstance;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ULDE::Schema::ULDE::Result::ProductInstance - products linked to customer account

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

=head1 TABLE: C<product_instance>

=cut

__PACKAGE__->table("product_instance");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'customer_account_product_id_seq'

=head2 customer_account

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 product

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 service_definition

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 service_level

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 added

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 0
  original: {default_value => \"now()"}

=head2 quantity

  data_type: 'smallint'
  default_value: 1
  is_nullable: 0

=head2 name

  data_type: 'text'
  is_nullable: 1

=head2 status

  data_type: 'integer'
  default_value: 1
  is_foreign_key: 1
  is_nullable: 0

=head2 associate

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 sub_total

  data_type: 'money'
  is_nullable: 1

=head2 vat_amount

  data_type: 'money'
  is_nullable: 1

=head2 total

  data_type: 'money'
  is_nullable: 1

=head2 purchase_transaction

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
    sequence          => "customer_account_product_id_seq",
  },
  "customer_account",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "product",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "service_definition",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "service_level",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "added",
  {
    data_type     => "timestamp",
    default_value => \"current_timestamp",
    is_nullable   => 0,
    original      => { default_value => \"now()" },
  },
  "quantity",
  { data_type => "smallint", default_value => 1, is_nullable => 0 },
  "name",
  { data_type => "text", is_nullable => 1 },
  "status",
  {
    data_type      => "integer",
    default_value  => 1,
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "associate",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "sub_total",
  { data_type => "money", is_nullable => 1 },
  "vat_amount",
  { data_type => "money", is_nullable => 1 },
  "total",
  { data_type => "money", is_nullable => 1 },
  "purchase_transaction",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 activity_product_instances

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::ActivityProductInstance>

=cut

__PACKAGE__->has_many(
  "activity_product_instances",
  "ULDE::Schema::ULDE::Result::ActivityProductInstance",
  { "foreign.product_instance" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

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
  { "foreign.product_instance" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 customer_account

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::CustomerAccount>

=cut

__PACKAGE__->belongs_to(
  "customer_account",
  "ULDE::Schema::ULDE::Result::CustomerAccount",
  { id => "customer_account" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" },
);

=head2 event_logs

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::EventLog>

=cut

__PACKAGE__->has_many(
  "event_logs",
  "ULDE::Schema::ULDE::Result::EventLog",
  { "foreign.product_instance" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 product_service_definition

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::ProductServiceDefinition>

=cut

__PACKAGE__->belongs_to(
  "product_service_definition",
  "ULDE::Schema::ULDE::Result::ProductServiceDefinition",
  { product => "product", service_definition => "service_definition" },
  { is_deferrable => 0, on_delete => "RESTRICT", on_update => "NO ACTION" },
);

=head2 product_service_level

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::ProductServiceLevel>

=cut

__PACKAGE__->belongs_to(
  "product_service_level",
  "ULDE::Schema::ULDE::Result::ProductServiceLevel",
  {
    product => "product",
    service_definition => "service_definition",
    service_level => "service_level",
  },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

=head2 purchase_transaction

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::PurchaseTransaction>

=cut

__PACKAGE__->belongs_to(
  "purchase_transaction",
  "ULDE::Schema::ULDE::Result::PurchaseTransaction",
  { id => "purchase_transaction" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "NO ACTION",
  },
);

=head2 status

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::StatusCode>

=cut

__PACKAGE__->belongs_to(
  "status",
  "ULDE::Schema::ULDE::Result::StatusCode",
  { id => "status" },
  { is_deferrable => 0, on_delete => "RESTRICT", on_update => "NO ACTION" },
);

=head2 template_instances

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::TemplateInstance>

=cut

__PACKAGE__->has_many(
  "template_instances",
  "ULDE::Schema::ULDE::Result::TemplateInstance",
  { "foreign.product_instance" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07045 @ 2016-04-16 06:17:45
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:FY5TaU85mCPIp8UpqpppCg

use DateTime::Format::Pg;

__PACKAGE__->inflate_column('added', {
        inflate => sub { DateTime::Format::Pg->parse_timestamp(shift); },
        deflate => sub { DateTime::Format::Pg->format_timestamp(shift); },
    });

__PACKAGE__->meta->make_immutable;
1;
