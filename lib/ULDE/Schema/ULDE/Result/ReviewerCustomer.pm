use utf8;
package ULDE::Schema::ULDE::Result::ReviewerCustomer;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ULDE::Schema::ULDE::Result::ReviewerCustomer

=head1 DESCRIPTION

This table simply shows if the reviewer has created the customer. It is many to many as the same customer may have been created by many reviewers

maybe should associate reviewer with customer_account instead?

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

=head1 TABLE: C<reviewer_customer>

=cut

__PACKAGE__->table("reviewer_customer");

=head1 ACCESSORS

=head2 reviewer

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 customer

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "reviewer",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "customer",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</reviewer>

=item * L</customer>

=back

=cut

__PACKAGE__->set_primary_key("reviewer", "customer");

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

=head2 reviewer

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::Reviewer>

=cut

__PACKAGE__->belongs_to(
  "reviewer",
  "ULDE::Schema::ULDE::Result::Reviewer",
  { id => "reviewer" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07045 @ 2016-04-22 20:55:16
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:49uJZ/NlSz2N0KKeN7Xr2g


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
