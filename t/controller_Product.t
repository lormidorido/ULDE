use strict;
use warnings;
use Test::More;


use Catalyst::Test 'ULDE::Web';
use ULDE::Web::Controller::Product;

ok( request('/product')->is_success, 'Request should succeed' );
done_testing();
