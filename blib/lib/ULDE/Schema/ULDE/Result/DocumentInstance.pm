use utf8;
package ULDE::Schema::ULDE::Result::DocumentInstance;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ULDE::Schema::ULDE::Result::DocumentInstance

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

=head1 TABLE: C<document_instances>

=cut

__PACKAGE__->table("document_instances");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'document_instance_id_seq'

=head2 template

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 customer_account

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 product

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 service_definition

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 service_level

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
    sequence          => "document_instance_id_seq",
  },
  "template",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "customer_account",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "product",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "service_definition",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "service_level",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 customer_account_product

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::CustomerAccountProduct>

=cut

__PACKAGE__->belongs_to(
  "customer_account_product",
  "ULDE::Schema::ULDE::Result::CustomerAccountProduct",
  {
    customer_account => "customer_account",
    product => "product",
    service_definition => "service_definition",
    service_level => "service_level",
  },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "CASCADE,",
    on_update     => "NO ACTION",
  },
);

=head2 template

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::DocumentTemplate>

=cut

__PACKAGE__->belongs_to(
  "template",
  "ULDE::Schema::ULDE::Result::DocumentTemplate",
  { id => "template" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "NO ACTION",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-06-07 03:39:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:YGg5im/pMhG4+iM33PqmwQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
