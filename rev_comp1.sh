#! /bin/sh

# Make sure a single file is given at command line; provide usage $
if [ $# -lt 1 ] || [ $# -gt 1 ];then
echo "Error: Please provide a single FASTA file at the command line"
exit
fi

#created variable reverse
reverse=""

#read in data
name=`grep ">" $1`
sequence=`grep -v ">" $1`

echo "Name: $name"

#removed sanity check noted by SC
#SC calculate length of sequence
#SC len=${#sequence}
#SC echo "Length: $len"

#SC removed loop
#SC loop through sequence in reverse
#SC for (( i=$len; i>=0; i-- ))
#SC do
#SC    reverse="$reverse${sequence:$i:1}"
#SC done

#SC echo "$sequence$reverse"

#removed old code
#SC complement sequence
#SC rc=`echo $reverse | tr 'atcg' 'tagc'`

#SC echo "$rc"

#reverse and complement the contents of sequence variable
#tr is translating all input into upper and lowercase applicaple
rc=`echo $sequence|rev | tr [:alpha:] 'ATCG' 'TAGC'`
echo $name >rc.$1
echo $rc >>rc.$1
