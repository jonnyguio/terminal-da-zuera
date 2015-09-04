#!bin/bash

function_hu3(){
	commands=$1
	echo "Estes são os comandos da zuera:"
	echo "hu3 # este comando"
	for command in "${commands[@]}"; do
		echo -e "${command}"
	done
}
