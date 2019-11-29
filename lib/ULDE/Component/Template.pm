package ULDE::Component::Template;

use Moose;
use Moose::Util::TypeConstraints;
use namespace::autoclean;
use ULDE::Component::Product::Template;
use ULDE::Component::DocumentAssemblyProvider;
use ULDE::Component::Template::Instance;
use ULDE::Component::LegalArea;
use ULDE::Component::LegalCategory;
use ULDE::Component::LegalSubCategory;
use ULDE::Component::Jurisdiction;

extends 'ULDE::Component';

class_type 'ULDE::Component::LegalSubCategory';

has '+resultset'			=> ( default => 'DocumentTemplate' );
has '+result_object'	=> ( handles => [qw(id name business personal description foreign_id)] );

has product 			=> ( is => 'rw', isa => 'ArrayRef[ULDE::Component::Product::Template]', lazy_build => 1 );
has provider 			=> ( is => 'rw', isa => 'ULDE::Component::DocumentAssemblyProvider', lazy_build => 1 );
has instance 			=> ( is => 'rw', isa => 'ArrayRef[ULDE::Component::Template::Instance]', lazy_build => 1 );

has legal_area 		=> ( is => 'rw', isa => 'ULDE::Component::LegalArea', lazy_build => 1 );
has category 			=> ( is => 'rw', isa => 'ULDE::Component::LegalCategory', lazy_build => 1 );
has sub_category 	=> ( is => 'rw', isa => 'ULDE::Component::LegalSubCategory | Bool', lazy_build => 1 );
has jurisdiction 	=> ( is => 'rw', isa => 'ArrayRef[ULDE::Component::Jurisdiction]', lazy_build => 1 );

sub _build_product {
	my $self = shift; 

	[map { ULDE::Component::Product::Template->new({ product => $_->id, document_template => $self->id }) } $self->result_object->products];
}

sub _build_provider {
	my $self = shift; 

	ULDE::Component::DocumentAssemblyProvider->new({ id => $self->result_object->document_assembly_provider->id });
}

sub _build_instance {
	my $self = shift; 

	[map { ULDE::Component::Template::Instance->new({ id => $_->id }) } $self->result_object->template_instances];
}

sub _build_legal_area {
	my $self = shift; 

	ULDE::Component::LegalArea->new({ id => $self->result_object->area->id });
}

sub _build_category {
	my $self = shift; 

	ULDE::Component::LegalCategory->new({ id => $self->result_object->category->id });
}

sub _build_sub_category {
	my $self = shift; 

	ULDE::Component::LegalSubCategory->new({ id => $self->result_object->sub_category->id }) if $self->result_object->sub_category;
}

sub _build_jurisdiction {
	my $self = shift; 

	[map { ULDE::Component::Jurisdiction->new({ id => $_->id }) } $self->result_object->jurisdictions];
}

sub _build_attributes {
	my $self = shift;

	$self->product($self->_build_product);
	$self->provider($self->_build_provider);
	$self->instance($self->_build_instance);

	$self->legal_area($self->_build_legal_area);
	$self->category($self->_build_category);
	$self->sub_category($self->_build_sub_category);
	$self->jurisdiction($self->_build_jurisdiction);
}

__PACKAGE__->meta->make_immutable;


1;