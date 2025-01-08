#!/bin/bash

# Check if a year is provided as an argument
if [ -z "$1" ]; then
    # Get the current year if no argument is supplied
    year=$(date +"%Y")
else
    year=$1
fi

# Check if the input year is a valid number
if [[ $year =~ ^[0-9]+$ ]]; then
    # Determine if the year is a leap year
    if (( (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0) )); then
        echo "$year is a leap year."
    else
        echo "$year is not a leap year."
    fi
else
    echo "Invalid input! Please enter a valid year."
fi

