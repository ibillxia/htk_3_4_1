#!/usr/local/bin/perl -w
use strict;

my ($mlf, $prompt, $line, $fname, @labs, $w);

# this script makes an mlf out of a list of file names and 
# corresponding prompts - ie in the format
# fileid prompt
# fileid prompt
# "        "
# The prompts are automatically converted to upper case.


if (@ARGV != 2) {
  print "usage: $0 mlf promptlist\n\n"; 
  exit (0);
}

# read in command line arguments
($mlf, $prompt) = @ARGV;


# open MLF file
open (MLF,">$mlf") || die ("Unable to open mlf $mlf file for writing");

print "writing to mlf file $mlf\n";

print MLF ("\#\!MLF\!\#\n");
# open prompt file
open (LAB, "$prompt") || die ("Unable to open prompt file $prompt");
while ($line = <LAB>) {
  chomp ($line);
  ($fname,@labs) = split(/\s+/,$line);
  $fname =~ s/\.mfc//g;
  $fname =~ s/\.lab//g;
  print MLF ("\"$fname.lab\"\n");
  
  foreach $w (@labs) {
    printf(MLF "%s\n", $w);
  }
  print MLF (".\n");
}

close (LAB);
close(MLF);
print "writing to $mlf file done\n";
