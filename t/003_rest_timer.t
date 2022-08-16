use strict;
use warnings;

use Timer;
use Test::More;
use Plack::Test;
use HTTP::Request::Common;
use Ref::Util qw<is_coderef>;

my $app = Timer->to_app;
ok( is_coderef($app), 'Got app' );

my $test = Plack::Test->create($app);

my %method = (
  POST => \&POST,
  GET  => \&GET,
);

for (['POST', '/timer'], ['GET', '/timer'], ['GET', '/timer/foo']) {
  my $res  = $test->request( $method{$_->[0]}->($_->[1]) );
  ok( $res->is_success, "([@$_] successful" );

  diag $res->content;
}

done_testing;
