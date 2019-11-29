package ULDE::Component::LegalCategory;

use Moose;
use namespace::autoclean;
use ULDE::Component::Product;
use ULDE::Component::Template;
use ULDE::Component::LegalSubCategory;

extends 'ULDE::Component';

has '+resultset'			=> ( default => 'LegalCategory' );
has '+result_object'	=> ( handles => [qw(id name description display_order)]) ;

has product 			=> ( is => 'rw', isa => 'ArrayRef[ULDE::Component::Product]', lazy_build => 1 );
has template 			=> ( is => 'rw', isa => 'ArrayRef[ULDE::Component::Template]', lazy_build => 1 );
has sub_category	=> ( is => 'rw', isa => 'ArrayRef[ULDE::Component::LegalSubCategory]', lazy_build => 1 );

sub _build_product {
	my $self = shift; 

	[map { ULDE::Component::Product->new({ id => $_->id }) } $self->result_object->products];
}

sub _build_template {
	my $self = shift; 

	[map { ULDE::Component::Template->new({ id => $_->id }) } $self->result_object->document_templates];
}

sub _build_sub_category {
	my $self = shift; 

	[map { ULDE::Component::LegalSubCategory->new({ id => $_->id }) } $self->result_object->sub_categories];
}

sub _build_attributes {
	my $self = shift;

	$self->product($self->_build_product);
	$self->template($self->_build_template);
	$self->sub_category($self->_build_sub_category);
}

__PACKAGE__->meta->make_immutable;


1;
