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
 1. Primeiro, clone o repo (ou baixe a última [release](https://github.com/graciano/terminal-da-zuera/releases)):
`$ git clone https://github.com/graciano/terminal-da-zuera.git`
 2. Acesse a pasta
`$ cd terminal-da-zueira/`
 3. Execute o instalador:
`$ ./install.sh`
 4. Rode o comando hu3, que mostra os comandos disponíveis
`$ hu3`
 5. Para desinstalar, execute o desinstalador
`$ cd terminal-da-zueira/`, depois
`$ ./uninstall.sh`

## to do
* comando de criar comandos
* remover redundância do bash_alternatives
* mais comandos da zuera
* aberto a sugestões
