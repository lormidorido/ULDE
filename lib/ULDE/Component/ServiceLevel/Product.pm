package ULDE::Component::ServiceLevel::Product;
# Service Defintion product class
# Class for making columns handling in link table transparent.
# This class is expected to be used for retrieving one object ones to link column data in link table

use Moose;
use namespace::autoclean;
use ULDE::Component::ServiceLevel;

extends 'ULDE::Component';

has '+resultset'			=> ( default => 'ProductServiceLevel' );
has '+result_object'	=> ( handles => [qw(product service_definition service_level price min_price max_price customer_default reviewer_default)]);

has related_obj 			=> ( is => 'rw', isa => 'ULDE::Component::ServiceLevel', lazy_build => 1, handles => [qw(id name includes_review internal_office_use customer_communication corporate_client_description customer_applicable corporate_client_applicable default_product_instance_status)] );

has description					=> ( is => 'rw', isa => 'Str | Bool', lazy_build => 1 );
has ele_service_option 	=> ( is => 'rw', isa => 'DBIx::Class::Row | Bool', lazy_build => 1 );

sub _build_related_obj {
	my $self = shift;

	ULDE::Component::ServiceLevel->new({ id => $self->result_object->service_level->id});
}

sub _build_description {
	my $self = shift;

	$self->result_object->description || $self->related_obj->description;
}

sub _build_ele_service_option {
	my $self = shift;

	$self->result_object->ele_service_option;
}

override 'update' => sub {
# 0: {columns}

	my $self = shift;

	my %local_columns = (
		price				=> 1,
		min_price 	=> 1,
		max_price		=> 1,
		description => 1
		);

	$self->SUPER::update({ map { $_ => $_[0]->{$_} } grep { $local_columns{$_} } keys %{$_[0]} });
	$self->related_obj->update({ map { $_ => $_[0]->{$_} } grep { !$local_columns{$_} } keys %{$_[0]} });
	$self->description($self->_build_description) if $_[0]->{description};
};

__PACKAGE__->meta->make_immutable;

1;