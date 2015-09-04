clear_previous_installation(){
    NUMBER_START=$(awk "/$FLAG_ZUERA/{ print NR; exit }" ~/.bashrc)
    NUMBER_END=$(awk "/$FLAG_END_ZUERA/{ print NR; exit }" ~/.bashrc)
    echo "start $NUMBER_START | end $NUMBER_END"
    if [ -z "$NUMBER_START" ]
    then
        echo "Nenhuma instalação encontrada, prosseguindo..."
    else
        if [ -z "$NUMBER_END" ]
        then
           echo "Instalação de versão pré 0.2 (ou corrompida) encontrada, removendo conteúdo do arquivo $DEFINITIONS_FILE a partir da linha $NUMBER_START"
           sed -ni "/^$FLAG_ZUERA$/q;p" ~/.bashrc
        else
            echo "Instalação encontrada. Todo o conteúdo entre $FLAG_ZUERA e $FLAG_END_ZUERA será removido do arquivo ~/.bashrc"
            sleep 10
            sed -ni "/${NUMBER_START}/,/${NUMBER_END}/d;" ~/.bashrc
        fi
    fi
}