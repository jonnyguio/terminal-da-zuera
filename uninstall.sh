#!/bin/bash
FLAG_ZUERA="# LET THE ZUERA BEGIN"
FLAG_END_ZUERA="# LET THE ZUERA END"
DEFINITIONS_FILE="bash_definitions.sh"
DEFINITIONS_FILE_ALTERNATIVE="bash_definitions_alternative.sh"
echo "========================================================================"
echo "| This is the pograma Terminal da zuera, by graciano gracilindo        |"
echo "| É open source: http://github.com/graciano/terminal-da-zuera          |"
echo "|----------------------------------------------------------------------|"
echo "|:( Este é o desinstalador. Ele vai REMOVER tudo de legal que já foi   |"
echo "| feito antes.                                                         |"
echo "| Não foi pra sempre, mas que seja eterno enquanto dure :p             |"
echo "|______________________________________________________________________|"
clear_previous_instalation(){
    NUMBER_START=$(awk "/$FLAG_ZUERA/{ print NR; exit }" ~/.bashrc)
    NUMBER_END=$(awk "/$FLAG_END_ZUERA/{ print NR; exit }" ~/.bashrc)
    echo "start $NUMBER_START | end $NUMBER_END"
    if [ -z "$NUMBER_START" ]
    then
        echo "Nenhuma instalação encontrada, prosseguindo..."
    else
        if [ -z "$NUMBER_END"]
        then
           echo "Instalação de versão pré 0.2 encontrada, removendo conteúdo do arquivo $DEFINITIONS_FILE a partir da linha $NUMBER"
           sed -ni "/^$FLAG_ZUERA$/q;p" ~/.bashrc
        else
            echo "Instalação encontrada. Todo o conteúdo entre $FLAG_ZUERA e $FLAG_END_ZUERA será removido do arquivo ~/.bashrc"
            sed -ni "/-$NUMBER_START/,/-$NUMBER_END/" ~/.bashrc
        fi
    fi
}

tem_certeza(){
    read -p "Tem certeza?" choice
    if [[ $choice =~ ^[Yy]$ ]]
    then
         clear_previous_instalation
    fi
}

tem_certeza
