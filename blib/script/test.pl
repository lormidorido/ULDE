#!/usr/bin/perl

eval 'exec /usr/bin/perl  -S $0 ${1+"$@"}'
    if 0; # not running under some shell

BEGIN {
  push(@INC,'/home/ulde/ULDE/lib');
}

use ULDE::Web::Service::WebSite::ELE;
#use ULDE::Web::Service::REST::ELE;
#use ULDE::Web::Service::REST::Client;

#my $t = ULDE::Web::Service::REST::ELE->new;

my $con = ULDE::Web::Service::WebSite::ELE->new;
$con->create_account('ceci@signal.bz','bra4hund');
#print $con-> . "\n";

