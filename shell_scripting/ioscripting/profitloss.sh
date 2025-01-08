#!/bin/bash

# Prompt the user to enter the cost price
echo "Enter the cost price of the item:"
read cost_price

# Prompt the user to enter the selling price
echo "Enter the selling price of the item:"
read selling_price

# Check if the inputs are valid numbers
if [[ $cost_price =~ ^[0-9]+([.][0-9]+)?$ && $selling_price =~ ^[0-9]+([.][0-9]+)?$ ]]; then
    # Calculate profit or loss
    if (( $(echo "$selling_price > $cost_price" | bc -l) )); then
        profit=$(echo "$selling_price - $cost_price" | bc -l)
        echo "The seller made a profit of $profit."
    elif (( $(echo "$cost_price > $selling_price" | bc -l) )); then
        loss=$(echo "$cost_price - $selling_price" | bc -l)
        echo "The seller incurred a loss of $loss."
    else
        echo "There is no profit or loss (break-even)."
    fi
else
    echo "Invalid input! Please enter valid numerical values for cost price and selling price."
fi

