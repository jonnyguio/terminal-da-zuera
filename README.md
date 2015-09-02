Terminal da Zuera
=================

Personalização de comandos de terminal para ubuntu (não testado em nenum outro SO, mas sinta-se  à vontade)

## features
* webdev - comando de acesso rápido para pastas que estiverem no `/var/www/` ou `/var/www/html` (o tab funciona *.*)
* yo - responde "yo yo!"
* s = sudo
* g=git
* q=exit
* ..=cd ..
* ...=cd ../../
* tgz=tar -zxvf
* rm=rm -i  **# confirmação antes de deletar um arquivo**
* pulseaudio-kill *# pára o pulseaudio e o impede de voltar a rodar*
* pulseaudio-start *# desfaz o comando acima (somente o pulseaudio --start convencional não resolve*

## Instalação
* Primeiro, clone o repo:
`$ git clone https://github.com/graciano/terminal-da-zuera.git`
* Acesse a pasta
`$ cd terminal-da-zueira/`
* Execute o instalador:
`$ ./install.sh`
* Rode o comando hu3, que mostra os comandos disponíveis
`$ hu3`
* Para desinstalar, execute o desinstalador
`$ cd terminal-da-zueira/`
`$ ./uninstall.sh`

## to do
* comando de criar comandos
* remover redundância do bash_alternatives
* mais comandos da zuera
* aberto a sugestões
