#!/bin/bash

# Check if exactly two arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 filename1 filename2"
    exit 1
fi

# Assign the arguments to variables
file1=$1
file2=$2

# Check if both files exist
if [ ! -f "$file1" ]; then
    echo "File $file1 does not exist."
    exit 1
fi

if [ ! -f "$file2" ]; then
    echo "File $file2 does not exist."
    exit 1
fi

# Compare the content of the two files
if cmp -s "$file1" "$file2"; then
    echo "Files $file1 and $file2 have same content."
    rm "$file2"
    echo "So $file2 is deleted."
else
    echo "Files $file1 and $file2 have different content."
fi
