#!/bin/perl

my @arr = ("a", "b", "c");
my @new_arr = grep {$_ =~ /a|b/} @arr;
print (@new_arr, "\n");
