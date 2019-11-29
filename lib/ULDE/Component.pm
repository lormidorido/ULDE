package ULDE::Component;

use Moose;
use namespace::autoclean;
use Data::Dumper;
use List::Util qw(first);

extends 'ULDE';

has search_result		=> (is => 'rw', isa => 'DBIx::Class::ResultSet', handles => [qw(all count)]);
has resultset 			=> (is => 'ro', isa => 'Str', required => 1);
has result_object		=> (is => 'rw', isa => 'DBIx::Class::Row', handles => [qw(update delete)], clearer => '_clear_result_object');

has object_created 	=> (is => 'rw', isa => 'Bool', default => 0, clearer => '_clear_object_created');

has _is_constr_call	=> (is => 'rw', isa => 'Bool', lazy => 1, default => 0, init_arg => undef);

before 'search' => sub {
	my $self = shift;

	$self->_clear_result_object;
};

before 'create' => sub {
	my $self = shift;

	$self->_clear_object_created;
};

after 'create', 'retrieve', 'search' => sub {
	my $self = shift;

	# do not build attributes if called from the constructor.
	$self->_build_attributes, $self->_is_constr_call(0) if !$self->_is_constr_call && $self->can('_build_attributes') && $self->result_object;
};

before 'delete' => sub {
	my $self = shift;

	$self->_delete_related if $self->can('_delete_related');;
};

sub BUILD { 
	my $self = shift;
# print "BUILD: " . $self->resultset . " | " . join(' | ', map { $_ . " = " . $_[0]->{$_} } keys %{$_[0]}) . "\n";
	if (%{$_[0]}) {
		$self->_is_constr_call(1) if defined $_[0]->{id};
		delete $_[0]->{all} if ref $_[0] eq 'HASH' && $_[0]->{all};

		$_[0]->{id} ? $self->retrieve($_[0]->{id}) : defined $_[0]->{id} ? $self->create(@_) : $self->search(@_);
	}

}

sub create {
# 0: columns

	my $self = shift;

	# need to add error handling - what to do if creation fails

	delete $_[0]->{id};
	$self->result_object($self->ulde_schema->resultset($self->resultset)->create({ map { $_ => $_[0]->{$_} } grep { !ref $_[0]->{$_} } keys %{$_[0]} })) if first { !ref $_[0]->{$_} } keys %{$_[0]} && !$self->result_object;

	foreach my $rel (grep { ref $_[0]->{$_} } keys %{$_[0]}) {
		$self->_create_related($rel, $_[0]->{$rel}, $self->result_object);
	}

	# assume object creation always succeeds for now. Obviously need to check though when got time!
	$self->object_created(1);

	return $self->result_object if defined wantarray;
}

sub _create_related {
# 0: relation
# 1: columns
# 2: result_object

	my $self = shift;

	if (ref $_[1] eq 'HASH') {
		# belongs_to, has_many, might_have, has_one
		foreach my $columns (@${ defined $_[1]->{ROWS} ? \$_[1]->{ROWS} : \[$_[1]]}) {

			my $result_object = $columns->{RELATED_PK} ?
				# not tested (stupid really as the primary keys I am sending to find related object could just as well be put directly into relevant table!!!!)
				$_[2]->update_from_related( $_[0], $self->ulde_schema->resultset($_[2]->result_source->related_class($_[0]))->find(@{$columns->{RELATED_PK}}) ):
				$_[2]->create_related( $_[0], { map { $_ => $columns->{$_} } grep { !ref $columns->{$_} } keys %{$columns} });

			foreach (grep { ref $columns->{$_} } keys %{$columns}) {
				$self->_create_related($_, $columns->{$_}, $result_object);
			}
		}
	} else {
		# many_to_many
		foreach my $columns (@${ ref $_[1]->[0] ne 'ARRAY' ? \[$_[1]] : \$_[1]}) {

			# link existing row: format columns: @pk_values, \%link_col_data
			# create and link new row: format columns: \%col_data, \%link_col_data
			# \%link_col_data optional

			my $result_object = eval q|$_[2]->add_to_| . $_[0] . '(' . ${ !ref $columns->[0] ?
				\(q|$self->ulde_schema->resultset(join('', map { ucfirst } split('_',$_[2]->| . $_[0] . q|->result_source->name)))->find(grep { !ref } @{$columns})|) : # link existing row
				\q|{ map { $_ => $columns->[0]->{$_} } grep { !ref $columns->[0]->{$_} } keys %{$columns->[0]} }|						# create and link new row
				} . ', !ref $columns->[0] && ref $columns->[$#{$columns}] || ref $columns->[0] && @{$columns} > 1 ? { map { $_ => $columns->[$#{$columns}]->{$_} } grep { !ref $columns->[$#{$columns}]->{$_} } keys %{$columns->[$#{$columns}]} } : undef)'; # add link column data

				# link column data does not work for vakues not to be quited like booleans

			# original code for ref 1
#			my $result_object = eval q|$_[2]->add_to_| . $_[0] . '(' . ${ !ref $columns->[0] ?
#				\(q|$self->ulde_schema->resultset(join('', map { ucfirst } split('_',$_[2]->| . $_[0] . q|->result_source->name)))->find($columns->[0]),@{$columns}[1..$#{$columns}]|) : # link existing row
#				\q|{ map { $_ => $columns->[0]->{$_} } grep { !ref $columns->[0]->{$_} } keys %{$columns->[0]} },@{$columns}[1..$#{$columns}]|						# create and link new row
#				} . ')';

			# check if any relationships in link column data - FUCK THIS!
			# I NEED TO GET THE LINK RESULT OBJECT!
#			if (ref $columns->[$#{$columns}]) {
#				foreach (grep { ref $columns->[$#{$columns}]->{$_} } keys %{$columns->[$#{$columns}]}) {
#					$self->_create_related($_, $columns->[$#{$columns}]->{$_}->{ROWS}, $self->_find_related([$columns->[$#{$columns}]->{$_}->{LINK_RELATION}], $_[2]);
#				}					
#			}

			next unless ref $columns->[0];
			# check if any relationships in column data
			foreach (grep { ref $columns->[0]->{$_} } keys %{$columns->[0]}) {
				$self->_create_related($_, $columns->[0]->{$_}, $result_object);
			}			
		}
	}
}

sub search {
# 0: search parameters 

	my $self = shift;

	$self->search_result($self->ulde_schema->resultset($self->resultset)->search_rs(shift));
  $self->result_object($self->search_result->first) if $self->count;

	if (defined (my $context = wantarray)) {
		return $context ? $self->search_result->all : $self->search_result;
	}
}

sub search_related {
# 0: relation
# 1: search parameters

	my $self = shift;

	return undef unless defined $self->result_object;

	return $self->result_object->search_related(@_);
}

sub _find_related {
# 0: [[relation, primary key]]
# 1: result_object (optional)

	my $self = shift;

	return undef unless defined $self->result_object || $_[1];

	my $related_object;
	foreach (@${!ref $_[0]->[0] ? \[$_[0]] : \$_[0]}) {
		$related_object = $related_object ? $related_object->find_related($_->[0],$_->[1]) : $_[1] ? $_[1]->find_related($_->[0],$_->[1]) : $self->result_object->find_related($_->[0],$_->[1]);
	}

	return $related_object;
}

sub retrieve {
# 0: id

	my $self = shift;

	# do not fetch result_object if already present
	if (defined $self->result_object && $self->result_object->id == $_[0]) {
		return defined wantarray ? $self->result_object : undef;		
	}

  # this will always call "search" in child class
  $self->search({id => $_[0]});

	return $self->result_object if defined wantarray;
}

sub refresh {

	my $self = shift;
	$self->_build_attributes
}

__PACKAGE__->meta->make_immutable;

1; 