###########################################################
# In this command definition file, the commands start with 
# a line '#command' followed by a line '#<description>'
# to describe the command in the explanations and then the
# needed sh script. The end of the script is marked with
# the '#end-command' line.
# 
# If the command depends on a var given in instalation,
# mark the first line with '#command!' and in the thrid
# line, put the variable with a fallback value. Then,
# end the var declaration with a line '#end-vars'
###########################################################

#command
#yo
alias yo="echo 'yo yo!'"
#end-command

#command
#s='sudo '# the space allows for command name expansion.
alias s='sudo '
#end-command

#command
#g='git '
alias g='git'
#end-command

#command
#q='exit'
alias q='exit'
#end-command

#command
#..='cd ..'

#end-command
alias ..='cd ..'

#command
#...='cd ../../'
alias ...='cd ../../'
#end-command

#command
#tgz='tar -zxvf'
alias tgz='tar -zxvf'
#end-command


#command
#rm='rm -i'  # confirmação antes de deletar um arquivo
alias rm='rm -i'
#end-command


#command
#pulseaudio-kill #

function_kill_pulseaudio() {
    echo autospawn = no > $HOME/.config/pulse/client.conf
    pkill -f pulseaudio
}

alias pulseaudio-kill=function_kill_pulseaudio
#end-command

#command
#pulseaudio-start #fdkasdjfa

function_start_pulseaudio() {
    command rm "$HOME/.config/pulse/client.conf"
    pulseaudio --start
}

alias pulseaudio-start=function_start_pulseaudio
#end-command


#command!
#webdev <project-folder> #quick acces to dev folder
WEBDEV_DIR='var/www/html/'
#end-vars

function_show_webdev_folders() {
    for abs_path in $(ls -d ${WEBDEV_DIR}*/); do
        local dirs=(${abs_path//\// })
        local length=${#dirs[@]} # Get the length.                                          
        local last_position=$((length - 1)) # Subtract 1 from the length.
        local last_path=${dirs[${last_position}]} # Get the last position.
        echo "    $last_path"
    done
}

function_webdev() {
    # do things with parameters like $1 such as
    if [ -z "$1" ]
    then
        echo "Acessar pasta de desenvolvimento web. Eis os argumentos disponíveis:"
        function_show_webdev_folders
    else
        cd ${WEBDEV_DIR}$1
    fi
}

alias web-dev=function_webdev
alias webdev=function_webdev

_webdev()
{
    local response="";
    for abs_path in $(ls -d ${WEBDEV_DIR}*/); do
        local dirs=(${abs_path//\// })
        local length=${#dirs[@]} # Get the length.                                          
        local last_position=$((length - 1)) # Subtract 1 from the length.                   
        local last_path=${dirs[${last_position}]} # Get the last position.
        response="$response  $last_path"
    done
    local cur=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=( $(compgen -W "$response" -- $cur) )
}
complete -F _webdev webdev

#end-command
