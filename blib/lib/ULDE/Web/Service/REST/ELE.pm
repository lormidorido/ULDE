package ULDE::Web::Service::REST::ELE;
{
  $ULDE::Web::Service::REST::ELE::VERSION = '0.1';
}
use Moose;
use Digest::HMAC_SHA1;
use MIME::Base64;
use HTTP::Date;
use URI::Escape;
use Data::Dumper;
with 'ULDE::Web::Service::REST::Client';

no warnings 'recursion';

has 'protocol'	=> (is => 'ro', isa => 'Str', default => 'https');
has 'host'			=> (is => 'ro', isa => 'Str', required => 1);
has 'base_urn'	=> (is => 'ro', isa => 'Str', required => 1);
has 'format'		=> (is => 'ro', isa => 'Str', default => 'xml');
has 'token'			=> (is => 'ro', isa => 'Str', required => 1);
has 'secret'		=> (is => 'ro', isa => 'Str', required => 1);
has 'website'		=> (is => 'ro', isa => 'Str', required => 1);
has '+server'		=> (is => 'ro', isa => 'Str', lazy => 1, builder => '_build_server');
has 'result'		=> (is => 'rw', isa => 'ULDE::Web::Service::REST::Client::Response');

before 'post','get','put','delete' => sub {
  my $self = shift;
  (caller(2))[3] =~ /(\w+)$/;
  $self->_generate_headers(uc $1, $_[0]);
};

sub _build_server {
  my $self = shift;
  return $self->protocol . '://' . $self->host;
}

sub _generate_headers {
# 0: request method
# 1: uri
  
  my $self = shift;
  print "method: " . $_[0] . "\n";
 # $self->{override_type} = 'application/x-www-form-urlencoded' if $_[0] eq 'PUT' || $_[0] eq 'POST';
  
  my $time_stamp = time2str();
  $self->set_header('Timestamp', $time_stamp);

  my $hmac = Digest::HMAC_SHA1->new($self->secret);
  my $base_urn = $self->base_urn;
  $_[1] =~ /^$base_urn(.*?)(\?|$)/;
  $hmac->add($_[0] . ' /' . $1 . '|' . $time_stamp . '|' . $self->token);
  $self->set_header('Authorization', 'EPOQ:' . $self->token . ':' . encode_base64($hmac->digest, ''));
}

sub _execute_request {
# 0: urn
# 1: request_data
# 2: additional_paremeters

  my $self = shift;
  print "urn: " . $self->base_urn . $self->website . $_[0] . '.' . $self->format . ${!$_[2] ? \'' : \('?' . join('&', map { $_ . '=' . uri_escape($_[2]->{$_}) } grep { defined $_[2]->{$_} } keys %{$_[2]}))} . "\n";
  print "type: " . $self->type . "\n";

  my $url = $self->base_urn . $self->website . $_[0] . '.' . $self->format . ${!$_[2] ? \'' : \('?' . join('&', map { $_ . '=' . uri_escape($_[2]->{$_}) } grep { defined $_[2]->{$_} } keys %{$_[2]}))};
  $self->{result} = (caller(1))[3] =~ /create/ ? $self->post($url, $_[1]) : (caller(1))[3] =~ /update/ ? $self->put($url, $_[1]) :  $self->get($url, $_[1]);
  print "status: " . $self->{result}->code . "\n";
  print "error: " . $self->{result}->error . "\n" if $self->{result}->error;
#  print Dumper($self->{result}->data) . "\n";
#  print Dumper($self->{result}->response) . "\n";

  # need to add error handling here
  
}

sub _build_common_response_structure {

  my $self = shift;
  
  my $r = $self->{result}->data->{results};
  $self->{result}->{ele_response}->{time_stamp} = $self->{result}->data->{timestamp};
}

sub _parse_xml_paremeter_value {
# 0: xml parameter value

  return '' if ref $_[0];
  return $_[0];
}

sub _build_response_structure {
# 0: result object
# 1: object type

  my $self = shift;
   
  if (ref $_[0] ne 'ARRAY') {
  	return	$_[1] eq 'template' ? 
			{	
				sub_category		  => $self->{format} eq 'xml' ? _parse_xml_paremeter_value($_[0]->{legalcategoryname}) : $_[0]->{legalcategoryname},
  			description			  => $self->{format} eq 'xml' ? _parse_xml_paremeter_value($_[0]->{objectdescription}) : $_[0]->{objectdescription},
				id					      => $self->{format} eq 'xml' ? _parse_xml_paremeter_value($_[0]->{objectid}) : $_[0]->{objectid},
				version				    => $self->{format} eq 'xml' ? _parse_xml_paremeter_value($_[0]->{objectversion}) : $_[0]->{objectversion},
				version_date		  => $self->{format} eq 'xml' ? _parse_xml_paremeter_value($_[0]->{objectversiondate}) : $_[0]->{objectversiondate},
				name				      => $self->{format} eq 'xml' ? _parse_xml_paremeter_value($_[0]->{objectname}) : $_[0]->{objectname},
				sub_category_id		=> $self->{format} eq 'xml' ? _parse_xml_paremeter_value($_[0]->{legalcategoryid}) : $_[0]->{legalcategoryid},
				jurisdiction		  => [split(',', $self->{format} eq 'xml' ? _parse_xml_paremeter_value($_[0]->{objectjurisdictionidlist}) : $_[0]->{objectjurisdictionidlist})]
  			}:
			$_[1] eq 'product' ?
			{
				service_level	=> $self->{format} eq 'xml' ? _parse_xml_paremeter_value($_[0]->{servicelevelname}) : $_[0]->{servicelevelname},
				price			    => $self->{format} eq 'xml' ? _parse_xml_paremeter_value($_[0]->{productpricebeforetax}) : $_[0]->{productpricebeforetax},
				name			    => $self->{format} eq 'xml' ? _parse_xml_paremeter_value($_[0]->{productname}) : $_[0]->{productname},
				sub_category	=> $self->{format} eq 'xml' ? _parse_xml_paremeter_value($_[0]->{subcategoryname}) : $_[0]->{subcategoryname},
				templates		  => [$self->{format} eq 'xml' ? _parse_xml_paremeter_value($_[0]->{objectid}) : $_[0]->{objectid}],
				id				    => $self->{format} eq 'xml' ? _parse_xml_paremeter_value($_[0]->{productid}) : $_[0]->{productid}
			}:
			undef;
  } else {
	if ($_[1] eq 'template') {
	  @{$_[0]} > 1 ?
	  	return [$self->_build_response_structure(pop(@{$_[0]}), $_[1]), @{$self->_build_response_structure($_[0], $_[1])}] :
	  	return [$self->_build_response_structure(pop(@{$_[0]}), $_[1])];
	} elsif ($_[1] eq 'product') {
		my %exists;
		my $struct;
		foreach (@{$_[0]}) {
		  my $obj = $_;
		  push(@{$struct->[$exists{$obj->{productid}}]->{templates}}, $obj->{objectid}), next if defined $exists{$obj->{productid}};
		  push(@{$struct}, $self->_build_response_structure($obj, $_[1]));
		  $exists{$obj->{productid}} = $#{$struct};
		}
		return @{$struct} == 1 ? $struct->[0] : $struct;
	}
  }
}

sub create_quick_account {
# 0: arguments
# 1: request_data

  my $self = shift;
  $self->_execute_request('/quickcustomer', $_[1]);
}

sub create_account  {
# 0: arguments
# 1: request_data

  my $self = shift;
  $self->_execute_request('/customers', $_[1]);

}

sub update_account {
# 0: arguments (epoq_customer_id)
# 1: request_data

  my $self = shift;
  $self->_execute_request('/customers/' . $_[0]->{epoq_customer_id}, $_[1]);

}


sub create_document {
# 0: arguments (epoq_customer_id, epoq_template_id)
# 1: request_data
# 2: 1 ? paid : trial

  my $self = shift;
  $self->{type} = 'application/x-www-form-urlencoded';
  $self->_execute_request('/customers/' . $_[0]->{epoq_customer_id} . '/' . ${$_[2] ? \'documents' : \'rapidocs'} . '/' . $_[0]->{epoq_template_id} . '/' . ${$_[2] ? \'paidoffline' : \'try'}, $_[1]);
}

sub update_document {
# 0: arguments (epoq_customer_id, epoq_document_id)
# 1: request_data

  my $self = shift;
#  $self->{type} = 'application/x-www-form-urlencoded';
  $self->_execute_request('/customers/' . $_[0]->{epoq_customer_id} . '/documents/' . $_[0]->{epoq_document_id}, $_[1]);
}

sub get_document_details {
# 0: arguments (epoq_customer_id, epoq_document_id)

  my $self = shift;
#  $self->{type} = 'application/x-www-form-urlencoded';
  $self->_execute_request('/customers/' . $_[0]->{epoq_customer_id} . '/documents/' . $_[0]->{epoq_document_id});
  
}

sub get_flattened_document {
# 0: arguments (epoq_customer_id, epoq_document_id)
# 1: additional_parameters (water_mark_txt)
# 2: format (pdf || doc)

  my $self = shift;
  $self->{format} = $_[2];
#  $self->{type} = 'application/x-www-form-urlencoded';
  $self->_execute_request('/customers/' . $_[0]->{epoq_customer_id} . '/documents/' . $_[0]->{epoq_document_id}, undef, ${$_[1] && $_[1]->{water_mark_txt} ? \{waterMarkText => $_[1]->{water_mark_txt}} : \undef});
  
}

sub get_documents {
# 0: arguments (epoq_customer_id)
# 1: additional_parameters (page_no, page_size)

  my $self = shift;
  $self->{type} = 'application/x-www-form-urlencoded';
  $self->_execute_request('/customers/' . $_[0]->{epoq_customer_id} . '/documents', undef, ${$_[1] ? \{pageno => $_[1]->{page_no}, pagesize => $_[1]->{page_size}} : \undef});
	
}

sub get_template_details {
# 0: additional_parameters (epoq_template_id)

  my $self = shift;
  $self->{type} = 'application/x-www-form-urlencoded';
  $self->_execute_request('/objects', undef, {objectid => $_[0]->{epoq_template_id}});
  
  return 0 if $self->{result}->error || $self->{result}->code != 200;

  $self->_build_common_response_structure();
  $self->{result}->{ele_response}->{result} = $self->_build_response_structure($self->{result}->data->{results}->{objects}->{object}, 'template');
}

sub get_templates {

  my $self = shift;
  $self->{type} = 'application/x-www-form-urlencoded';
  $self->_execute_request('/objects', undef, 	{	objecttypeid 	=> 1,
  													pageno 			=> 1,
													pagesize 		=> 10000
  												});
  
  return 0 if $self->{result}->error || $self->{result}->code != 200;
  
  $self->_build_common_response_structure();
  $self->{result}->{ele_response}->{result} = $self->_build_response_structure($self->{result}->data->{results}->{objects}->{object}, 'template');
}

sub get_products {

  my $self = shift;
  $self->{type} = 'application/x-www-form-urlencoded';
  $self->_execute_request('/products', undef, {		pageno 			=> 1,
													pagesize 		=> 10000
												});

  return 0 if $self->{result}->error || $self->{result}->code != 200;

  $self->_build_common_response_structure();
  $self->{result}->{ele_response}->{result} = $self->_build_response_structure($self->{result}->data->{results}->{products}->{product}, 'product');
}

sub get_product_details {
# 0: arguments (epoq_product_id)

  my $self = shift;
  $self->{type} = 'application/x-www-form-urlencoded';
  $self->_execute_request('/products/' . $_[0]->{epoq_product_id});
  
  return 0 if $self->{result}->error || $self->{result}->code != 200;

  $self->_build_common_response_structure();
  $self->{result}->{ele_response}->{result} = $self->_build_response_structure($self->{result}->data->{results}->{products}->{product}, 'product');

}

1;