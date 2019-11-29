package ULDE::Web::Service::WebSite::ELE::Response;


use Moose;
use HTTP::Response;

has 'http_response' => (
	isa => 'HTTP::Response',
	is  => 'rw',
);

has 'ele_response' => (
	is	=> 'rw',
	isa	=> 'HashRef'
);

has 'success' => (
	isa 		=> 'Bool',
	is 			=> 'rw',
	default	=> 0
);

__PACKAGE__->meta->make_immutable;

1;
