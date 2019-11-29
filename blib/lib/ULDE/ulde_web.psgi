use strict;
use warnings;

use ULDE::Web;

my $app = ULDE::Web->apply_default_middlewares(ULDE::Web->psgi_app);
$app;

