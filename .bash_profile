clear && printf '\e[3J'
cd ; history -c

echo
screenfetch
echo

export EDITOR=vim
NC="\[\e[0m\]"
VERT="\[\e[32;40m\]"
JAUNE="\[\e[33;40m\]"
ROUGE="\[\e[31;40m\]"
CYAN="\[\e[36;40m\]"
export PS1="[$JAUNE\u$NC@$ROUGE\H$NC@$CYAN\D{%F %T}$NC:$VERT\w$NC(\#)]>"

. .alias
