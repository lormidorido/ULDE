package ULDE::Interface::DocumentAssembler;

use Moose;
use namespace::autoclean;
use Data::Dumper;
use ULDE::Config;
use ULDE::Web::Service::WebSite::ELE;

extends 'ULDE::Interface';

has assembler => ( is => 'ro', isa => 'Object', lazy_build => 1, handles => [qw(
	create_quick_account
	create_account
	get_assembler_url
	get_login_url
	get_clients
	update_account
	get_account_details
	get_account_password
	change_account_password
	get_session_cookie
	create_document
	get_document_status
	rename_document
	delete_document
	get_client_documents
	purchase_product
	submit_document
	return_document_to_customer
	complete_document
	uncomplete_document
	notify_customer_doc_returned
	get_uploaded_documents
	get_flattened_document
	get_templates
	get_template_info
	get_products
	get_product_info
	get_product_name
	get_template_name
	get_global_discounts
	get_global_options
	get_option_description
	get_rapidocs
	response
	success
	http_response
	refresh_session_cookies
)]);

# forkable methods
around qr/^(create|get|update|change|delete|rename|purchase|submit|return|complete|uncomplete|notify|refresh_session_cookies)/ => sub {
	my $orig = shift;
  my $self = shift;

  $self->fork_me($orig,@_);
};

sub _build_assembler {

	my $self = shift;

	my $assembler_paramaters 													= $self->ulde_config->{'ULDE::Interface::DocumentAssembler'}->{admin_login};
	$assembler_paramaters->{cookie_jar_storage_path}	= $self->ulde_config->{'ULDE::Interface::DocumentAssembler'}->{cookie_jar_storage_path};

	ULDE::Web::Service::WebSite::ELE->new($assembler_paramaters);

}

sub change_document_status {
# 0: ele_document_id
# 1: status_code
# 2: current status_code

	my $self = shift;

	if ($_[1] == 2) {
		# change to active
		$self->uncomplete_document($_[0]) if $_[2] == 4;
		$self->return_document_to_customer($_[0]);
	} elsif ($_[1] == 3) {
		# change to review
		$self->submit_document($_[0]) if $_[2] == 2;
		$self->uncomplete_document($_[0]) if $_[2] == 4;
	} elsif ($_[1] == 4) {
		# change to completed
		$self->submit_document($_[0]) if $_[2] == 2;
		$self->complete_document($_[0]);
	}
}

__PACKAGE__->meta->make_immutable;

1;