package ULDE::Component::LegalSubCategory;

use Moose;
use namespace::autoclean;
use ULDE::Component::Product;
use ULDE::Component::Template;
use ULDE::Component::LegalCategory;

extends 'ULDE::Component';

has '+resultset'			=> ( default => 'LegalSubCategory' );
has '+result_object'	=> ( handles => [qw(id name)] );

has product 	=> ( is => 'rw', isa => 'ArrayRef[ULDE::Component::Product]', lazy_build => 1 );
has template 	=> ( is => 'rw', isa => 'ArrayRef[ULDE::Component::Template]', lazy_build => 1 );
has category	=> ( is => 'rw', isa => 'ArrayRef[ULDE::Component::LegalCategory]', lazy_build => 1 );

sub _build_product {
	my $self = shift; 

	[map { ULDE::Component::Product->new({ id => $_->id }) } $self->result_object->products];
}

sub _build_template {
	my $self = shift; 

	[map { ULDE::Component::Template->new({ id => $_->id }) } $self->result_object->document_templates];
}

sub _build_category {
	my $self = shift; 

	[map { ULDE::Component::LegalCategory->new({ id => $_->id }) } $self->result_object->categories];
}
 
sub _build_attributes {
	my $self = shift;

	$self->product($self->_build_product);
	$self->template($self->_build_template);
	$self->category($self->_build_category);

}

__PACKAGE__->meta->make_immutable;


1;
