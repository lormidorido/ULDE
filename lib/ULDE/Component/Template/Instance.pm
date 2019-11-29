package ULDE::Component::Template::Instance;

use Moose;
use namespace::autoclean;
use Data::Dumper;
use ULDE::Component::Template;
use ULDE::Component::Product::Instance;
use ULDE::Component::Customer;
use ULDE::Interface::DocumentAssembler;
use ULDE::Component::FileStorage;

extends 'ULDE::Component';

has '+resultset'			=> ( default => 'TemplateInstance' );
has '+result_object'	=> ( handles => [qw(id created foreign_id)] );

has template					=> ( is => 'rw', isa => 'ULDE::Component::Template | Int', lazy_build => 1 );
has product_instance 	=> ( is => 'rw', isa => 'ULDE::Component::Product::Instance', lazy_build => 1 );
has customer 					=> ( is => 'rw', isa => 'ULDE::Component::Customer', lazy_build => 1);
has status 						=> ( is => 'rw', isa => 'DBIx::Class::Row', lazy_build => 1 );
has name 							=> ( is => 'rw', isa => 'Str', lazy_build => 1 );
has file 							=> ( is => 'rw', isa => 'ArrayRef[ULDE::Component::FileStorage]', lazy_build => 1);
has is_trial 					=> ( is => 'rw', isa => 'Bool', lazy_build => 1 );
has is_archived 			=> ( is => 'rw', isa => 'Bool', lazy_build => 1 );
has is_signed_off 		=> ( is => 'rw', isa => 'Bool', lazy_build => 1 );

# forkable methods
around [qw(create_flattened_instance)] => sub {
	my $orig = shift;
  my $self = shift;

  $self->fork_me($orig,@_);
};

sub _build_template {
	my $self = shift; 

	ULDE::Component::Template->new({ id => $self->result_object->template->id });
}

sub _build_product_instance {
	my $self = shift; 

	ULDE::Component::Product::Instance->new({ id => $self->result_object->product_instance->id });
}

sub _build_customer {
	my $self = shift;

	ULDE::Component::Customer->new({ id => $self->result_object->customer->id });
}

sub _build_status {
	my $self = shift; 

	$self->result_object->status;
}

sub _build_name {
	my $self = shift; 

	$self->result_object->name || $self->template->name;
}

sub _build_file {
	my $self = shift; 

	[map { ULDE::Component::FileStorage->new({ id => $_->id }) } $self->result_object->files];
}

sub _build_is_trial {
	my $self = shift; 

	$self->product_instance->status->id == 1 ? 1 : 0;
}

sub _build_is_archived {
	my $self = shift; 

	$self->result_object->archived;
}

sub _build_is_signed_off {
	my $self = shift; 

	$self->result_object->signed_off;
}

sub _build_attributes {
	my $self = shift;

	$self->template($self->_build_template);
	$self->product_instance($self->_build_product_instance);
	$self->customer($self->_build_customer);
	$self->status($self->_build_status);
	$self->name($self->_build_name);
	$self->file($self->_build_file);
	$self->is_trial($self->_build_is_trial);
	$self->is_archived($self->_build_is_archived);
	$self->is_signed_off($self->_build_is_signed_off);	
}

after 'update' => sub {
# 0: columns

	my $self = shift;

	$self->name($self->_build_name) 		if exists $_[0]->{name};
	$self->status($self->_build_status) if exists $_[0]->{status};

};

sub change_status {
# 0: status_code (2 || 3 || 4 || 5)


	my $self = shift;

	# temo hack - will remov when archive method called instead
	$self->archive, return if $_[0] == 6;

	unless ($self->status->id == $_[0]) {

		if ($self->is_trial && $_[0] == 5) {
			# commit suicide - i.e. delete associated product instance if trial document instance is trial and cancelled
			# this should never be called but the remove_product_instnace method called directly so this will be commented out for now
			# $self->product_instance->customer_account->remove_product_instance($self->product_instance->id);
		} else {
			# no need to chnage status on EPOQ as we now provide a review interface
#			$self->assembler->change_document_status($self->foreign_id,$_[0],$self->status->id, 'fork');

			$self->update({ status => $_[0] });
			$self->add_activity($_[0] == 2 ? 13 : $_[0] == 3 ? 3 : $_[0] == 4 ? 5 : $_[0] == 5 ? 7 : undef);
			$self->product_instance->template_instance_status_changed;
			# temp hack - works as currently all SLs used require sign off
#			$self->create_flattened_instance('fork') if $_[0] == 4;
		}
	}
}

sub archive {
# 0: 1 ? unarchive

	my $self = shift;

	$self->update({ archived => 1 }), $self->add_activity(8) unless $_[0];	
	$self->update({ archived => 0 }) if $_[0];	
}

sub reactivate {
	my $self = shift;

	$self->archive(1), return if $self->is_archived;

	$self->update({ signed_off => 0 });

	$self->product_instance->service_level->includes_review ?
		$self->change_status(3) :
		$self->change_status(2);
}

sub sign_off {
	my $self = shift;

	$self->update({ signed_off => 1 });
	$self->create_flattened_instance('fork');
}

sub create_flattened_instance {

	my $self = shift;

	my $file_name = lc $self->template->category->name . ' (' . $self->id . ') ' . $self->utilities->get_date_for_filename . '.pdf';

	# temp hack - remov file and table entry if exists
	unlink $self->ulde_config->{'ULDE::PlatformDependent'}->{file_storage}->{path} . $file_name;
	$self->result_object->files->delete;

	$self->assembler->get_flattened_document($self->foreign_id, 'pdf');
	# this will all be moved to appropriate places later like utlitities for filename and file creation somwher else etc
	# curently overwrites exisitng files
	# also create a folder per customer account to put files in

	# this will be moved to the FileStorgae class when I got time

	open(F, '>' . $self->ulde_config->{'ULDE::PlatformDependent'}->{file_storage}->{path} . $file_name);
	print F $self->assembler->response->{doc};
	close F;

	$self->create({ files => [ { name => $file_name } ]});
}

__PACKAGE__->meta->make_immutable;


1;
