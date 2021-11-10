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

bind '"OP":"git log --pretty=format:\"%C(bold red)❤ %C(bold yellow)%h%Creset ➜%C(bold magenta)%d\%Creset %C(bold)%s %C(bold green)(%cr) %C(bold blue)<\%an>\%Creset\" --abbrev-commit"' #F1
bind '"OQ":"git log --all --graph --pretty=format:\"%C(bold red)❤ %C(bold yellow)%h%Creset ➜%C(bold magenta)%d\%Creset %C(bold)%s %C(bold green)(%cr) %C(bold blue)<\%an>\%Creset\" --abbrev-commit"' #F2
bind '"OR":"./run.sh release"' #F3
bind '"OS":"./run.sh debug"' #F4

bind '"[15~":"git status"' #F5
bind '"[17~":"git add -A"' #F6
bind '"[18~":"git commit"' #F7
bind '"[19~":"git push"' #F8

eval $(keychain --eval --agents ssh id_benjamin)

clear
