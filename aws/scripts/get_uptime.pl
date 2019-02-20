#!/usr/bin/perl

use strict;

my $seconds = shift;
my $string  = sprintf "%02d::%02d::%02d::%02d", (gmtime($seconds))[7,2,1,0];

# days [0] :: hours [1] :: mins [2] :: seconds [3]
my @ups = split(/::/, $string);

my $return_uptime = "";

my $i = 0;
for (@ups) { $ups[$i] =~ s/^0//g; $i++; } 

$return_uptime .= "$ups[0] days "    if $ups[0] != 0;
$return_uptime .= "$ups[1] hours "   if $ups[1] != 0;
$return_uptime .= "$ups[2] minutes " if $ups[2] != 0;
# $return_uptime .= "$ups[3] seconds"  if $ups[3] != 0;

print "$return_uptime\n";
