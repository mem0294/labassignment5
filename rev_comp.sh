#! /bin/bash

#Sanity Check: Make sure a single file is given at command line; provide usage statement
if [ $# -lt 1 ] || [ $# -gt 1 ];then
echo "Usage: Please provide a single FASTA file at the command line"
exit
fi

#initialize variable
reverse=""

#read in data
name=`grep ">" $1`
sequence=`grep -v ">" $1`

echo "Name: $name"

#reverse and complement the contents of sequence variable
rc=`echo $sequence|rev | tr 'ATCGatcg' 'TAGCtagc'`

echo $name >rc.$1
echo $rc >>rc.$1
#
