#!/bin/perl

my @arr = ("zhao", "zuozi", "zoo");
foreach (@arr) {
	s/z/Z/
};
print (@arr, "\n");

my $name = "su yuntian";
$name =~ s/yuntian/xiaoxiao/;
print ($name, "\n");