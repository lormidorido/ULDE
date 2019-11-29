package ULDE::Web::Service::REST::Client;
{
  $ULDE::Web::Service::REST::Client::VERSION = '0.12';
}

use Moose::Role;
use Moose::Util::TypeConstraints;
use HTTP::Tiny;
use URI::Escape;
use Try::Tiny;

use Carp qw(confess);
use ULDE::Web::Service::REST::Client::Serializer;
use ULDE::Web::Service::REST::Client::Response;
use HTTP::Response;
use HTTP::Status 'status_message';
use HTTP::Headers;

with 'MooseX::Traits';

has 'server' => (
	isa => 'Str',
	is  => 'rw',
);

has 'type' => (
	isa => enum ([qw{application/json application/xml application/yaml application/x-www-form-urlencoded}]),
	is  => 'rw',
	default => 'application/json',
);

has 'override_type' => (
	isa	=> enum ([qw{application/json application/xml application/yaml application/x-www-form-urlencoded multipart/form-data}]),
	is  => 'rw'
);

has clientattrs => (isa => 'HashRef', is => 'ro', default => sub {return {} });

has user_agent => (
	isa => duck_type([qw(request)]),
	is => 'ro',
	lazy => 1,
	builder => '_build_user_agent',
);

sub _build_user_agent {
	my $self = shift;
	return HTTP::Tiny->new(%{$self->clientattrs});
}

has 'persistent_headers' => (
	traits    => ['Hash'],
	is        => 'ro',
	isa       => 'HashRef[Str]',
	default   => sub { {} },
	handles   => {
		set_persistent_header     => 'set',
		get_persistent_header     => 'get',
		has_no_persistent_headers => 'is_empty',
		clear_persistent_headers  => 'clear',
	},
);
has 'httpheaders' => (
	traits      => ['Hash'],
	is          => 'ro',
	isa         => 'HashRef[Str]',
    lazy        => 1,
	writer      => '_set_httpheaders',
	builder     => '_build_httpheaders',
	initializer => '_build_httpheaders',
	handles     => {
		set_header     => 'set',
		get_header     => 'get',
		has_no_headers => 'is_empty',
		clear_headers  => 'clear',
	},
);

has serializer_class => (
	isa => 'ClassName', is => 'ro',
	default => 'ULDE::Web::Service::REST::Client::Serializer',
);

no Moose::Util::TypeConstraints;

sub _build_httpheaders {
	my ($self, $headers) = @_;
	$headers ||= {};
	$self->_set_httpheaders( { %{$self->persistent_headers}, %$headers });
}

sub reset_headers {my $self = shift;$self->_set_httpheaders($self->persistent_headers)}

sub _rest_response_class { 'ULDE::Web::Service::REST::Client::Response' }

sub _handle_response {
	my ( $self, $res ) = @_;
	if ( ref $res eq 'HASH' ) {
		my $code = $res->{'status'};
		return HTTP::Response->new(
			$code,
			$res->{'reason'} || status_message($code),
			HTTP::Headers->new(%{$res->{'headers'}}),
			$res->{'content'},
		);
	} else {
		return $res;
	}
}

sub _new_rest_response {
	my ($self, @args) = @_;
	return $self->_rest_response_class->new(@args);
}

sub new_serializer {
	my ($self, @args) = @_;
	$self->serializer_class->new(@args);
}

sub _serializer {
	my ($self, $type) = @_;
	$type ||= $self->type;
	$type =~ s/;\s*?charset=.+$//i; #remove stuff like ;charset=utf8
	try {
		$self->{serializer}{$type} ||= $self->new_serializer(type => $type);
	}
	catch {
		# Deal with real life content types like "text/xml;charset=ISO-8859-1"
		warn "No serializer available for " . $type . " content. Trying default " . $self->type;
		$self->{serializer}{$type} = $self->new_serializer(type => $self->type);
	};
	return $self->{serializer}{$type};
}

sub do_request {
	my ($self, $method, $uri, $opts) = @_;
	return $self->user_agent->request($method, $uri, $opts);
}

sub _call {
	my ($self, $method, $endpoint, $data, $args) = @_;
	my $uri = $self->server.$endpoint;
	# If no data, just call endpoint (or uri if GET w/parameters)
	# If data is a scalar, call endpoint with data as content (POST w/parameters)
	# Otherwise, encode data
	$self->set_header('content-type', $self->override_type || $self->type);

# print "override: " . $self->override_type . "\n";

	my %options = (headers => $self->httpheaders);
	if ( defined $data ) {
		$options{content} = ref $data ? $self->_serializer->serialize($data) : $data;
		$options{'headers'}{'content-length'} = length($options{'content'});
	}
	my $res = $self->_handle_response( $self->do_request($method, $uri, \%options) );

#	print $method . " | " . $uri . " | \n";
#	foreach (keys %{$options{headers}}) {
#		print $_ . " = " . $options{headers}->{$_} . "\n";	
#	}
#	print "content: " . $options{'content'} . "\n";
	
	$self->reset_headers unless $args->{preserve_headers};
	# Return an error if status 5XX
	return $self->_new_rest_response(
		code => $res->code,
		response => $res,
		error => $res->message,
        ) if $res->code > 499;

	my $deserializer_cb = sub {
		# Try to find a serializer for the result content
		my $content_type = $args->{deserializer} || $res->header('Content-Type');
		my $deserializer = $self->_serializer($content_type);
		# Try to deserialize
		my $content = $res->decoded_content;
		$content = $deserializer->deserialize($content) if $deserializer && $content;
		$content ||= {};
	};
	return $self->_new_rest_response(
		code => $res->code,
		response => $res,
		data => $deserializer_cb,
        );
}

sub _urlencode_data {
	my ($self, $data) = @_;
	return join '&', map { uri_escape($_) . '=' . uri_escape($data->{$_})} keys %$data;
}

sub _request_with_query {
	my ($self, $method, $endpoint, $data, $args) = @_;
	my $uri = $endpoint;
	if ($data && scalar keys %$data) {
		$uri .= '?' . $self->_urlencode_data($data);
	}
	return $self->_call($method, $uri, undef, $args);
}

sub get { return shift->_request_with_query('GET', @_) }

sub head { return shift->_request_with_query('HEAD', @_) }

sub delete { return shift->_request_with_query('DELETE', @_) }

sub _request_with_body {
	my ($self, $method, $endpoint, $data, $args) = @_;
	my $content = $data;
	if ( $self->type =~ /urlencoded/ ) {
		$content = ( $data && scalar keys %$data ) ? $self->_urlencode_data($data) : q{};
	}
	return $self->_call($method, $endpoint, $content, $args);
}

sub post { return shift->_request_with_body('POST', @_) }

sub put { return shift->_request_with_body('PUT', @_) }

sub options { return shift->_request_with_body('OPTIONS', @_) }

1;