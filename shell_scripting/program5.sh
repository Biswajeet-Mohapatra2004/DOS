#!/bin/bash

# Check if file passed as an argument or not
if [ -z "$1" ]; then
    echo "Usage: $0 filename"
    exit 1
fi

filename="$1"
echo -e "filename\t  Linecount\t  wordCount\t  charCount"
echo -e "$filename\t\t$(wc -l < "$filename")\t\t$(wc -w < "$filename")\t\t$(wc -m < "$filename")"

