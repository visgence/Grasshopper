#!/usr/bin/perl

use strict;
#system includes
use File::Spec;

#This script could be called from cron, so we need to find it's 
#path to make it portable
my $APP_PATH;

BEGIN
{
        $APP_PATH = File::Spec->rel2abs($0);
            (undef, $APP_PATH, undef) = File::Spec->splitpath($APP_PATH);
            
}

use lib "$APP_PATH/../lib";
use lib "$APP_PATH/../lib/drivers";


#local includes
use GrasshopperConfig;
use GrasshopperAPI;
use PrintToSocket;
use Logger;
use HostTree;
use GenericSwitch64;

my $title = GrasshopperConfig::get_config_element("WEB_PAGE_TITLE");
print "Title: $title\n";

my $hostname = lc $ARGV[0];
my $group = "tmp";

print "Using GenericSwitch64 driver to poll $hostname\n";
my $result = GenericSwitch64::poll($hostname, $group);
print "Result: $result\n";