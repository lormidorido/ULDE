use strict;
use warnings;
use Test::More;


use Catalyst::Test 'ULDE::Web';
use ULDE::Web::Controller::Account;

ok( request('/account')->is_success, 'Request should succeed' );
done_testing();
