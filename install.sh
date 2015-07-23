#!/bin/bash
FLAG_ZUERA="# LET THE ZUERA BEGIN"
FLAG_END_ZUERA="# LET THE ZUERA END"
DEFINITIONS_FILE="bash_definitions.sh"
DEFINITIONS_FILE_ALTERNATIVE="bash_definitions_alternative.sh"
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

install_zuera(){
    clear_previous_instalation
    echo "Você usa a pasta /var/www/html?"
    read -p "Caso não, o programa assume que seja a /var/www/ " choice
    if [[ $choice =~ ^[Yy]$ ]]
    then
         cat "$DEFINITIONS_FILE" >> ~/.bashrc
    else
        cat "$DEFINITIONS_FILE_ALTERNATIVE" >> ~/.bashrc
    fi

    if [ "$HOSTNAME"="beta-matheus" ]
    then
        echo "Computador do graciano encontrado. Instalando comandos específicos..."
        cat graciano_definitions.sh >> ~/.bashrc
    fi
    echo '' >> ~/.bashrc
    echo "$FLAG_END_ZUERA" >> ~/.bashrc
	echo "Se você não viu nehuma mensagem de erro de permissão de escrita etc, tá tudo done"
}

tem_certeza(){
    read -p "Tem certeza?" choice
    if [[ $choice =~ ^[Yy]$ ]]
    then
         install_zuera
    fi
}

tem_certeza
