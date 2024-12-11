#!/bin/bash

read -p "Enter a: " a
read -p "Enter b: " b
read -p "Select the Operator (+ - * % /): " op

if [[ $op == "+" ]]; 
then
    add=$((a + b))
    echo "Addition of a and b is: $add"

elif [[ $op == "-" ]]; 
then
    sub=$((a - b))
    echo "Subtraction of a and b is: $sub"

elif [[ $op == "*" ]]; 
then
    mul=$((a * b))
    echo "Multiplication of a and b is: $mul"

elif [[ $op == "%" ]]; 
then
    mod=$((a % b))
    echo "Modulus of a and b is: $mod"

elif [[ $op == "/" ]]; 
then
    if [[ $b -ne 0 ]]; 
    then
        div=$((a / b))
        echo "Division of a and b is: $div"
    else
        echo "Error: Division by zero!"
    fi

else
    echo "Wrong operator."
fi

