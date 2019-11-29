package ULDE::Component::Product;

use namespace::autoclean;
use Moose;

has 'name'		=> (is => 'rw', isa => 'Str', required => 1, lazy => 1, builder => '_build_name');
# has 'id'		=> (is => 'ro', isa => 'Int', required => 1, lazy => 1, builder => '_build_id', trigger => \&);
has 'business'	=> (is => 'rw', isa => 'Bool', required => 1, lazy => 1, builder => '_build_business');
has 'personal'	=> (is => 'rw', isa => 'Bool', required => 1, lazy => 1, builder => '_build_personal');
has 'area'		=> (is => 'rw', isa => 'Str', required => 1, lazy => 1, builder => '_build_area');
has 'category'	=> (is => 'rw', isa => 'Str', required => 1, lazy => 1, builder => '_build_category');



sub read {
	
}

sub create {
	
}

sub update {
	
}

sub delete {
	
}

1;
