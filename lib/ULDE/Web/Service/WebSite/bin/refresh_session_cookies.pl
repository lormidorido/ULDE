#!/usr/bin/perl

BEGIN {
  push(@INC,'/var/www/html/uklo/ulde/lib');
}

use ULDE::Interface::DocumentAssembler;
use DateTime;

DateTime->now()->hour;

my $assembler = ULDE::Interface::DocumentAssembler->new;

if (1 || DateTime->now()->hour == 5 || DateTime->now()->hour == 11 || DateTime->now()->hour == 17 || DateTime->now()->hour == 23) {
  $assembler->refresh_session_cookies(['ragnar@signal.bz','bbggttrr']);
  `chown uklo:apache /var/www/html/uklo/ulde/lib/ULDE/Web/Service/WebSite//ELE/CookieJarStorage/*`;
  `chmod 664 /var/www/html/uklo/ulde/lib/ULDE/Web/Service/WebSite//ELE/CookieJarStorage/*`;
} else {
  $assembler->get_client_documents(['ragnar@signal.bz','bbggttrr']);
  $assembler->get_account_password(8376);
}

1;
