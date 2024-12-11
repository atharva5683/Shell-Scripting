#!/bin/bash

read -p "What to create a new user(yes/no) :" ans

if [[ $ans == "yes" ]];
then 
	read -p "Enter New user name :" name
	sudo useradd -m $name
	echo "New user $name is add"
else 
	echo okay!!
fi

