use utf8;
package ULDE::Schema::ULDE::Result::CustomerRole;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ULDE::Schema::ULDE::Result::CustomerRole

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

=head1 TABLE: C<customer_role>

=cut

__PACKAGE__->table("customer_role");

=head1 ACCESSORS

=head2 customer

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 role

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "customer",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "role",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</customer>

=item * L</role>

=back

=cut

__PACKAGE__->set_primary_key("customer", "role");

=head1 RELATIONS

=head2 customer

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::Customer>

=cut

__PACKAGE__->belongs_to(
  "customer",
  "ULDE::Schema::ULDE::Result::Customer",
  { id => "customer" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" },
);

=head2 role

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::Role>

=cut

__PACKAGE__->belongs_to(
  "role",
  "ULDE::Schema::ULDE::Result::Role",
  { id => "role" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-01-26 01:19:24
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:HjhOYO5HWBs5KOIXT/zoAQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
