package ULDE::Component::Product;

use Moose;
use Moose::Util::TypeConstraints;
use namespace::autoclean;
use List::Util qw(first);
use ULDE::Component::ServiceDefinition;
use ULDE::Component::Template::Product;
use ULDE::Component::LegalArea;
use ULDE::Component::LegalCategory;
use ULDE::Component::LegalSubCategory;
use ULDE::Component::Jurisdiction;

extends 'ULDE::Component';

class_type 'ULDE::Component::LegalSubCategory';
class_type 'ULDE::Component::ServiceDefinition';

has '+resultset'				=> ( default => 'Product' );
has '+result_object'		=> ( handles => [qw(id name business personal description)] );

has service_definition 	=> ( is => 'rw', isa => 'ArrayRef[ULDE::Component::ServiceDefinition] | ULDE::Component::ServiceDefinition', lazy_build => 1 );
has template 						=> ( is => 'rw', isa => 'ArrayRef[ULDE::Component::Template::Product]', lazy_build => 1 );
has template_h					=> ( is => 'rw', isa => 'HashRef[ULDE::Component::Template::Product]', lazy_build => 1 );

has legal_area 					=> ( is => 'rw', isa => 'ULDE::Component::LegalArea', lazy_build => 1 );
has category 						=> ( is => 'rw', isa => 'ULDE::Component::LegalCategory', lazy_build => 1 );
has sub_category 				=> ( is => 'rw', isa => 'ULDE::Component::LegalSubCategory | Bool', lazy_build => 1, );
has jurisdiction 				=> ( is => 'rw', isa => 'ArrayRef[ULDE::Component::Jurisdiction]', lazy_build => 1 );
has is_pack							=> ( is => 'rw', isa => 'Bool', lazy_build  => 1); 

sub _build_service_definition {
	my $self = shift; 

	[map { ULDE::Component::ServiceDefinition->new({ id => $_->id }) } $self->result_object->service_definitions];
}

sub _build_legal_area {
	my $self = shift; 

	ULDE::Component::LegalArea->new({ id => $self->result_object->legal_area->id });
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

sub _build_template {
	my $self = shift; 

	[map { ULDE::Component::Template::Product->new({ document_template => $_->id, product => $self->id }) } $self->result_object->document_templates];
}

sub _build_template_h {
	my $self = shift; 

	my %struct;
	@struct{ map {$_->id} $self->result_object->document_templates} = (map { ULDE::Component::Template::Product->new({ document_template => $_->id, product => $self->id }) } $self->result_object->document_templates);

	return \%struct;
}

sub _build_is_pack {
	my $self = shift; 

	@{$self->template} > 1 || (first { $_->instances > 1 } @{$self->template}) ? 1 : 0;
}

sub _build_attributes {
	my $self = shift;

	$self->service_definition($self->_build_service_definition);
	$self->template($self->_build_template);
	$self->template_h($self->_build_template_h);

	$self->legal_area($self->_build_legal_area);
	$self->category($self->_build_category);
	$self->sub_category($self->_build_sub_category);
	$self->jurisdiction($self->_build_jurisdiction);

	$self->is_pack($self->_build_is_pack);
}

__PACKAGE__->meta->make_immutable;


1;
