use utf8;
package ULDE::Schema::ULDE::Result::ProductInstanceAssociate;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ULDE::Schema::ULDE::Result::ProductInstanceAssociate

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

=head1 TABLE: C<product_instance_associate>

=cut

__PACKAGE__->table("product_instance_associate");

=head1 ACCESSORS

=head2 associate

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 product_instance

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "associate",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "product_instance",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</associate>

=item * L</product_instance>

=back

=cut

__PACKAGE__->set_primary_key("associate", "product_instance");

=head1 RELATIONS

=head2 associate

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::Associate>

=cut

__PACKAGE__->belongs_to(
  "associate",
  "ULDE::Schema::ULDE::Result::Associate",
  { id => "associate" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" },
);

=head2 product_instance

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::ProductInstance>

=cut

__PACKAGE__->belongs_to(
  "product_instance",
  "ULDE::Schema::ULDE::Result::ProductInstance",
  { id => "product_instance" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-04-25 00:14:32
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:fZ8ef10ab96AveQQqEGb3Q


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
