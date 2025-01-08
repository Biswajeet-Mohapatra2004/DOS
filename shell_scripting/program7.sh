#!/bin/bash

# Check if the correct number of arguments is provided
if [ $# -ne 3 ]; then
    echo "Usage: $0 n m filename"
    exit 1
fi

n=$1
m=$2
filename=$3

# Check if the file exists
if [ ! -f "$filename" ]; then
    echo "File not found: $filename"
    exit 1
fi

# Display the first n lines of the file
echo "First $n lines of $filename:"
head -n "$n" "$filename"

# Display the last m lines of the file
echo -e "\nLast $m lines of $filename:"
tail -n "$m" "$filename"

