#!/bin/bash
# Compiles source and executes test cases
# Usage: rall.sh <source file name> <test case prefix name>
# Remember to give permissions i.e chmod u+x rall.sh
# This script has to be located in the same directory as the skeletal code, 
# with the input and output directories inside this directories.
# e.g. rall.sh box_volume.java box 

set -e # Exit on error

sourcename=$1
binname="${sourcename%.*}"
testprefix=$2

echo "Compiling source file $sourcename to $binname"

javac $sourcename

i=0
while
    ((i++))
    testinfile="input/$testprefix$i.in"
    [ -f $testinfile ]
do
    echo "Running test $testinfile"
    outfile="test$i.out"
    java $binname < $testinfile > $outfile
    diff $outfile "output/$testprefix$i.out"
done

echo "Test $testprefix$i.in not found"
