package ULDE::Web::Service::WebSite::ELE;

use Moose;
use Moose::Util::TypeConstraints;
use LWP::UserAgent;
use URI::Escape;
use URI;
use Data::Dumper;
use HTML::TokeParser; # Will be removed when substituted with HTML::Tree
use List::Util qw(max);
use HTML::TreeBuilder 5 -weak;
use Text::Sentence qw(split_sentences);
use URL::Encode qw(url_params_mixed);
use ULDE::Web::Service::WebSite::ELE::Response;

use constant { 	PROTOCOL 			=> 'https',
								HOST 					=> 'www.clientspace.org',
								QP_FIRM				=> 'EAC0C656',
								EXTENSION			=> 'asp',
								ADMIN_USER		=> 'Rrichard',
								ADMIN_PASS		=> 'hulifux3'
							};

has url						=> (is => 'ro', isa => 'Str', lazy => 1, builder => '_build_url');
has last_request	=> (is => 'rw', isa => 'Str');
has result				=> (is => 'ro', isa => 'ULDE::Web::Service::WebSite::ELE::Response', builder => '_build_result', 	handles => { 
																																																											response 			=> 'ele_response',
																																																											success 			=> 'success',
																																																											http_response	=> 'http_response'
																																																										});
has admin_user 	=> (is => 'ro', isa => 'Str', default => ADMIN_USER);
has admin_pass 	=> (is => 'ro', isa => 'Str', default => ADMIN_PASS);
has ua 					=> (
											isa => duck_type([qw(request)]),
											is => 'ro',
											lazy => 1,
											builder => '_build_user_agent',
										);

has cookie_jar_storage_path => (is => 'ro', isa => 'Str', required => 1);

sub _build_url {
  my $self = shift;

  PROTOCOL . '://' . HOST . '/';
}

sub _build_user_agent {
	my $self = shift;

	LWP::UserAgent->new(
		ssl_opts							=> { verify_hostname => 0 },
		cookie_jar						=> { ignore_discard => 1 },
		requests_redirectable	=> ['GET', 'HEAD', 'POST']
	);
}

sub _build_result {
	my $self = shift;

	ULDE::Web::Service::WebSite::ELE::Response->new;
}

sub _reset_result {
	my $self = shift;

	$self->result->success(0);
	$self->result->ele_response({})
}

sub _execute_request {
# 0: path
# 1: method
# 2: request_data
# 3: query_param

	my $self = shift;
	my $url = $self->url . $_[0] . '.' . EXTENSION . '?firm=' . QP_FIRM . ${$_[3] ? \('&' . join('&', map {"$_=$_[3]->{$_}"} keys %{$_[3]})) : \''};
#	print $url . "\n";

	$self->result->http_response($_[1] eq 'post' ? $self->ua->post($url, $_[2]) : $self->ua->get($url));
	$self->last_request($url);

#	print $self->result->http_response->code . "\n";
#	print $self->result->http_response->content . "\n";
}


sub _result_parser {

  my $self = shift;

  #OS check respond code first!
  #OS need to add code that checks if page structure has changed!

  $self->_reset_result();
  my $tree = HTML::TreeBuilder->new_from_content($self->result->http_response->content);

  (caller(1))[3] =~ '_admin_log_in' 		&& !$tree->look_down('id', 'access_signin_page') 						&& ($self->result->success(1));
  (caller(1))[3] =~ '_customer_log_in' 	&& $tree->look_down('_tag', 'h1')->as_text !~ /Log in Error/ && ($self->result->success(1));

  ((caller(1))[3] =~ 'submit_document' || (caller(1))[3] =~ 'delete_document' || (caller(1))[3] =~ 'rename_document') && ($self->result->success(1));

  if ((caller(1))[3] =~ 'create_quick_account') {
  	my $h1 = $tree->look_down('_tag', 'h1');
  	unless ($h1->as_text eq 'Error') {
	  	$self->result->success(1);
	  	my $form = $tree->look_down('_tag', 'form');
	  	my %attr = $form->all_attr;
	  	$attr{action} =~ /&id=(\d+)/;
	  	$self->result->ele_response->{client_id} = $1;
  	}
  } elsif ((caller(1))[3] =~ 'update_account') {
  	my $h1 = $tree->look_down('_tag', 'h1');
  	if ($h1->as_text =~ 'Error') {
  		my $error_msg = ($tree->look_down('_tag', 'p'))[2]->as_text;
  		$error_msg =~ s/!\s\./ \./g;
  		push(@{$self->result->ele_response->{error}->{descr}},split_sentences($error_msg));
  	} else {
  		$self->result->success(1);
  	}
  } elsif ((caller(1))[3] =~ 'get_account_details') {
  	$self->result->ele_response->{first_name} 			= $tree->look_down('class',qr/client_firstname/)->look_down('_tag','strong')->as_text;
  	$self->result->ele_response->{surname} 					= $tree->look_down('class',qr/client_lastname/)->look_down('_tag','strong')->as_text;
   	$self->result->ele_response->{dob} 							= $tree->look_down('class',qr/client_birthdate/)->look_down('_tag','strong')->as_text;
  	$self->result->ele_response->{address} 					= $tree->look_down('class',qr/client_address/)->look_down('_tag','strong')->as_text;
  	$self->result->ele_response->{postcode}	 				= $tree->look_down('class',qr/client_postcode/)->look_down('_tag','strong')->as_text;
  	$self->result->ele_response->{biz_name} 				= $tree->look_down('class',qr/client_businessname/)->look_down('_tag','strong')->as_text;
  	$self->result->ele_response->{phone} 						= $tree->look_down('class',qr/client_telephone/)->look_down('_tag','strong')->as_text;
  	$self->result->ele_response->{email} 						= $tree->look_down('class',qr/client_email/)->look_down('_tag','strong')->as_text;

  	$tree->look_down('class',qr/client_registered/)->look_down('_tag','strong')->as_text =~ /^(.*?) (.*)$/;
  	$self->result->ele_response->{date_registered} 	= $1;
  	$self->result->ele_response->{time_registered} 	= $2;

  	$self->result->success(1);
 } elsif ((caller(1))[3] =~ 'get_account_password') {
 		if ($tree->look_down('class',qr/password_box/)->as_text =~ /is\: (.*?)$/) {
	 		$self->result->ele_response->{password} = $1;
	 		$self->result->success(1);
	 	}
 } elsif ((caller(1))[3] =~ 'create_document') {
		$self->result->ele_response->{doc_id} = url_params_mixed($self->http_response->base->query)->{id};
		$self->result->success(1);
 } elsif ((caller(1))[3] =~ 'get_products') {
 		if (my $product_list = $tree->look_down('class',qr/store records/)) {
 			foreach ($product_list->look_down('_tag','li','class',qr/store-product/)) {

 				my %struct = (
 					type 		=> ${ $_->attr('class') =~ /store-product-document/ ? \'document' : $_->attr('class') =~ /store-product-pack/ ? \'pack' : \'service' },
 					id			=> $_->look_down('class',qr/store-product-id/)->as_text,
 					status 	=> $_->look_down('class',qr/store-product-status/)->as_text
 				);

 				if ($struct{type} eq 'document') {
 					my $a 							= $_->look_down('_tag','a');
 					$a->attr('href') 		=~ m|^r45/.*?\?(.*$)|;
 					$struct{templates} 	= [{ id => url_params_mixed($1)->{id}, primary => 1 }];
 					$struct{name}				= $a->detach->as_trimmed_text;
 				} else {
 					$struct{name} 			= $_->look_down('class',qr/store-product-name/)->as_trimmed_text;
 				}

				$struct{library}			= $_->look_down('class',qr/record-prop-library$/)->as_text;
				$struct{category} 		= $_->look_down('class',qr/record-prop-category/)->as_text;
				$struct{sub_category}	= ucfirst $1 if $struct{category} =~ s/ - (.*?)$//;

				if (my $templates = $_->look_down('class',qr/store-product-includes/)) {
					foreach ($templates->look_down('_tag','li')) {
	 					my $a 							= $_->look_down('_tag','a');
	 					$a->attr('href') 		=~ m|^r45/.*?\?(.*$)|;
	 					push(@{$struct{templates}}, { id => url_params_mixed($1)->{id}, primary => ${ $a->parent->attr('class') ? \1 : \0 } });	
					}
				}

				$struct{price} 		= $_->look_down('class',qr/record-prop-price/) ? $_->look_down('class',qr/record-prop-price/)->as_text : '0.00';
				$struct{warning}	= $_->look_down('class',qr/store-product-warning-flag/) ? $_->look_down('class',qr/store-product-warning-flag/)->attr('title') : undef;

 				push(@{$self->result->ele_response->{products}}, \%struct);
 			}
 			$self->result->success(1);
 		}
	} elsif ((caller(1))[3] =~ 'get_product_name') {
 		if ($tree->look_down('id',qr/customise_editproduct_page/)) {
 			$tree->look_down('_tag','h1')->look_down('_tag','a')->delete();
 			$self->result->ele_response->{name} = $tree->look_down('_tag','h1')->as_trimmed_text;
 			$self->result->success(1);
 		}
	} elsif ((caller(1))[3] =~ 'get_product_info') {
 		if ($tree->look_down('class',qr/product-description/)) {
 			foreach ($tree->look_down('_tag','tr','class',qr/discount_product/)) {
 				my @td = $_->look_down('_tag','td');
 				my $a = pop(@td)->look_down('class',qr/edit_button/);
 				$a->attr('href') 		=~ m|.*?\?(.*$)|;				
 				push(@{$self->result->ele_response->{discounts}}, {
 					id 			=> url_params_mixed($1)->{discid},
 					expiry 	=> pop(@td)->as_text,
 					status 	=> pop(@td)->as_text,
 					amount 	=> map { /^\D(\d.*)$/ ? $1 : $_ } pop(@td)->as_text,
 					name 		=> shift(@td)->as_text
 				});
 			}

 			foreach ($tree->look_down('class',qr/option_product/)) {
 				my @td = $_->look_down('_tag','td');

 				my $a = pop(@td)->look_down('class',qr/edit_button/);
 				$a->attr('href') =~ m|.*?\?(.*$)|;
 				my $id = url_params_mixed($1)->{id};

 				my $description = ULDE::Web::Service::WebSite::ELE->new;
 				$description->get_option_description($id);

 				push(@{$self->result->ele_response->{options}}, {
 						id 					=> $id,
 						description => $description->result->ele_response->{description},
 						name 				=> $td[0]->as_trimmed_text,
 						price 			=> map { /^.+?(\d.*)$/ ? $1 : '0.00' } pop(@td)->as_text
 					});
 			}
 			$self->result->success(1);
 		}
	} elsif ((caller(1))[3] =~ 'get_product_description') {
 		if (my @p = $tree->look_down('_tag','p')) {
			$self->result->ele_response->{description} = pop(@p)->as_trimmed_text;
 			$self->result->success(1);
 		}
	} elsif ((caller(1))[3] =~ 'get_global_discounts') {
 		if (my $discount_list = $tree->look_down('_tag','tbody','class',qr/^records$/)) {
 			foreach ($discount_list->look_down('_tag','tr')) {
 				my @td = $_->look_down('_tag','td');
 				my $a = pop(@td)->look_down('class',qr/edit_button/);
 				$a->attr('href') =~ m|.*?\?(.*$)|; 				
 				push(@{$self->result->ele_response->{discounts}}, {
					id 			=> url_params_mixed($1)->{discid},
					expiry 	=> pop(@td)->as_text,
					status 	=> pop(@td)->as_text,
					amount 	=> pop(@td)->as_text,
					name 		=> pop(@td)->look_down('_tag','span')->detach->as_trimmed_text
 				});
 			}
 			$self->result->success(1);
 		}
	} elsif ((caller(1))[3] =~ 'get_global_options') {
 		if (my $option_list = $tree->look_down('_tag','tbody','class',qr/^records$/)) {
 			foreach ($option_list->look_down('_tag','tr')) {
 				my @td = $_->look_down('_tag','td');

 				my $a = pop(@td)->look_down('class',qr/edit_button/);
 				$a->attr('href') 		=~ m|.*?\?(.*$)|;
 				my $id = url_params_mixed($1)->{id};

 				my $description = ULDE::Web::Service::WebSite::ELE->new;
 				$description->get_option_description($id);

 				push(@{$self->result->ele_response->{options}}, {
 						id 					=> $id,
 						description => $description->result->ele_response->{description},
 						price 			=> map { /^.+?(\d.*)$/ ? $1 : '0.00' } pop(@td)->as_text,
 						name 				=> pop(@td)->look_down('_tag','span')->detach->as_trimmed_text
 					});
 			}
 			$self->result->success(1);
 		}
	} elsif ((caller(1))[3] =~ 'get_option_description') {
 		if (my $textarea = $tree->look_down('_tag','textarea')) {
 			$self->result->ele_response->{description} = $textarea->as_text;
 			$self->result->success(1);
 		}
 	} elsif ((caller(1))[3] =~ 'get_rapidocs') {
 		unless ($tree->look_down('_tag','h1')->as_text =~ /Error/) {
# 			my $body = $tree->look_down('_tag','body');
# 			$body->attr('onload','');
			foreach (@{$tree->extract_links()}) {
				next if $_->[0] =~ /googleapis/ || $_->[0] =~ /http/ || $_->[0] =~ /javascript/;
#				print join(' | ',@$_) . "\n";
				$_->[0] =~ /^#/ ?
				$_->[1]->attr($_->[2], $self->last_request . $_->[0]):
				$_->[1]->attr($_->[2], URI->new_abs('r45/' . $_->[0], $self->url));
			}
			$self->result->ele_response->{rapidocs_html} = $tree->as_HTML;
 			$self->result->success(1);
 		} 
 	} elsif ((caller(1))[3] =~ 'get_flattened_document') {
 		$self->result->ele_response->{doc} = $self->result->http_response->content;
 		$self->result->success(1);
 	} elsif ((caller(1))[3] =~ 'get_clients') {
 		if ($tree->look_down('_tag','body','id',qr/client_list_page/)) {
 			my $i = 0;
 			foreach ($tree->look_down('_tag','table','class',qr/data/)->look_down('_tag','tr','class',qr/record record-menu-open/)) {
 				push(@{$self->result->ele_response->{clients}}, {
 						id 					=> $_->look_down('class',qr/record-prop-id/)->as_text,
 						status 			=> $_->look_down('class',qr/record-prop-status/)->as_text,
 						first_name 	=> do {$_->look_down('class',qr/record-prop-name/)->as_text =~ /^.*?,(.*)$/; $1},
 						surname 		=> do {$_->look_down('class',qr/record-prop-name/)->as_text =~ /^(.*?),/; $1},
 						email 			=> $_->look_down('class',qr/record-prop-email/)->as_text,
 						phone 			=> $_->look_down('class',qr/record-prop-phone/)->as_text,
 					});
			}
			$self->result->success(1);		
 		} 
 	} elsif ((caller(1))[3] =~ 'return_document_to_customer') {
 		$self->result->success(1) if $tree->look_down('_tag','div','class',qr/view double/)->look_down('_tag','p')->as_text =~ /document has been returned/;
 	} elsif ((caller(1))[3] =~ 'notify_customer_' || (caller(1))[3] =~ 'uncomplete_document' || (caller(1))[3] =~ 'complete_document') {
 		$self->result->success(1) if $tree->look_down('_tag','div','class',qr/view/)->look_down('_tag','h1')->as_text =~ /Status changed/;
 	} elsif ((caller(1))[3] =~ 'purchase_product') {
 		if ($tree->look_down('_tag','h1')->as_text =~ /succeeded/i) {
 			$self->result->ele_response->{product_name} = $tree->look_down('_tag','td','class',qr/purchase/)->as_trimmed_text;
 			$self->result->ele_response->{order_number} = $tree->look_down('_tag','td','class',qr/transaction/)->as_trimmed_text;
 			$self->result->ele_response->{reference} 		= $tree->look_down('_tag','td','class',qr/reference/)->as_trimmed_text;
 			$self->result->ele_response->{amount} 			= $tree->look_down('_tag','td','class',qr/amount/)->as_trimmed_text;
 			$self->result->ele_response->{time_Stamp} 	= $tree->look_down('_tag','td','class',qr/datetime/)->as_trimmed_text;
 			$self->result->success(1);
 		} elsif ($tree->look_down('_tag','h1')->as_text =~ /declined/i) {
 			$self->result->ele_response->{decline_reason} = ($tree->look_down('id','main-panel')->look_down('_tag','p'))[1]->as_trimmed_text;
 		}
 	}
}

# Will eventually be removed and included in _result_parser
sub _parse_result {
# 0: path
# 1: query_param

  my $self = shift;

  #OS check respond code first! 

  $self->_reset_result();
	my $p = HTML::TokeParser->new(\$self->result->http_response->content);

	if ($_[0] eq 'members' && defined $_[1]->{laction} && $_[1]->{laction} == 0) {
		if ($p->get_tag("h1")) {
			my $tag_txt = $p->get_trimmed_text;
			if ($tag_txt =~ /My Services - Legal Documents/) {
				while ($p->get_tag("th")) {
					my $doc_state = $p->get_trimmed_text;
					$doc_state = 	$doc_state =~ /trial/i ? 			'trial' :
												$doc_state =~ /progress/i ? 	'active':
												$doc_state =~ /submitted/i ? 	'review' :
																											'completed';
					while (my $tr = $p->get_tag("tr")) {
						last unless $tr->[1]->{class};
						next unless $tr->[1]->{class} =~ /document/;
						while (my $td = $p->get_tag('td')) {
							if ($td->[1]->{class} eq 'name') {
								if ($doc_state eq 'review' || $doc_state eq 'completed') {
									$doc_state eq 'review' ? 
										$p->get_trimmed_text =~ m|^(.*?)\s(\d+/\d+/\d+)|:
										$p->get_trimmed_text =~ m|^(.*?)\s\(Completed (\d+/\d+/\d+)|;
									my ($name,$date) = ($1,$2);
									my $a = $p->get_tag('a');
									$a->[1]->{onclick} =~ m|communications\.asp\?(.*?)'|;
									my $query_param = url_params_mixed($1);
									$doc_state eq 'review' ?
										push(@{$self->result->ele_response->{docs}},{
											doc_id 				=> $query_param->{docid},
											name 					=> $name,
											date_created	=> $date,
											state 				=> $doc_state
										}) :
										push(@{$self->result->ele_response->{docs}},{
											doc_id 					=> $query_param->{docid},
											name 						=> $name,
											date_completed	=> $date,
											state 					=> $doc_state
										});																	
								} else {
									my $a = $p->get_tag('a');
									$a->[1]->{href} =~ m|^r45/.*?\?(.*$)|;
									my $query_param = url_params_mixed($1);
									my $name = $p->get_trimmed_text;
									$p->get_trimmed_text('/td') =~ m|(\d+/\d+/\d+)|;
									push(@{$self->result->ele_response->{docs}},{
										doc_id 				=> $query_param->{id},
										name 					=> $name,
										date_created	=> $1,
										state 				=> $doc_state
									});
								}
								last unless $doc_state eq 'trial' || $doc_state eq 'review';
							} elsif ($td->[1]->{class} eq 'actions') {

								if ($doc_state eq 'review') {
									$p->get_tag('div');
									$p->get_trimmed_text =~ m|(\d+/\d+/\d+)|;
									$self->result->ele_response->{docs}->[$#{$self->result->ele_response->{docs}}]->{date_review} = $1;
									last;
								} elsif ($doc_state eq 'trial') {
									$p->get_tag('a');
									$p->get_trimmed_text =~ /Purchase for (.*)/;
									$self->result->ele_response->{docs}->[$#{$self->result->ele_response->{docs}}]->{price} = $1;
									last;
								}
							}
						}
					}
				}
				$self->result->success(1);
			} else {
				#OS page code has changed!
			}
		}		
	}
}

sub _clear_cookies {

  my $self = shift;

	$self->ua->cookie_jar->clear;
}

sub _get_cookie_jar_file {
# 0: [user_name,pass] || undef

  my $self = shift; 

	return $self->cookie_jar_storage_path . ($_[0] ? "$_[0]->[0] - $_[0]->[1]" : 'admin_cookie_jar');
}

sub _store_session_cookie {
# 0: [user_name,pass] || undef

  my $self = shift; 

 	$self->ua->{cookie_jar}->save($self->_get_cookie_jar_file($_[0]));
}

sub _set_session_cookie {
# 0: [user_name,pass] && undef

  my $self = shift;

  if (-f $self->_get_cookie_jar_file($_[0])) {

	  $self->ua->{cookie_jar}->load($self->_get_cookie_jar_file($_[0]));

#	  $self->_store_session_cookie($_[0]);

  	return 1;
	}
  
  return 0;
}

sub _customer_log_in {
# 0: [user_name,pass]
# 1: 1 ? set_new_session_cookie

  my $self = shift;

  return 1 if !$_[1] && $self->_set_session_cookie($_[0]);

  $self->_clear_cookies;

  $self->_execute_request('members','post',{
  	username 	=> $_[0]->[0],
  	password 	=> $_[0]->[1]
  });

  $self->_result_parser;

	$self->_store_session_cookie($_[0]) if $self->result->success;

  return $self->result->success;
}

sub _admin_log_in {
# 0: 1 ? set_new_session_cookie

  my $self = shift;

  return 1 if !$_[0] && $self->_set_session_cookie;

  $self->_clear_cookies;

  $self->_execute_request('admin2','post',{
  		username 	=> $self->admin_user,
  		password 	=> $self->admin_pass
  	});

  $self->_result_parser;

	$self->_store_session_cookie if $self->result->success;

  return $self->result->success;
}

sub refresh_session_cookies {
# 0: [user_name,pass] ? set_new_session_cookies : refresh_session_cookies

	my $self = shift;

	$self->_admin_log_in(1), $self->_customer_log_in($_[0],1) if @_;
}

sub get_assembler_url {
# 0: 'customer' || 'admin' || 'reviewer' || undef
# 1: {'template_id' || 'instance_id'}

		my $self = shift;

		return $self->url . 'r45/assembler.asp?firm=' . QP_FIRM . '&id=' . ($_[1]->{template_id} || $_[1]->{instance_id}) . '&action=' . ${defined $_[0] && $_[0] eq 'customer' && $_[1]->{instance_id} ? \'m' : defined $_[0] && ($_[0] eq 'admin' || $_[0] eq 'reviewer') ? \'a&c=0' : \'p'};
}

sub get_login_url {
# 0: 'customer' || 'admin' || 'reviewer'

		my $self = shift;

		return $self->url . ${$_[0] eq 'customer' ? \'members.asp' : \'admin2.asp'} . '?firm=' . QP_FIRM;
}

sub create_quick_account {
# 0: [user_name,pass]

	my $self = shift;
  
  if ($self->_admin_log_in) {
	  $self->_execute_request('admin2','post',{	
			email			=> $_[0]->[0],
			password	=> $_[0]->[1]
		},{
			action 		=> 'submit',
			laction 	=> 12
		});

	  $self->_result_parser;
  }

  return $self->result->success;
}

sub create_account {
# 0: [user_name,pass]
# 2: {first_name,surname,biz_name,email,address,postcode,phone,dob}

	my $self = shift;

	$self->create_quick_account($_[0]);
	$self->update_account(@_) if $self->result->success;
	return $self->result->success;
}

sub get_clients {

	my $self = shift;

	$self->_admin_log_in &&
	$self->_execute_request('admin2','get',undef,{laction => 4}),
	$self->_result_parser;

	return $self->result->success;
}

sub update_account {
# 0: ele_client_id
# 1: {first_name,surname,biz_name,email,address,postcode,phone,dob}

	my $self = shift;

	if ($self->_admin_log_in) {
		$self->_execute_request('admin2','post',{	
			first			=> $_[1]->{first_name},
			last			=> $_[1]->{surname},
			business 	=> $_[1]->{biz_name},
			email			=> $_[1]->{email},
			dob				=> $_[1]->{dob},
			address1	=> $_[1]->{address},
			zip				=> $_[1]->{postcode},
			phone			=> $_[1]->{phone}
		},{
			action		=> 'edit',
			id 				=> $_[0],
			tag 			=> 1,
			laction		=> 4
		});

		$self->_result_parser;
	}
	return $self->result->success;
}

sub get_account_details {
# 0: ele_client_id

	my $self = shift;

	if ($self->_admin_log_in) {
		$self->_execute_request('admin2','get',undef,{
			id 			=> $_[0],
			laction => 4,
			action 	=> 'details'
		});

		$self->_result_parser;
	}
	return $self->result->success;
}

sub get_account_password {
# 0: ele_client_id
# 1: include user_name

	my $self = shift;


	$self->get_account_details($_[0]) if $_[1];
	my $user_name = $self->result->ele_response->{email} if $_[1] && $self->result->success;

	$self->_admin_log_in &&
	$self->_execute_request('showpw2','get',undef,{id => $_[0]}),
	$self->_result_parser;

	$self->result->ele_response->{user_name} = $user_name if defined $user_name;
	return $self->result->success;
}

sub change_account_password {
# 0: ele_client_id
# 1: new_pass

	my $self = shift;

}

sub get_session_cookie {
# 0: 1 ? [user_name,pass] : admin session

  my $self = shift; 

  if ($_[0]) {
  	$self->result->ele_response->{cookie_jar} = $self->ua->{cookie_jar} if $self->_customer_log_in($_[0])
  } else {
  	$self->result->ele_response->{cookie_jar} = $self->ua->{cookie_jar} if $self->_admin_log_in;
  }

  return $self->result->success;
}
 
sub create_document {
# 0: ele_template_id
# 1: [username, pass]

  my $self = shift;

  $self->_customer_log_in($_[1]) &&
  $self->_execute_request('r45/assembler','get',undef,{
			action 	=> 'p',
			id 			=> $_[0]
		}),

 	$self->_result_parser;

	return $self->result->success;

}

sub get_document_status {

}

sub rename_document {
# 0: ele_document_id
# 1: new_name

  my $self = shift;

  #OS only trial docs. check dock status

	$self->_admin_log_in &&
	$self->_execute_request('admin2','post',{
			newname => $_[1]
		},{
			id 			=> $_[0],
			done 		=> 1,
			laction => 0,
			action 	=> 'rename'
		}),
	$self->_result_parser;

	return $self->result->success;
}

sub delete_document {
# 0: ele_document_id

  my $self = shift;

  # only trial docs can be deleted. check dock status

	$self->_admin_log_in &&
	$self->_execute_request('admin2','get',undef,{
			id 		=> $_[0],
			done 		=> 1,
			laction => 0,
			action 	=> 'delete',
			c 			=> 0
		}),
	$self->_result_parser;

	return $self->result->success;
}


sub get_client_documents {
# 0: [user_name,pass]

  my $self = shift;

	if ($self->_customer_log_in($_[0])) {

		$self->_execute_request('members','get',undef,{
			laction => 0
		});

		$self->_parse_result('members',{
			laction => 0
		});
	}
	return $self->result->success;
}

sub get_purchase_cost {

}

sub purchase_product {
# 0: [user_name,pass]
# 1: ele_product_id
# 2: ele_document_id (if to associate with trial doc)
# 3: payment_details {card_number,ccv,exp_date,card_type,name_on_card,address,postcode,amount,discount_voucher,voucher_discount,issue_number,start_date, ele_option_id}

  my $self = shift;

  my $request_data = {
			understand 	=> 'on',
			AccountNum 	=> $_[3]->{card_number},
			CardSecVal 	=> $_[3]->{ccv},
			ExpDate 		=> $_[3]->{exp_date}, 									# MMYY
			cardtype 		=> $_[3]->{card_type}, 									# visa | mastercard | solo | maestro
			AVSname 		=> $_[3]->{name_on_card},
			AVSaddress1 => $_[3]->{address},
			AVSzip 			=> $_[3]->{postcode},
			ntb 				=> $_[2] ? 1 : undef,
			id 					=> $_[2] || undef,
			email 			=> $_[0]->[0],
			purchase 		=> $_[1],
			amount 			=> $_[3]->{amount},											# DD.DD
			discount 		=> $_[3]->{discount_voucher} || undef,
			discamt 		=> $_[3]->{voucher_discount} || undef,	# percentage without '%'
			issue 			=> $_[3]->{issue_number} || undef,			# DD
			issuedate 	=> $_[3]->{start_date} || undef, 				# MMYY
			dollar 			=> $_[3]->{voucher_name} ? 'False' : undef,
	};

	$request_data->{$_[3]->{ele_option_id}} = 1 if $_[3]->{ele_option_id};

	$self->_customer_log_in($_[0]) &&
	$self->_execute_request('confirm','post',$request_data,{ action => 1 }),
	$self->_result_parser;

	return $self->result->success;
}

sub submit_document {
# 0: ele_document_id

  my $self = shift;

	$self->_admin_log_in &&
	$self->_execute_request('admin2','get',undef,{
			id 		=> $_[0],
			done 		=> 1,
			laction => 0,
			action 	=> 'submit',
		}),
	$self->_result_parser;

	return $self->result->success;
}

sub uncomplete_document {
# 0: ele_document_id

  my $self = shift;

	$self->_admin_log_in &&
	$self->_execute_request('admin2','get',undef,{
			id 		=> $_[0],
			done 		=> 1,
			laction => 0,
			action 	=> 'uncomplete',
		}),
	$self->_result_parser;

	return $self->result->success;
}

sub return_document_to_customer {
# 0: ele_document_id

  my $self = shift;

	$self->_admin_log_in &&
	$self->_execute_request('admin2','get',undef,{
			id 			=> $_[0],
			done 		=> 1,
			laction => 0,
			action 	=> 'reopen',
		}),
	$self->_result_parser;  

	return $self->result->success;
}

sub notify_customer_doc_returned {
# 0: ele_document_id
# 1: { email, subject, body }

  my $self = shift;

	$self->_admin_log_in &&
	$self->_execute_request('admin2','post',{
			email 	=> $_[1]->{email},
			subject => $_[1]->{subject},
			body 		=> $_[1]->{body}
		},{
			id 			=> $_[0],
			type 		=> 'unsubmitted',
			laction => 0,
			action 	=> 'notify',
		}),

	$self->_result_parser;

	return $self->result->success;
}

sub complete_document {
# 0: ele_document_id

  my $self = shift;

	$self->_admin_log_in &&
	$self->_execute_request('admin2','get',undef,{
			id 			=> $_[0],
			done 		=> 1,
			action 	=> 'completed',
		}),

	$self->_result_parser;

	return $self->result->success;
}

sub notify_customer_doc_completed {
# 0: ele_document_id
# 1: { email, subject, body }

  my $self = shift;

	$self->_admin_log_in &&
	$self->_execute_request('admin2','post',{
			email 	=> $_[1]->{email},
			subject => $_[1]->{subject},
			body 		=> $_[1]->{body}
		},{
			id 			=> $_[0],
			type 		=> 'completed',
			laction => 0,
			action 	=> 'notify',
		}),

	$self->_result_parser;

	return $self->result->success;
}

sub get_uploaded_documents {
# 0: ele_client_id
# 1: ele_document_id

}

sub get_flattened_document {
# 0: ele_document_id
# 1: (word||pdf)

  my $self = shift;

	$self->_admin_log_in &&
	$self->_execute_request('view','get',undef,{
			id 	=> $_[0],
			a 	=> 1,
			pdf => $_[1] eq 'pdf' && 1
		}),

	$self->_result_parser;

	return $self->result->success;	
}

sub get_templates {

  my $self = shift;

  if ($self->get_products) {
		@{$self->result->ele_response->{templates}} = grep { $_->{type} eq 'document' && delete $_->{templates} } @{$self->result->ele_response->{products}};
		delete $self->result->ele_response->{products};
	}

	return $self->result->success;
}

sub get_template_info {
# 0: ele_template_id

  my $self = shift;

  if ($self->get_product_info($_[0])) {
		delete $self->result->ele_response->{discounts};
		delete $self->result->ele_response->{options};
  }

	return $self->result->success;
}

sub get_products {

  my $self = shift;

	$self->_admin_log_in &&
	$self->_execute_request('admin2','get',undef,{
			laction => 3
		}),
	$self->_result_parser;

	return $self->result->success;
}

sub get_template_name {
# 0: ele_template_id	

  my $self = shift;

  $self->get_product_name($_[0]);

  return $self->result->success;
}

sub get_product_name {
# 0: ele_product_id

  my $self = shift;

	$self->_admin_log_in &&
	$self->_execute_request('admin2','get',undef,{
			laction => 3,
			action 	=> 'editproduct',
			id 			=> $_[0]
		}),

	$self->_result_parser;

	return $self->result->success;
}

sub get_product_info {
# 0: ele_product_id
# 1: 1 ? ignore description

  my $self = shift;

	$self->_admin_log_in &&
	$self->_execute_request('admin2','get',undef,{
			laction => 3,
			action 	=> 'editproduct',
			id 			=> $_[0]
		}),
	$self->_result_parser;

	if (!$_[1] && $self->result->success) {
		my $description = ULDE::Web::Service::WebSite::ELE->new;
		$description->get_product_description($_[0]);
		$self->result->ele_response->{description} = $description->result->{ele_response}->{description};
	}

	return $self->result->success;
}

sub get_product_description {
# 0: ele_product_id

  my $self = shift;

	$self->_admin_log_in &&
	$self->_execute_request('description','get',undef,{
			id 			=> $_[0]
		}),
	$self->_result_parser;

	return $self->result->success;
}

sub get_global_discounts {

  my $self = shift;

	$self->_admin_log_in &&
	$self->_execute_request('admin2','get',undef,{
			laction => 3,
			c 			=> 1
		}),
	$self->_result_parser;

	return $self->result->success;		
}

sub get_global_options {

  my $self = shift;

	$self->_admin_log_in &&
	$self->_execute_request('admin2','get',undef,{
			laction => 3,
			c 			=> 2
		}),
	$self->_result_parser;

	return $self->result->success;		
}

sub get_option_description {
# ele_option_id

  my $self = shift;

	$self->_admin_log_in &&
	$self->_execute_request('admin2','get',undef,{
			laction => 3,
			action	=> 'editoption',
			id 			=> $_[0]
		}),
	$self->_result_parser;

	return $self->result->success;		
}

sub get_rapidocs {
# 0: ele_template_id || ele_doc_id
# 1: [user_name,pass] || 1 (admin login) || 0

	my $self = shift;

	if (!$_[1] || ref $_[1] eq 'ARRAY') {
		(!$_[1] || $self->_customer_log_in($_[1])) &&
		$self->_execute_request('r45/assembler','get',undef,{
				action 	=> !$_[1] ? 'p' : 'm',
				id 			=> $_[0]
			}),
		$self->_result_parser;
	} else {
		$self->_admin_log_in &&
		$self->_execute_request('r45/assembler','get',undef,{
				action 	=> 'a',
				c 			=> 0,
				id 			=> $_[0]
			}),
		$self->_result_parser;
	}

	return $self->result->success;
}

1;