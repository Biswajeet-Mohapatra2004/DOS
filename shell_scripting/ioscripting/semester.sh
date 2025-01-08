#!/bin/bash

# Prompt the user to enter internal marks
echo "Enter internal marks (out of 50):"
read internal_marks

# Prompt the user to enter attendance percentage
echo "Enter attendance percentage:"
read attendance_percentage

# Check if the inputs are valid numbers
if [[ $internal_marks =~ ^[0-9]+([.][0-9]+)?$ && $attendance_percentage =~ ^[0-9]+([.][0-9]+)?$ ]]; then
    # Check if the criteria for allowance are met
    if (( $(echo "$internal_marks >= 20" | bc -l) && $(echo "$attendance_percentage >= 75" | bc -l) )); then
        echo "Allowed for Semester"
    else
        echo "Not Allowed for Semester"
    fi
else
    echo "Invalid input! Please enter valid numerical values for marks and attendance percentage."
fi

