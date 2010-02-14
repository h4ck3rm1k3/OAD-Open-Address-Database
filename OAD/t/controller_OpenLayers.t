use strict;
use warnings;
use Test::More tests => 3;

BEGIN { use_ok 'Catalyst::Test', 'OAD' }
BEGIN { use_ok 'OAD::Controller::OpenLayers' }

ok( request('/openlayers')->is_success, 'Request should succeed' );


