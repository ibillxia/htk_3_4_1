#!/usr/bin/perl -w
# You may need to change the path on the above line

# Under Windows run it like this:
#  perl LCond.pl in_file > out_file
# (you will need to have installed a Perl interpreter, such as the
#  one you can freely download from http://www.activestate.com/)

# Simple text conditioning script
# DO NOT USE THIS SCRIPT IN AN EVALUATION SYSTEM!
# It makes lots of obvious mistakes and is included for
#  example purposes only.  It doesn't know that $12 should
#  be written as 12 DOLLARS or TWELVE DOLLARS, not just 12,
#  or that "Dr. Paul" is not "<s> DR </s> <s> PAUL </s>"

# What it DOES do is convert lowercase to uppercase and surround
#  sentences with <s> and </s> start/end tags.  It tries to be
#  vaguely intelligent with puncuation, so "This is 'okay,' I test-case our's!"
#  becomes "<s> THIS IS OKAY I TEST-CASE OUR'S </s>"

# Copyright (c) Gareth Moore 2002

use strict;

my($line)=""; # current input line
my($cond)=""; # conditioned line
my($punc)=1;  # punctuation found?
my($inc)=0;   # blank line count

while (<>)
{
  tr/a-z/A-Z/;   # Convert to uppercase
  s/%%NS%%//;    # Make sure no tag strings present

  s/--/ -- /g;  ## This line is to improve the tutorial example (Tom Brown's Schooldays)

  $line = $_;


  ## Remove this next bit to not count multiple blank lines as sentence end  
  if (!($line =~ /[\d\w]/)) {
    $inc++;  # Count blank lines
    if (($inc>1) && ($cond ne ""))
    {
      print "<s>$cond </s>\n";
      $cond = "";
      $inc = 0;
    }
  }
  ## Remove up to here

  # Loop whilst we still have alphanumeric characters left on line
  while ($line =~ /[\d\w]/) {
  
    $line =~ s/^[\s-]+//;   # Strip leading whitespace
  
    # Whilst there are any alphanumeric characters left
    #  and whilst the string doesn't start with terminating punctation
    while (!($line =~ s/(^[^\d\w,"'<>\[\]\(\)\+\*\-]+)/%%NS%%/) && $line =~ /[\d\w]/) {
       $line =~ s/^[,"'<>\[\]\(\)\+\*\-]+//;
       $line =~ s/([\d\w'][\d\w'-]*)//;  # Find next alphanumeric string
       $cond = "$cond $1";
       $line =~ s/^[\s-]+//;
    }
 
    if ($line =~ s/^%%NS%%// && $cond ne "") {
      print "<s>$cond </s>\n";    # Write out sentence
      $cond = ""; 
    }    
  }
}
if ($cond ne "") {
  print "<s>$cond </s>\n";
}

# Done
