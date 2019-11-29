package ULDE::Component::LegalArea;

use Moose;
use namespace::autoclean;
use ULDE::Component::ServiceDefinition;
use ULDE::Component::Product;
use ULDE::Component::Template;

extends 'ULDE::Component';

has '+resultset'			=> ( default => 'LegalArea' );
has '+result_object'	=> ( handles => [qw(id name description)] );

has service_definition 	=> ( is => 'rw', isa => 'ArrayRef[ULDE::Component::ServiceDefinition]', lazy_build => 1 );
has product 						=> ( is => 'rw', isa => 'ArrayRef[ULDE::Component::Product]', lazy_build => 1 );
has template 						=> ( is => 'rw', isa => 'ArrayRef[ULDE::Component::Template]', lazy_build => 1 );

sub _build_service_definition {
	my $self = shift; 

	[map { ULDE::Component::ServiceDefinition->new({ id => $_->id }) } $self->result_object->service_definitions];
}

sub _build_product {
	my $self = shift; 

	[map { ULDE::Component::Product->new({ id => $_->id }) } $self->result_object->products];
}

sub _build_template {
	my $self = shift; 

	[map { ULDE::Component::Template->new({ id => $_->id }) } $self->result_object->document_templates];
}

sub _build_attributes {
	my $self = shift;

	$self->service_definition($self->_build_service_definition);
	$self->product($self->_build_product);
	$self->template($self->_build_template);
}

__PACKAGE__->meta->make_immutable;


1;
