package ULDE::Component::Template::Product;
# Product Template class
# Class for making columns handling in link table transparent.
# This class is expected to be used for retrieving one object ones to link column data in link table

use Moose;
use namespace::autoclean;

extends 'ULDE::Component::Template';

has _template_product_object	=> (is => 'rw', isa => 'DBIx::Class::Row', lazy => 1, required => 1, builder => '_build_template_product_object', handles => {
																																																																									instances 	=> 'instance_count',
																																																																									reviews			=> 'review_count',
																																																																									is_primary	=> 'primary_template'
																																																																								});

has product 				=> (is => 'ro', isa => 'Int', required => 1);
has description			=> (is => 'rw', isa => 'Str', lazy_build => 1);

sub _build_template_product_object {
	my $self = shift;

	$self->_find_related(['product_document_templates',{ product => $self->product }]);
}

sub _build_description {
	my $self = shift;

	$self->_template_product_object->description || $self->result_object->description;
}

# overrides 'update'
sub update {
# 0: columns

	my $self = shift;

	my %local_columns = (
		instances		=> 1,
		reviews			=> 1,
		is_primary	=> 1,
		description => 1
	);

	my %aliases	= (
		instances 	=> 'instance_count',
		reviews			=> 'review_count',
		is_primary 	=> 'primary_template',
		description => 'description'
	);

	$self->SUPER::update({ map { $_ => $_[0]->{$_} } grep { !$local_columns{$_} } keys %{$_[0]} });

	$self->_template_product_object->update({ map { $aliases{$_} => $_[0]->{$_} } grep { $local_columns{$_} } keys %{$_[0]} });

	$self->description($self->_build_description) if $_[0]->{description};

}

__PACKAGE__->meta->make_immutable;

1;