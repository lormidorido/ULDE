package ULDE::Component::Address;

use Moose;
use Moose::Util::TypeConstraints;
use namespace::autoclean;

extends 'ULDE::Component';

class_type 'ULDE::Component::Country';

has '+resultset'			=> ( default => 'Address' );
has '+result_object'	=> ( handles => [qw(id line_1 line_2 line_3 line_4 town county postcode is_biz)] );

has 'country'					=> (is => 'rw', isa => 'ULDE::Component::Country | Int', lazy_build => 1);

sub _build_country {
	my $self = shift;

	ULDE::Component::Country->new({ id => $self->result_object->country->id });
}

sub _build_attributes {
	my $self = shift;

	$self->country($self->_build_country);
}

__PACKAGE__->meta->make_immutable;

1;