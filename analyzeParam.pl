#!/usr/bin/perl
use strict;
use warnings;
use JSON 'decode_json';
use Data::Dumper;

my $file = $ARGV[0];
open (my $fh, "<", $file)
  or die "can't open $file";
my $data;
my %count;
my $i = 0;
while (my $line = readline $fh) {
  chomp $line;
  $data = decode_json($line);
  $count{$data->{$ARGV[1]}} += 1;
  $i++;
}

print "[result]\n";
print $ARGV[1], "\tcount\n";
my $tmp;
foreach $tmp (sort {$count{$b} <=> $count{$a}} keys %count) {
  print $tmp, "\t", $count{$tmp}, "\n"
}

close $fh;
