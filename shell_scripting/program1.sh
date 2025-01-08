#!/bin/bash
cat file1.txt file2.txt file3.txt > merged.txt
sort -n merged.txt > result.txt
cat result.txt
rm merged.txt
