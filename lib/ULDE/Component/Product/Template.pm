package ULDE::Component::Product::Template;
# Template Product class
# Class for making columns handling in link table transparent.
# This class is expected to be used for retrieving one object ones to link column data in link table

use Moose;
use namespace::autoclean;
use ULDE::Component::Product;

extends 'ULDE::Component';

has '+resultset'			=> ( default => 'ProductDocumentTemplate' );
has '+result_object'	=> ( handles => {
														instances 	=> 'instance_count',
														reviews			=> 'review_count',
														is_primary	=> 'primary_template',												
													});

has related_obj 		=> ( is => 'rw', isa => 'ULDE::Component::Product', lazy_build => 1, handles => [qw(id name business personal description service_definition template template_h legal_area category sub_category jurisdiction is_pack)] );

sub _build_related_obj {
	my $self = shift;

	ULDE::Component::Product->new({ id => $self->result_object->product->id});
}

override 'update' => sub {
# 0: {columns}

	my $self = shift;

	my %local_columns = (
		instances		=> 1,
		reviews			=> 1,
		is_primary	=> 1,
	);

	my %aliases	= (
		instances 	=> 'instance_count',
		reviews			=> 'review_count',
		is_primary 	=> 'primary_template',
	);

	$self->SUPER::update({ map { $aliases{$_} => $_[0]->{$_} } grep { $local_columns{$_} } keys %{$_[0]} });
	$self->related_obj->update({ map { $_ => $_[0]->{$_} } grep { !$local_columns{$_} } keys %{$_[0]} });
};

__PACKAGE__->meta->make_immutable;

1;