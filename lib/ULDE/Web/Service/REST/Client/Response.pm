package ULDE::Web::Service::REST::Client::Response;
{
  $ULDE::Web::Service::REST::Client::Response::VERSION = '0.12';
}

use Moose;

has 'code' => (
	isa => 'Int',
	is  => 'ro',
);
has 'response' => (
	isa => 'HTTP::Response',
	is  => 'ro',
);
has 'ele_response' => (
	is	=> 'rw',
	isa	=> 'HashRef'
	);
has 'error' => (
	isa => 'Str',
	is  => 'ro',
	predicate => 'failed',
);
has 'data_callback' => (
	init_arg => 'data',
	traits  => ['Code'],
	isa => 'CodeRef', is  => 'ro',
	default => sub { sub { {} } },
	handles => { data => 'execute' },
);

__PACKAGE__->meta->make_immutable;

1;
