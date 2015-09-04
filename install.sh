#!/bin/bash
FLAG_ZUERA="# LET THE ZUERA BEGIN"
FLAG_END_ZUERA="# LET THE ZUERA END"
echo "========================================================================"
echo "| This is the pograma Terminal da zuera, by graciano gracilindo        |"
echo "| É open source: http://github.com/graciano/terminal-da-zuera          |"
echo "|----------------------------------------------------------------------|"
echo "|Este pograma irá acrescentar conteúdo ao final do seu arquivo .bashrc.|"
echo "|Para isto, será colocado um comentário com a constante                |"
echo "| '# LET THE ZUERA BEGIN'. E após o conteúdo específico, a constante   |"
echo "| '# LET THE ZUERA END'.                                               |"
echo "|______________________________________________________________________|"

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

source "$DIR/installation_script.sh"
source "$DIR/clear_installation.sh"

install_zuera(){
    clear_previous_installation
    echo "$FLAG_ZUERA" >> ~/.bashrc
    function_get_script ~/.bashrc
    if [ "$HOSTNAME"="beta-matheus" ]
    then
        echo "Computador do graciano encontrado. Instalando comandos específicos..."
        cat graciano_definitions.sh >> ~/.bashrc
    fi
    echo '' >> ~/.bashrc
    echo "$FLAG_END_ZUERA" >> ~/.bashrc
	echo "Se você não viu nehuma mensagem de erro de permissão de escrita etc, tá tudo pronto e ok"
}

tem_certeza(){
    read -p "Tem certeza?" choice
    if [[ $choice =~ ^[Yy]$ ]]
    then
         install_zuera
    fi
}

tem_certeza
