#!/bin/bash

create_dir(){
	mkdir demoo
}

if ! create_dir ;then
	echo "Dir already created"
	exit 1
fi

