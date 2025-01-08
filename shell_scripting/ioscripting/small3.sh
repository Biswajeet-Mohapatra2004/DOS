#!/bin/bash

# Check if exactly three arguments are passed
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 num1 num2 num3"
    echo "Please provide exactly three numbers as arguments."
    exit 1
fi

# Assign the arguments to variables
num1=$1
num2=$2
num3=$3

# Check if all arguments are valid numbers
if ! [[ $num1 =~ ^-?[0-9]+([.][0-9]+)?$ && $num2 =~ ^-?[0-9]+([.][0-9]+)?$ && $num3 =~ ^-?[0-9]+([.][0-9]+)?$ ]]; then
    echo "Error: All arguments must be valid numbers."
    exit 1
fi

# Compare the three numbers to find the smallest
if (( $(echo "$num1 <= $num2" | bc -l) && $(echo "$num1 <= $num3" | bc -l) )); then
    smallest=$num1
elif (( $(echo "$num2 <= $num1" | bc -l) && $(echo "$num2 <= $num3" | bc -l) )); then
    smallest=$num2
else
    smallest=$num3
fi

# Display the smallest number
echo "The smallest number is: $smallest"

