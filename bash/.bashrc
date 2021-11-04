# Alias
test -s ~/.alias && . ~/.alias || true

# Prompt
force_color_prompt=yes
#PS1="\[\e[41;39m\]\u\[\e[m\]\[\]\[\e[104;31m\]\[\e[39;104m\]\[\] \w \[\e[94;49m\]\[\e[0m\]\[\[\]"
PS1="\[\e[39;93m\]\[\] \w \[\e[91;49m\]♥ ❯ \[\e[0m\]\[\[\]"
set -o vi
export GPG_TTY=$(tty)
export LS_COLORS="di=0:ln=35:so=32:pi=33:ex=31:bd=34;"
alias ls='ls --color=auto'
export EDITOR=vim
export VISUAL=vim
export TERM="xterm-256color"
export MANPAGER="/bin/sh -c \"col -b | vim --not-a-term -c 'set ft=man ts=8 nomod nolist noma' -\""
export PROMPT_COMMAND='history -a'

[[ $- != *i* ]] && return

alias ..='cd ..'
alias ...='cd ../..'
alias 3.='cd ../../..'
alias 4.='cd ../../../..'
alias 5.='cd ../../../../..'
alias debug='./run.sh debug'

bind '"OP":"sudo pacman -Syyu"' #F1
bind '"OQ":"emacs"' #F2
bind '"OS":"./run.sh debug"' #F4
bind '"[15~":"./run.sh release"' #F5

eval $(keychain --eval --agents ssh id_benjamin)

clear
