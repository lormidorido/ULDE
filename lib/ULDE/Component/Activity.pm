package ULDE::Component::Activity;

use Moose;
use namespace::autoclean;
use ULDE;

has ulde_schema 				=> (is => 'ro', isa => 'ULDE::Schema::ULDE', lazy_build => 1);
has template_resultset	=> (is => 'ro', isa => 'DBIx::Class::ResultSet', lazy_build => 1);
has product_resultset		=> (is => 'ro', isa => 'DBIx::Class::ResultSet', lazy_build => 1);

sub _build_template_resultset {
	my $self = shift; 

	$self->ulde_schema->resultset('ActivityTemplateInstance');
}

sub _build_product_resultset {
	my $self = shift; 

	$self->ulde_schema->resultset('ActivityProductInstance'); 
}

sub _build_ulde_schema {
	my $self = shift; 

	ULDE->new->ulde_schema;
}

sub add {
# 0: { template_instance_id || product_instance_id }
# 1: activity_id

	my $self = shift;

	if ($_[1]) {
		$self->template_resultset->create({ activity_id => $_[1], template_instance => $_[0]->{template_instance_id} }) if defined $_[0]->{template_instance_id};
		$self->product_resultset->create({ activity_id => $_[1], product_instance => $_[0]->{product_instance_id} }) if defined $_[0]->{product_instance_id};
	}
}

__PACKAGE__->meta->make_immutable;

1;
