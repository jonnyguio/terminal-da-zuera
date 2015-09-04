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
           echo "Instalação de versão pré 0.2 encontrada, removendo conteúdo do arquivo $DEFINITIONS_FILE a partir da linha $NUMBER"
           sed -ni "/^$FLAG_ZUERA$/q;p" ~/.bashrc
        else
            echo "Instalação encontrada. Todo o conteúdo entre $FLAG_ZUERA e $FLAG_END_ZUERA será removido do arquivo ~/.bashrc"
            sed "/${NUMBER_END}/ p; /${NUMBER_START}/,/${NUMBER_END}/ d;" ~/.bashrc
        fi
    fi
}