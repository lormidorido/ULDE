package ULDE::Component::Product::ServiceDefinition;
# Service Defintion product class
# Class for making columns handling in link table transparent.
# This class is expected to be used for retrieving one object ones to link column data in link table

use Moose;
use namespace::autoclean;
use ULDE::Component::Product;
use ULDE::Component::ServiceLevel::Product;
use List::Util qw(first);

extends 'ULDE::Component';

has '+resultset'			=> ( default => 'ProductServiceDefinition' );
has '+result_object'	=> ( handles => [qw(active)]);

has related_obj 			=> ( is => 'rw', isa => 'ULDE::Component::Product', lazy_build => 1, handles => [qw(id name business personal template template_h legal_area category sub_category jurisdiction is_pack)] );

has service_definition 	=> (is => 'ro', isa => 'Int', required => 1);

has description				=> (is => 'rw', isa => 'Str', lazy_build => 1);
# only product instance does have a nonarray SL (I think!)
# has service_level			=> (is => 'rw', isa => 'ArrayRef[ULDE::Component::ServiceLevel::Product] | ULDE::Component::ServiceLevel::Product', lazy_build => 1 );
has service_level			=> (is => 'rw', isa => 'ArrayRef[ULDE::Component::ServiceLevel::Product]', lazy_build => 1 );

sub _build_related_obj {
	my $self = shift;

	ULDE::Component::Product->new({ id => $self->result_object->product->id });
}

sub _build_description {
	my $self = shift;

	$self->result_object->description || $self->related_obj->description;
}

sub _build_service_level {
	my $self = shift;

	[map { ULDE::Component::ServiceLevel::Product->new({ service_level => $_->id, service_definition => $self->service_definition, product => $self->id }) } $self->result_object->service_levels];
}

override 'update' => sub {
# 0: {columns}

	my $self = shift;

	my %local_columns = (
		active			=> 1,
		description => 1
		);

	$self->SUPER::update({ map { $_ => $_[0]->{$_} } grep { $local_columns{$_} } keys %{$_[0]} });
	$self->related_obj->update({ map { $_ => $_[0]->{$_} } grep { !$local_columns{$_} } keys %{$_[0]} });
	$self->description($self->_build_description) if $_[0]->{description};
};

sub get_default_service_level {
# 0: 'customer' || 'reviewer'

	my $self = shift;

	return first { $_[0] eq 'customer' && $_->customer_default || $_[0] eq 'reviewer' && $_->reviewer_default } @{$self->service_level};
}

__PACKAGE__->meta->make_immutable;

1;