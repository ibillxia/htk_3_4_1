#!/usr/local/bin/perl

#  generate an HHEd script file for state-clustering triphones
#   
#  usage: mkclscript.prl command threshold monophone_list
#
#  where monophone_list is a HMM list for the phones (not triphones) 
#        to be clustered
#
# Script generates a specified command and threhold for a cluster
# corresponding to each states of each phone. 
# The script assumes each model has 3 emitting states.
#
# Copyright (c) Phil Woodland, 1993
# Last Updated 5/9/95
#
# convert to perl by TL 7/1998
#

if ( $#ARGV != 2 ) {
   die "usage: mkclscript.prl command threshold monophone_list\n";
}

$command = $ARGV[0];
$threshold = $ARGV[1];

$hmmlist=$ARGV[2];
if (! -f $hmmlist) {
   die "mkclscript: monophone HMM list $hmmlist not found\n";
}

open(HMMLIST,"<$hmmlist") or die "Can't open file $hmmlist\n";
while(<HMMLIST>) {
	chop;
	print "$command $threshold \"ST_$_"."_2_\" {(\"$_\",\"*-$_\+*\",\"$_\+*\",\"*-$_\").state[2]}\n";
}

open(HMMLIST,"<$hmmlist") or die "Can't open file $hmmlist\n";
while(<HMMLIST>) {
	chop;
	print "$command $threshold \"ST_$_"."_3_\" {(\"$_\",\"*-$_\+*\",\"$_\+*\",\"*-$_\").state[3]}\n";
}

open(HMMLIST,"<$hmmlist") or die "Can't open file $hmmlist\n";
while(<HMMLIST>) {
	chop;
	print "$command $threshold \"ST_$_"."_4_\" {(\"$_\",\"*-$_\+*\",\"$_\+*\",\"*-$_\").state[4]}\n";
}

close (HMMLIST);
