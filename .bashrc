clear && printf '\e[3J'

echo
$HOME/bin/now.sh
echo
neofetch
echo
toilet -f term -F border --metal `whoami`@`hostname` $(date '+%d/%m/%Y - %T')
echo

export EDITOR=vim
#export PS1="[\t \d \u@\h \w \$]"

#set -o vi
set completion-ignore-case on
set expand-tilde on
set convert-meta off
set input-meta on
set output-meta on
set show-all-if-ambiguous on
set visible-stats on
bind 'TAB:menu-complete'


. $HOME/.promptrc

. $HOME/.devrc
. $HOME/.alias
#. $HOME/.p4rc

shopt -s extglob


# &dd gnu bin
#PATH="/usr/local/sbin:/usr/local/opt/coreutils/libexec/gnubin:$HOME/bin/brew:$PATH"
PATH="/usr/local/opt/coreutils/libexec/gnubin:$HOME/bin/brew:$PATH"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
export MANPATH

#export PATH=$DEVS_PATH:$SCRIPTS_PATH:/Applications/MacVim.app/Contents/MacOS:/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/:$PATH
export PATH=$DEVS_PATH:$SCRIPTS_PATH:$PATH

# Setting PATH for Python 3.8
# The original version is saved in .bash_profile.pysave
#PATH="/Library/Frameworks/Python.framework/Versions/3.8/bin:${PATH}"
#export PATH

#stty columns 256
#stty rows 80

#export HISTSIZE=99999
export HISTTIMEFORMAT="%d/%m/%Y %T : "
cd && echo > $HOME/.bash_history && cd $HOME/.bash_sessions && rm -f * && history -c && cd
