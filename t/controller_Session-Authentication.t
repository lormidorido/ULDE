use strict;
use warnings;
use Test::More;


use Catalyst::Test 'ULDE::Web';
use ULDE::Web::Controller::Session::Authentication;

ok( request('/session/authentication')->is_success, 'Request should succeed' );
done_testing();
