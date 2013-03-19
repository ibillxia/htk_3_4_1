#!/usr/bin/perl

# Bonus script to print the intersection of two word lists to standard output

# (c) Gareth Moore 2002

open(IN, "60k_wlist");
while (<IN>)
{
   $list{$_} = "1"; 
}
close(IN);

open(IN, "5k_unk.wlist");
while (<IN>)
{
    if ($list{$_} eq "1") {print;}
}
close(IN);
