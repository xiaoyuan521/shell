#!/bin/perl
# print ("hello world ~ \n");

# my $name = "zhaohs";
# my $age = 33;
# my $a = 1;
# my $b = 9;
# my $sum = $a + $b;

# print ("my name is $name, age is $age, sum is $sum \n");

# my @arr = (1,2,3,4);
# print (@arr, "  ", @arr[3], "\n");

# my %h = (
# 	"name" => "zzz",
# 	"age" => 34
# );
# print(%h->{"name"}, "\n");

# my $hp = \%h;
# my $arrp = \@arr;
# my $vp = \$name;
# print($hp -> {"age"}, " ", $$vp, " ", $arrp -> [0], "\n");

# my $name = "zhaohs";
# my $str = qq(hello, wor"ld from $name);
# print ($str);

# my $name2 = qq{nihao};
# print ($name2);


##  tr为 transform， 位置对应替换
print "---\n";
$abc="zhaohs";
$abc=~tr/a-z/A-Z/;
print $abc;
print "\n";

## s 为替换，与replace类似
print "---\n";
$aaa="zhaohs";
$aaa=~s/z/chen/;
print $aaa;
print "\n";