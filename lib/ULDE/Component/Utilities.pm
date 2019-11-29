package ULDE::Component::Utilities;

use Moose;
use namespace::autoclean;
use Text::Stripper qw(stripof);
use String::MkPasswd qw(mkpasswd);
use Data::Dumper;
use List::Util qw(max first);
use DateTime;

sub trim_text {
	my $self = shift;

	return stripof($_[0], $_[1] || 50, $_[2], $_[3], $_[4]);
}

sub generate_random_password {
	my $self = shift;

	return mkpasswd();	
}

sub return_newest_object {
# 0: [object]

	my $self = shift;

	return first { (max map { $_->id } @{$_[0]}) == $_->id } @{$_[0]};
}

sub two_decimals {
# 0: float

	my $self = shift;

	if ($_[0] =~ /^\d+$/) {
		return $_[0] . '.00';
	} elsif ($_[0] =~ /^\d+\.\d$/) {
		return $_[0] . '0';
	} elsif ($_[0] =~ /^(\d+)\.(\d\d)(\d)\d*?$/) {
		return $1 . '.' . ${$3 > 5 ? \($2 + 1) : \$2};
	} else {
		return $_[0];
	}

}

sub dumper {
	my $self = shift;

	Dumper($_[0]);	
}

sub get_todays_date {
	my $self = shift;

	DateTime->today;	
}

sub get_date_for_filename {
	my $self = shift;

	my $today = $self->get_todays_date;

	return $today->day . '-' . $today->month . '-' . $today->year;
}

sub format_date_uk {
#0: date_object

	my $self = shift;

	return join(' ', $_[0]->day, $_[0]->month_abbr, $_[0]->year);

}

sub format_time_uk {
#0: date_object

	my $self = shift;

	return join(' ', $_[0]->hour_12 . ':' . ${$_[0]->minute =~ /^\d$/ ? \'0' : \''} . $_[0]->minute, $_[0]->am_or_pm);

}
__PACKAGE__->meta->make_immutable;

1;