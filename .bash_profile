clear && printf '\e[3J'
cd ; history -c

echo
screenfetch
echo

export EDITOR=vim
export PS1="[\u@\H@\D{%F %T}:\w(\#)]>"

set bell-style visible

. .alias
