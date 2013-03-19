#!/usr/bin/perl
#
# make a .hed script to clone monophones in a phone list 
# 
# rachel morton 6.12.96


if (@ARGV != 2) {
  print "usage: makehed monolist trilist\n\n"; 
  exit (0);
}

($monolist, $trilist) = @ARGV;

# open .hed script
open(MONO, "@ARGV[0]");


# open .hed script
open(HED, ">mktri.hed");

print HED "CL $trilist\n";

# 
while ($phone = <MONO>) {
       chop($phone);
       if ($phone ne "") { 
	   print HED "TI T_$phone {(*-$phone+*,$phone+*,*-$phone).transP}\n";
       }
   }
