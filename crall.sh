#!/bin/bash
# For CS1010 Students: To link the CS1010 library and run all test cases.
# If all test cases pass, there is no output.
# If some cases fail, the difference in output is printed out. 
# Remember to enable execution permissions before using the script. (e.g chmod 700 rall.sh)
# Usage: ./cecr.sh ex1.c test

set -e

sourcename=$1
binname="${sourcename%.*}"
testprefix=$2

echo "Compiling source file $sourcename to $binname"

clang -I../libcs1010/include -L../libcs1010/lib $sourcename -lcs1010


i=0
while
	((i++))
	testinfile="input/$testprefix$i.in"
	[ -f $testinfile ]
do
	echo "Running test $testinfile"
	outfile="david$i.out"
	./a.out < $testinfile > $outfile
	diff $outfile "output/$testprefix$i.out"
done

echo "Test $testprefix$i.in not found"