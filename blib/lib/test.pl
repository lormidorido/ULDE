#!/usr/bin/perl

BEGIN {
  push(@INC,'/home/ulde/ULDE/lib/ULDE');
}

use ULDE::Web::Service::WebSite::ELE;
use ULDE::Web::Service::REST::ELE;
use ULDE::Web::Service::REST::Client;

#my $t = ULDE::Web::Service::REST::ELE->new;

#my $con = ULDE::Web::Service::WebSite::ELE;
#$con->create_account('asdf','aaaaaa');

my $tt = ULDE::Web::Service::REST::Client;
print $tt->{user_agent} . "\n";
