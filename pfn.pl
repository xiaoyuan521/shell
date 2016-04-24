#!/bin/perl

sub add{
	$_[0] + $_[1];
}


my $sum2 = 0;
sub addAll {
	foreach $_(@_){
		$sum2 += $_;
	}
}

addAll(1,2,3,4);
print("sum is $sum2", "\n");

# my $sum = add(1,2);
# print("sum: $sum");

my @arr = ("a", "b", "c");
foreach $tmp (@arr) {
	print($tmp, "\n");
}
