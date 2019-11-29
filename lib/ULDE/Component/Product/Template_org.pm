package ULDE::Component::Product::Template;
# Template Product class
# Class for making columns handling in link table transparent.
# This class is expected to be used for retrieving one object ones to link column data in link table

use Moose;
use namespace::autoclean;

extends 'ULDE::Component::Product';

has _product_template_object	=> (is => 'rw', isa => 'DBIx::Class::Row', lazy => 1, required => 1, builder => '_build_product_template_object', handles => {
																																																																									instances 	=> 'instance_count',
																																																																									reviews			=> 'review_count',
																																																																									is_primary	=> 'primary_template'
																																																																									});

has document_template 	=> (is => 'ro', isa => 'Int', required => 1);
has description					=> (is => 'rw', isa => 'Str', lazy_build => 1);

sub _build_product_template_object {
	my $self = shift;

	$self->_find_related(['product_document_templates',{ document_template => $self->document_template }]);
}

sub _build_description {
	my $self = shift;

	$self->_product_template_object->description || $self->result_object->description;
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

	$self->_product_template_object->update({ map { $aliases{$_} => $_[0]->{$_} } grep { $local_columns{$_} } keys %{$_[0]} });

	$self->description($self->_build_description) if $_[0]->{description};
}

__PACKAGE__->meta->make_immutable;

1;