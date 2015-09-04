#!/bin/bash
function_get_script(){
	state='idle'
	output=''
	vars_output=''
	cont_var=0
	vars_dont_use=
	vars=
	commands=

	output_file="$1"
	# Esse código está muito confuso, é que eu sou ruim em bash, malz aê
	IFS='%' # preserve tabs in echos
	file=
	while read line; do
		file+=($line)
	done <commands.sh

	for line in "${file[@]}"; do
		if [[ $line != '' ]]; then
			
			if [[ $line =~ ^#end-vars ]]; then
				state='command'
				output=''
				vars=("${vars_dont_use[@]}")
			fi

			if [[ $line =~ ^#end-command ]]; then
				cont_var=0
				vars_dont_use=("1")
				if [[ "$state" == 'command' ]]; then
					for v in "${vars[@]}"; do
						read -p "Dê um valor para ${v}:" valor
						echo "${v}${valor}" >> "${output_file}"
					done
				fi
				echo -e "${output}" >> "${output_file}"
				state='idle'
				output=''
				vars_output=''
			elif [[ ! ($line =~ ^#) ]]; then
				if [[ "$state" == 'idle' ]]; then
					state='description'
				fi
				if [[ "$state" == 'command' ]]; then
					output="$output\n$line"
				elif [[ "$state" == 'vars' ]]; then
					vars_dont_use[cont_var]=$(echo "$line" | grep -oE "^(.)+=")
					vars_output+="${vars_dont_use[cont_var]}"
					(( cont_var++ ))
					output="$output\n$line"
				fi
			elif [[ "$state" == 'description' ]]; then
				commands+=("$line#^#") # cuts first '#' of line
				state='vars'
			fi
		fi
	done
	for c in "${commands[@]}"; do
		echo "${c}" >> "${output_file}"
	done
	unset IFS
}
