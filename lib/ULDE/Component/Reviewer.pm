package ULDE::Component::Reviewer;

use Moose;
use namespace::autoclean;
use List::Util qw(any first);
use ULDE::Component::ReviewServiceResponsibility::Reviewer;
use ULDE::Component::Product::Instance;
use ULDE::Component::Customer;
use ULDE::Component::Code;
# use ULDE::Component::Reviewer;

extends 'ULDE::Component';

has '+resultset'			=> ( default => 'Reviewer' );
has '+result_object'	=> ( handles => [qw(id created status user_name password first_name surname title email)] );

# when I got time need to create ULDE::Component::ReviewServiceResponsibility::Reviewer to get many-to-many relaiton attribute
has responsibility 		=> ( is => 'rw', isa => 'ArrayRef[ULDE::Component::ReviewServiceResponsibility::Reviewer]', lazy_build => 1 );
has product_instance 	=> ( is => 'rw', isa => 'ArrayRef[ULDE::Component::Product::Instance]', lazy_build => 1 );
has review_service 		=> ( is => 'rw', isa => 'ArrayRef[DBIx::Class::Row]', lazy_build => 1 );
has junior_reviewer 	=> ( is => 'rw', isa => 'ArrayRef[ULDE::Component::Reviewer]', lazy_build => 1 );
has customer 					=> ( is => 'rw', isa => 'ArrayRef[ULDE::Component::Customer]', lazy_build => 1 );
has registration_code => ( is => 'rw', isa => 'ULDE::Component::Code | Bool | Str', lazy_build => 1 );
has salutation 				=> ( is => 'rw', isa => 'Str', lazy_build => 1 );
has initials 					=> ( is => 'rw', isa => 'ArrayRef[Str]', lazy_build => 1 );	


around BUILDARGS => sub {
	my $orig  = shift;
  my $class = shift;

  return $class->$orig(@_) if !$_[0]->{registration_code} || $_[0]->{registration_code} =~ /^\d+$/;

  my $code_obj = ULDE::Component::Code->new({ code => $_[0]->{registration_code} });
  $_[0]->{registration_code} = $code_obj->count ? $code_obj->id : undef;

  return $class->$orig(@_);
};

sub _build_responsibility {
	my $self = shift; 

	[map { ULDE::Component::ReviewServiceResponsibility::Reviewer->new({ reviewer => $self->id, responsibility => $_->id }) } $self->result_object->responsibilities];
}

sub _build_product_instance {
	my $self = shift; 

	# list products that are associated with responsibility && customers associated with self
	[grep { any { do { my $customer_id = $_->customer->id; any { $customer_id == $_->id } @{$self->customer} } } @{$_->template_instance} } map { @{$_->product_instance} } @{$self->responsibility}];
}

sub _build_review_service {
	my $self = shift;

	[map { $_->review_service } do { my %seen; grep { !$seen{$_->review_service->id}++ } @{$self->responsibility} }];
}

sub _build_junior_reviewer {
	my $self = shift;

	[map { ULDE::Component::Reviewer->new({ id => $_->reviewer->id }) } do { my %seen; grep { !$seen{$_->reviewer->id}++ } $self->result_object->reviewer_responsibility_senior_reviewers }];
}

sub _build_customer {
	my $self = shift; 

	# return customers created by self && 
	# customers created by associated juniors that have one product or more associated with responsibility senior for && 
	# customers linked to responsibilities that registered themselves online

	[do { my %seen; grep { !$seen{$_->id}++ }	( grep { first { $self->get_review_responsibility($_->id) } @{$_->account->product} } map { @{$_->get_customers_created} } @{$self->junior_reviewer} ),
																						( map { ULDE::Component::Customer->new({ id => $_->id }) } $self->result_object->customers, grep { !$_->created_by } map { @{$_->customer} } @{$self->responsibility} )}];
}

sub _build_registration_code {
	my $self = shift;

	$self->result_object->registration_code ? ULDE::Component::Code->new({ id => $self->result_object->registration_code->id }) : undef;
}

sub _build_salutation {

	my $self = shift; 

	$self->surname ? ${$self->title ? \($self->title . ' ') : \''} . join(' ', @{$self->initials}) . ' ' . ucfirst lc $self->surname : ''
}

sub _build_initials {
	my $self = shift; 

	$self->first_name ? [map { uc substr $_, 0 , 1 } split(/\s+/, $self->first_name)] : [];
}

sub _build_attributes {
	my $self = shift;

	$self->responsibility($self->_build_responsibility);
	$self->product_instance($self->_build_product_instance);
	$self->review_service($self->_build_review_service);
	$self->junior_reviewer($self->_build_junior_reviewer);
	$self->customer($self->_build_customer);
	$self->registration_code($self->_build_registration_code);
	$self->salutation($self->_build_salutation);
	$self->initials($self->_build_initials);
}

sub get_review_responsibility {
# 0: product_instance_id

	my $self = shift;
 
	first { any { $_->id == $_[0] } @{$_->product_instance} } @{$self->responsibility};
}

sub add_review_responsibility {
# 0: [responsibility_obj]

	my $self = shift;


	# ULDE::Component does not work for adding link table data hence the foreach loop and not using the many-to-,any relation
#	$self->create({ responsibilities => [ map { [$_->id] ,{ primary => $_->primary, senior_reviewer =>  } } @{$_[0]} ] });

	# also, cannot add boolean value as data in a related table!!!!!! really need to update ULDE::Component! currenty assume one review reviewe responsibility and is primary (primary defaults to true in table def)
	foreach (@{$_[0]}) {
		my $senior_reviewer = ULDE::Component::Reviewer->new({ registration_code => $_->senior_reviewer_code->id }) if $_->senior_reviewer_code;
		$self->create({ reviewer_responsibilities => { responsibility => $_->id, senior_reviewer => $senior_reviewer ? $senior_reviewer->id : undef  } });
	}
}

sub add_review_role {
# 0: [role_obj]

	my $self = shift;

	return unless @{$_[0]};

	$self->create({ roles => [ map { [$_->id] } @{$_[0]} ] });
}

sub get_primary_responsibility {

	my $self = shift;

	return $self->result_object->reviewer_responsibilities->count ? ULDE::Component::ReviewServiceResponsibility->new({ id => (first { $_->primary } $self->result_object->reviewer_responsibilities)->responsibility->id }) : undef;
}

sub associate_customer {
# 0: customer_id

	my $self = shift;

	$self->create({ reviewer_customers => { customer => $_[0]} });	
}

sub process_registration_code {

	my $self = shift;

	$self->registration_code($self->_build_registration_code);

	return unless $self->registration_code;

	$self->add_review_responsibility($self->registration_code->responsibility);
	$self->add_review_role($self->registration_code->role);
}

sub get_customers_created {

	my $self = shift;

	[map { ULDE::Component::Customer->new({ id => $_->id }) } $self->result_object->customers];
}

__PACKAGE__->meta->make_immutable;

1;
