#!/usr/bin/perl
use warnings;
use strict;

use Socket;
use Sys::Hostname;

# Get IP address of the primary network interface
my $ipaddr = inet_ntoa(scalar gethostbyname(hostname()));
print "$ipaddr\n\n";

# Get IP addresses of all network interfaces
my @ipaddrs = ();
my ($name,$aliases,$addrtype,$length,@addrs) = gethostbyname('localhost +');
foreach my $addr (@addrs) {
	push(@ipaddrs, join('.', unpack('C4', $addr)));
}
($name,$aliases,$addrtype,$length,@addrs) = gethostbyname($name);
foreach my $addr (@addrs) {
	push(@ipaddrs, join('.', unpack('C4', $addr)));
}
foreach my $ip (@ipaddrs) { print $ip, "\n"; }

print "Program done. Exiting...";

exit;