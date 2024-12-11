#!/bin/basd

read -p "Enter your name: " name

echo "Hello $name,Today is $(date)"

read -p "Enter first number :" num1

read -p "Enter Second number :" num2

add=$(( num1 + num2  ))

echo "Addition of number are :" $add 
