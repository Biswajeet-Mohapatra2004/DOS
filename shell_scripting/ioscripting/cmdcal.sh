#!/bin/bash

# Check if exactly three arguments are passed
if [ "$#" -ne 3 ]; then
    echo "Invalid input. Enter input in the following format: op1 operator op2"
    exit 1
fi

# Assign arguments to variables
op1=$1
operator=$2
op2=$3

# Check if the operands are valid numbers (integers)
if ! [[ $op1 =~ ^-?[0-9]+$ ]] || ! [[ $op2 =~ ^-?[0-9]+$ ]]; then
    echo "Invalid input. Please enter valid integers for operands."
    exit 1
fi

# Perform the calculation based on the operator
case $operator in
    +)
        result=$((op1 + op2))
        ;;
    -)
        result=$((op1 - op2))
        ;;
    x)
        result=$((op1 * op2))
        ;;
    /)
        if [ "$op2" -eq 0 ]; then
            echo "Error: Division by zero is not allowed."
            exit 1
        fi
        result=$((op1 / op2))
        ;;
    %)
        result=$((op1 % op2))
        ;;
    ^)
        result=$((op1 ** op2))
        ;;
    *)
        echo "Invalid operator. Use one of the following: +, -, x, /, %, ^"
        exit 1
        ;;
esac

# Display the result in the format: op1 operator op2 = result
echo "$op1 $operator $op2 = $result"

