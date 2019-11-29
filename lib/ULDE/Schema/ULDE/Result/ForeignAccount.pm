use utf8;
package ULDE::Schema::ULDE::Result::ForeignAccount;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ULDE::Schema::ULDE::Result::ForeignAccount

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

=head1 TABLE: C<foreign_account>

=cut

__PACKAGE__->table("foreign_account");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'foreign_account_details_id_seq'

=head2 date_created

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 0
  original: {default_value => \"now()"}

=head2 foreign_user_name

  data_type: 'text'
  is_nullable: 0

=head2 foreign_password

  data_type: 'text'
  is_nullable: 0

=head2 customer_account

  data_type: 'integer'
  is_nullable: 1

=head2 foreign_provider

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 foreign_account_id

  data_type: 'text'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "foreign_account_details_id_seq",
  },
  "date_created",
  {
    data_type     => "timestamp",
    default_value => \"current_timestamp",
    is_nullable   => 0,
    original      => { default_value => \"now()" },
  },
  "foreign_user_name",
  { data_type => "text", is_nullable => 0 },
  "foreign_password",
  { data_type => "text", is_nullable => 0 },
  "customer_account",
  { data_type => "integer", is_nullable => 1 },
  "foreign_provider",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "foreign_account_id",
  { data_type => "text", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<foreign_account_customer_account_foreign_provider_key>

=over 4

=item * L</customer_account>

=item * L</foreign_provider>

=back

=cut

__PACKAGE__->add_unique_constraint(
  "foreign_account_customer_account_foreign_provider_key",
  ["customer_account", "foreign_provider"],
);

=head2 C<foreign_account_foreign_account_id_key>

=over 4

=item * L</foreign_account_id>

=back

=cut

__PACKAGE__->add_unique_constraint(
  "foreign_account_foreign_account_id_key",
  ["foreign_account_id"],
);

=head1 RELATIONS

=head2 customer_accounts

Type: has_many

Related object: L<ULDE::Schema::ULDE::Result::CustomerAccount>

=cut

__PACKAGE__->has_many(
  "customer_accounts",
  "ULDE::Schema::ULDE::Result::CustomerAccount",
  { "foreign.foreign_account" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 foreign_provider

Type: belongs_to

Related object: L<ULDE::Schema::ULDE::Result::ForeignProvider>

=cut

__PACKAGE__->belongs_to(
  "foreign_provider",
  "ULDE::Schema::ULDE::Result::ForeignProvider",
  { id => "foreign_provider" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07045 @ 2016-04-23 18:42:18
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:k4LO+eknZ5axcGOr1nQqsg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
