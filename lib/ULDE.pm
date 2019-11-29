package ULDE;

use Moose;
use namespace::autoclean;
use MooseX::ClassAttribute;
use ULDE::Config;
use ULDE::Schema::ULDE;
use ULDE::Component::Utilities;
use ULDE::Component::Activity;
use ULDE::Interface::DocumentAssembler;

class_has 'ulde_config'				=> (is => 'ro', isa => 'HashRef', lazy_build => 1);
class_has 'ulde_schema' 			=> (is => 'ro', isa => 'ULDE::Schema::ULDE', lazy_build => 1);
class_has 'activity_handler' 	=> (is => 'ro', isa => 'ULDE::Component::Activity', lazy_build => 1, handles => { add_activity => 'add' } );

class_has 'utilities'		=> (is => 'ro', isa => 'ULDE::Component::Utilities', lazy_build => 1, handles => [qw(trim_text generate_random_password return_newest_object two_decimals dumper get_date_for_filename get_todays_date format_date_uk format_time_uk)]);

has 'assembler' 				=> (is => 'ro', isa => 'ULDE::Interface::DocumentAssembler', lazy_build => 1);

has is_forked 					=> (is => 'rw', isa => 'Bool', lazy => 1, default => 0);

has obj_type 						=> (is => 'rw', isa => 'Str', lazy => 1, default => sub { my $self = shift; ref $self });

sub _build_utilities {
	my $self = shift;

	ULDE::Component::Utilities->new;
}

sub _build_ulde_schema {
	my $self = shift;

	ULDE::Schema::ULDE->connect( $self->ulde_config->{'Model::DB::ULDE'}->{connect_info} );
}

sub _build_ulde_config {
	my $self = shift;

	ULDE::Config->new->as_hash;
}

sub _build_assembler {
	my $self = shift;

	ULDE::Interface::DocumentAssembler->new;
}

sub _build_activity_handler {
	my $self = shift;

	ULDE::Component::Activity->new;
}

around 'add_activity' => sub {
	my $orig = shift;
	my $self = shift;

	$self->$orig({ 	${ 
										$self->obj_type =~ /Template::Instance/ ? \'template_instance_id' : 
										$self->obj_type =~ /Product::Instance/ 	? \'product_instance_id'	:
										undef
									}
									=> $self->id }, @_);
};

sub fork_me {
	my $self = shift;
  my $orig = shift;

  if (scalar @_ && defined $_[$#_] && !ref $_[$#_] && $_[$#_] eq 'fork') {
  	$self->is_forked(1);
  	my $pid = fork();
  	if ($pid == 0) {
  		$self->$orig(@_[0..$#_-1]);
  		exit 0;
  	}
	} else {
		$self->$orig(@_);
	}
}

__PACKAGE__->meta->make_immutable;

1;