#!/bin/bash

echo "Enter number 1:"
read num1
echo "Enter number 2:"
read num2
echo "Result for arithmetic operations on num1 & num2"
sum=$((num1+num2))
echo "Addition: $num1 + $num2 = $sum"
diff=$((num1-num2))
echo "Subtraction: $num1 - $num2 = $diff"
mul=$((num1*num2))
echo "Multiplication: $num1 * $num2 = $mul"
if [ $num2 -ne 0 ]; then
    div=$((num1/num2))
    echo "Division: $num1 / $num2 = $div"
else
    echo "Division: cannot divide by zero"
fi    
if [ $num2 -ne 0 ]; then
    mod=$((num1%num2))
    echo "Modulo: $num1 % $num2 = $mod"
else
   echo "modulo: cannot modulo by zero"
fi
