package ULDE::Web::Component::Session;

use Moose;
use namespace::autoclean;
use MooseX::UndefTolerant;
use ULDE::Component::Provider;
use ULDE::Component::Referrer;

has 'uri'			=> (is => 'ro', isa => 'Str', required => 0);
has 'provider' 		=> (is => 'ro', isa => 'ULDE::Component::Provider', lazy => 1, builder => '_build_provider');

has 'referrer_id'	=> (is => 'ro', isa => 'Str');
has 'referrer' 		=> (is => 'ro', isa => 'Maybe[ULDE::Component::Referrer]', lazy => 1, builder => '_build_referrer');

sub _build_provider {
	my $self = shift;
	
	ULDE::Component::Provider->new;
}

sub _build_referrer {
	my $self = shift;

	$self->referrer_id ? 
		ULDE::Component::Referrer->new(id => $self->referrer_id):
		undef;
}

no Moose;
__PACKAGE__->meta->make_immutable;
