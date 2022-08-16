#!/usr/bin/perl

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../lib";


# use this block if you don't need middleware, and only have a single target Dancer app to run here
use Timer;

Timer->to_app;

=begin comment
# use this block if you want to include middleware such as Plack::Middleware::Deflater

use Timer;
use Plack::Builder;

builder {
    enable 'Deflater';
    Timer->to_app;
}

=end comment

=cut

=begin comment
# use this block if you want to mount several applications on different path

use Timer;
use Timer_admin;

use Plack::Builder;

builder {
    mount '/'      => Timer->to_app;
    mount '/admin'      => Timer_admin->to_app;
}

=end comment

=cut

