use strict;
use warnings;
use Test::More;


use Catalyst::Test 'ULDE::Web';
use ULDE::Web::Controller::Session::Management;

ok( request('/session/management')->is_success, 'Request should succeed' );
done_testing();
