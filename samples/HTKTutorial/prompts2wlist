#!/usr/local/bin/perl -w
use strict;

my ($prompts, $wlist, $line, @line_array, $w, %words, @word_list);

# check usage
if (@ARGV != 2) {
  print "usage: $0 prompts wordlist\n\n"; 
  exit (0);
}

# read in command line arguments
($prompts, $wlist) = @ARGV;

# open files
open (PROMPTS,"$prompts") || die ("Unable to open prompts $prompts file for reading");
open (WLIST,">$wlist") || die ("Unable to open word list $wlist file for writing");

# process each prompt one at a time
while ($line = <PROMPTS>) {
  chomp ($line);
  @line_array=split(/\s+/, $line);
  shift (@line_array);  # discard fileID
  
  foreach $w (@line_array)  {
    $words{$w} = 1;
  }
}

# put the words in order
@word_list = sort (keys (%words));

#and finally write out to word list file
foreach $w (@word_list) {
  printf(WLIST "%s\n", $w);
}

close(WLIST);
close(PROMPTS);
