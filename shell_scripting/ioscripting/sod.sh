#!/bin/bash

# Prompt the user to enter a five-digit number
echo "Enter a five-digit number:"
read number

# Check if the input is a five-digit number
if [[ $number =~ ^[0-9]{5}$ ]]; then
    # Initialize sum to 0
    sum=0

    # Loop through each digit of the number
    for (( i=0; i<${#number}; i++ )); do
        # Extract the digit and add it to the sum
        digit=${number:i:1}
        sum=$((sum + digit))
    done

    # Print the result
    echo "The sum of the digits of $number is $sum."
else
    echo "Invalid input! Please enter a valid five-digit number."
fi

