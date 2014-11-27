#!/bin/bash
FLAG_ZUERA="# LET THE ZUERA BEGIN"
DEFINITIONS_FILE="bash_definitions"
echo "========================================================================"
echo "| This is the pograma Terminal da zuera, by graciano gracilindo        |"
echo "| É open source: http://github.com/graciano/terminal-da-zuera          |"
echo "|----------------------------------------------------------------------|"
echo "|Este pograma irá acrescentar conteúdo ao final do seu arquivo .bashrc.|"
echo "|Para isto, será colocado um comentário com a constante                |"
echo "| '# LET THE ZUERA BEGIN'.                                             |"
echo "|Tudo que for escrito depois deste comentário será substituído pelo    |"
echo "| conteúdo do arquivo bash_definitions                                 |"
echo "|______________________________________________________________________|"
clear_previous_instalation(){
    NUMBER=$(awk "/$FLAG_ZUERA/{ print NR; exit }" ~/.bashrc)
    echo "$NUMBER"
    echo "$TOTAL_OF_LINES"
    if [ -z "$NUMBER" ]
    then
	    echo "Nenhuma instalação encontrada, prosseguindo..."
    else
	    echo "Instalação encontrada, removendo conteúdo do arquivo $DEFINITIONS_FILE a partir da linha $NUMBER"
	    sed -n '1,/$FLAG_ZUERA/q;p' ~/.bashrc
    fi
}

install_zuera(){
	cat "$DEFINITIONS_FILE" >> ~/.bashrc
	echo "Se você não viu nehuma mensagem de erro de permissão de escrita etc, tá tudo done"
}

clear_previous_instalation
install_zuera
