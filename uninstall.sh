#!/bin/bash
FLAG_ZUERA="# LET THE ZUERA BEGIN"
FLAG_END_ZUERA="# LET THE ZUERA END"
echo "========================================================================"
echo "| This is the pograma Terminal da zuera, by graciano gracilindo        |"
echo "| É open source: http://github.com/graciano/terminal-da-zuera          |"
echo "|----------------------------------------------------------------------|"
echo "|:( Este é o desinstalador. Ele vai REMOVER tudo de legal que já foi   |"
echo "| feito antes.                                                         |"
echo "| Não foi pra sempre, mas que seja eterno enquanto dure :p             |"
echo "|______________________________________________________________________|"

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

source "$DIR/clear_installation.sh"

tem_certeza(){
    read -p "Tem certeza?" choice
    if [[ $choice =~ ^[Yy]$ ]]
    then
         clear_previous_installation
    fi
}

tem_certeza
