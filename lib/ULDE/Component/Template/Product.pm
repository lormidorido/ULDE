package ULDE::Component::Template::Product;
# Product Template class
# Class for making columns handling in link table transparent.
# This class is expected to be used for retrieving one object once to link column data in link table

use Moose;
use namespace::autoclean;
use ULDE::Component::Template;

extends 'ULDE::Component';

has '+resultset'			=> ( default => 'ProductDocumentTemplate' );
has '+result_object'	=> ( handles => {
														instances 	=> 'instance_count',
														reviews			=> 'review_count',
														is_primary	=> 'primary_template',												
													});

has related_obj => ( is => 'rw', isa => 'ULDE::Component::Template', lazy_build => 1, handles => [qw(id name business personal foreign_id product provider instance legal_area category sub_category jurisdiction)] );
has description	=> ( is => 'rw', isa => 'Str', lazy_build => 1) ;

sub _build_related_obj {
	my $self = shift;

	ULDE::Component::Template->new({ id => $self->result_object->document_template->id});
}

sub _build_description {
	my $self = shift;

	$self->result_object->description || $self->related_obj->description;
}

override 'update' => sub {
# 0: {columns}

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

	$self->SUPER::update({ map { $aliases{$_} => $_[0]->{$_} } grep { $local_columns{$_} } keys %{$_[0]} });
	$self->related_obj->update({ map { $_ => $_[0]->{$_} } grep { !$local_columns{$_} } keys %{$_[0]} });
	$self->description($self->_build_description) if $_[0]->{description};
};

__PACKAGE__->meta->make_immutable;

1;