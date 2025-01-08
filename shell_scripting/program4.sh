#!/bin/bash
filename="program1.sh"
echo "fileName: $filename"
echo "Line count: $(wc -l < $filename)"
echo "word count: $(wc -w < $filename)"
echo "char count: $(wc -m < $filename)"
