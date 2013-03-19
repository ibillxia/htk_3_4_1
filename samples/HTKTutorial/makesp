#!/usr/bin/perl

 if (@ARGV[0] eq "") {
   print "usage: makesp MMF\n";
   exit(0);
 }

 $okprint = "FALSE";
 $silprint = "FALSE";

 unless (open(FILE, "@ARGV[0]")) {
   die ("can't open @ARGV[0]");
 }

 while ($line = <FILE>) {
  chop ($line);


 if ($line =~ /STREAMINFO/) {
   $streaminfo = $line;
 }

 if ($line =~ /VECSIZE/) {
   $vecsize = $line;
 }

 if ($line =~ /"sil"/) {
   $okprint = "TRUE";
   print "~h \"sp\"\n";
   print "<BEGINHMM>\n";
   print "<NUMSTATES> 3\n";
   print "<STATE> 2\n";
 }

 if ($okprint eq "TRUE" && ($line =~ /<STATE> 3/)) {
   $silprint = "TRUE";
   $line = <FILE>;
   chop ($line);
 } 

 if ($okprint eq "TRUE" && ($line =~ /<STATE> 4/)) {
   $silprint = "FALSE";
 } 

 if ($okprint eq "TRUE" && ($line =~ /TRANSP/)) {
   $silprint = "FALSE";
   print "<TRANSP> 3\n";
   print " 0.000000e+00 5.000000e-01 5.000000e-01\n";
   print " 0.000000e+00 5.000000e-01 5.000000e-01\n";
   print " 0.000000e+00 0.000000e+00 0.000000e+00\n";
 } 

 if ($okprint eq "TRUE" && ($line =~ /ENDHMM/)) {
     print "$line\n";
   $silprint = "FALSE";
   $okprint = "FALSE";
 } 


 if ($silprint eq "TRUE") {
    print "$line\n";
 }

}
