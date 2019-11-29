package ULDE::Web::Service::WebSite::ELE;

use Moose;
use Moose::Util::TypeConstraints;
use LWP::UserAgent;
use URI::Escape;
use Data::Dumper;
use ULDE::Web::Service::WebSite::ELE::Response;

use constant { 	PROTOCOL 		=> 'https',
								HOST 				=> 'www.clientspace.org',
								QP_FIRM			=> 'EAC0656',
								EXTENSION		=> 'asp'
							};

has url				=> (is => 'ro', isa => 'Str', lazy => 1, builder => '_build_url');
has result		=> (is => 'rw', isa => 'ULDE::Web::Service::WebSite::ELE::Response', builder => '_build_result');
has ua 				=> (
										isa => duck_type([qw(request)]),
										is => 'ro',
										lazy => 1,
										builder => '_build_user_agent',
									);

sub _build_url {
  my $self = shift;
  PROTOCOL . '://' . HOST . '/';
}

sub _build_user_agent {
	my $self = shift;
	LWP::UserAgent->new(	ssl_opts	=> {	verify_hostname => 1	});
}

sub _build_result {
	my $self = shift;
	ULDE::Web::Service::WebSite::ELE::Response->new;
}

sub _execute_request {
# 0: path
# 1: request_data

	my $self = shift;
	my $url = $self->url . $_[0] . '.' . EXTENSION . '?firm=' . QP_FIRM;
	print $url . "\n";
#	$self->result->{http_response} = (caller(1))[3] =~ /create/ ? $self->ua->post($url, $_[1]) : $self->ua->get($url, $_[1]);
	$self->result->{http_response} = $self->ua->post($url, $_[1]);
  print $self->result->http_response->code . "\n";
}

sub create_account {
# 0: user_name
# 1: password

	my $self = shift;
  
  $self->_execute_request('register',{	
																				email			=> $_[0],
																				password	=> $_[1],
																				confirm		=> $_[1],
																				state			=> 99,
																				action		=> 1
																			})

#  $self->result = $self->ua->post(	$self->url . '/register.asp?firm=' . QP_FIRM,
#  																	{
#  																		email			=> $_[0],
#  																		password	=> $_[1],
#  																		confirm		=> $_[1],
#  																		state			=> 99,
#  																		action		=> 1
#  																	}
#															  	);

}

1;