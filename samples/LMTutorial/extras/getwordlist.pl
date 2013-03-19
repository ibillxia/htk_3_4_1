#!/usr/bin/perl

# This little script will extract the full word list from any ARPA type language model

# Pass language model as a parameter or on standard in; results are written to standard output

# (c) Gareth Moore 2002

while (<>)
{
    if (/\\2-grams/) {exit;}
    if (/^\-*\d+\.\d+\s+(\S+)\s/) {print $1."\n"};
}
