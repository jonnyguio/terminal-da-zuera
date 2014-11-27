# LET THE ZUERA BEGIN

#   zoeira aliases
alias yo="echo 'yo yo!'"

#   useful aliases from http://askubuntu.com/questions/21290/which-aliases-do-you-find-most-useful-or-helpful-to-your-ubuntu-experience

alias s='sudo ' # the space allows for command name expansion.
alias g='git'
alias q='exit'
alias ..='cd ..'
alias ...='cd ../../'
alias tgz='tar -zxvf'
alias rm='rm -i'  # confirmação antes de deletar um arquivo

#   functions for complicated aliases
function_show_webdev_folders() {
    for abs_path in $(ls -d /var/www/*/); do
        local dirs=(${abs_path//\// })
        local length=${#dirs[@]} # Get the length.                                          
        local last_position=$((length - 1)) # Subtract 1 from the length.                   
        local last_path=${dirs[${last_position}]} # Get the last position.
        echo "    $last_path"
    done
}

#   complicated aliases
#        seen in http://stackoverflow.com/questions/7131670/make-bash-alias-that-takes-parameter
function_webdev() {
    # do things with parameters like $1 such as
    if [ -z "$1" ]
    then
        echo "Acessar pasta de desenvolvimento web. Eis os argumentos disponíveis:"
        function_show_webdev_folders
    else
        cd /var/www/$1
    fi
}
alias web-dev=function_webdev
alias webdev=function_webdev

#   autocomplete for webdev is in ~/.bash_completion.d/webdev
_webdev()
{
    local response="";
    for abs_path in $(ls -d /var/www/*/); do
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

function_hu3(){
	echo "Estes são os comandos da zuera:"
	echo "    yo"
	echo "    web-dev <seu-projeto> (webdev <seu-projeto>)"
}

alias hu3=function_hu3

