use strict;
use warnings;
use Test::More;

BEGIN { use_ok 'Catalyst::Test', 'OAD' }
BEGIN { use_ok 'OAD::Controller::Geo::GeoNames' }

ok( request('/geo/geonames')->is_success, 'Request should succeed' );
done_testing();
