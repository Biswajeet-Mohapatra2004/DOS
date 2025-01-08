#!/bin/bash

# Prompt the user to enter Ramesh's basic salary
echo "Enter Ramesh's basic salary:"
read basic_salary

# Validate input (check if it is a positive number)
if [[ ! $basic_salary =~ ^[0-9]+(\.[0-9]+)?$ ]] || (( $(echo "$basic_salary <= 0" | bc) )); then
    echo "Invalid input. Please enter a positive number."
    exit 1
fi

# Calculate dearness allowance (40% of basic salary)
da=$(echo "0.4 * $basic_salary" | bc)

# Calculate house rent allowance (20% of basic salary)
hra=$(echo "0.2 * $basic_salary" | bc)

# Calculate gross salary
gross_salary=$(echo "$basic_salary + $da + $hra" | bc)
# Display the results
echo "Basic Salary: $basic_salary"
echo "Dearness Allowance (40%): $da"
echo "House Rent Allowance (20%): $hra"
echo "Gross Salary: $gross_salary"

