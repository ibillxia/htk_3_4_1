#!/usr/bin/perl -w

# This script takes two parameters - a class map and a text file.
# It then applies the class map to the given text and sends the
# result to standard output.  It expects an unknown word token of
# !!UNK in the class map but you could trivially modify this script
# to remove this requirement or to change the string used for this
# token.

# Copyright (c) Gareth Moore 2002

use strict;
my ($curr_class);  # current class
my (%class);       # word -> class map
my ($space);       # used to not put extra space on end of line
my ($word);        # current word

if ($#ARGV < 1) {
    print "Require two parameters - class map and text file\n";
    die "Output is sent to standard out\n";
}

# Read class map
open(CMAP, $ARGV[0]);
$curr_class = 0;
while (<CMAP>) {
    if (/^(CLASS\d+)\s/) {
        $curr_class = $1;
    }
    elsif (/\s(\S+)/) {
        $class{$1} = $curr_class;
    }
}
close(CMAP);

if (!(defined($class{"!!UNK"}))) {
    die "No unknown word token found in class map\n";
}

# Map text
open(TEXT, $ARGV[1]);
while (<TEXT>) {
    $space = "";
    while (s/(\S+)//) {
        if (!(defined($class{$1}))) {
            $word = "!!UNK";
        }
        else {
            $word = $1;
        }
        if ($space) {
            print " ".$class{$word};
        }
        else {
            print $class{$word};
            $space = " ";
        }
    }
    print "\n";
}
close(TEXT);

# Done

