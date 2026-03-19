# Alias
test -s ~/.alias && . ~/.alias || true

# Prompt
__git_branch() {
  command -v git >/dev/null 2>&1 || return 0
  git rev-parse --is-inside-work-tree >/dev/null 2>&1 || return 0
  git symbolic-ref --quiet --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null
}

__ps1_powerline() {
  local ec=$?
  [[ $- != *i* ]] && return 0

  local R='\[\e[0m\]'
  local B='\[\e[1m\]'

  # Foregrounds
  local FG_W='\[\e[38;5;231m\]'   # white text

  # Backgrounds (modern, clear but not neon)
  local BG_TIME='\[\e[48;5;25m\]'    # deep blue
  local BG_HOST='\[\e[48;5;30m\]'    # teal
  local BG_CWD='\[\e[48;5;236m\]'    # charcoal
  local BG_GIT='\[\e[48;5;61m\]'     # violet
  local BG_ERR='\[\e[48;5;124m\]'    # deep red
  local BG_DEF='\[\e[49m\]'          # default background

  # Powerline separator (needs Nerd Font / Powerline glyph support)
  local SEP=''

  # Separator that matches preceding box color:
  # fg = previous bg color (as a 256-color fg), bg = next segment bg
  __sep() {
    local prev_bg_fg="$1" next_bg="$2"
    printf '\[\e[38;5;%sm\]%s%s' "$prev_bg_fg" "$next_bg" "$SEP"
  }

  local host="${HOSTNAME%%.*}"
  local br="$(__git_branch)"

  # Build segments (each ends with an arrow into the next segment bg)
  local s=""

  # TIME (bg 25) -> HOST (bg 30)
  s+="${BG_TIME}${FG_W}${B} 🕒 \A ${R}$(__sep 25 "$BG_HOST")${R}"

  # HOST (bg 30) -> CWD (bg 236)
  s+="${BG_HOST}${FG_W}${B} 👤 \u@${host} ${R}$(__sep 30 "$BG_CWD")${R}"

  # CWD (bg 236) -> (GIT if present else ERR/default)
  if [[ -n "$br" ]]; then
    s+="${BG_CWD}${FG_W}${B} 📁 \w ${R}$(__sep 236 "$BG_GIT")${R}"
    # GIT (bg 61) -> (ERR if ec!=0 else default)
    if [[ $ec -ne 0 ]]; then
      s+="${BG_GIT}${FG_W}${B} 🌿 ${br} ${R}$(__sep 61 "$BG_ERR")${R}"
      s+="${BG_ERR}${FG_W}${B} 💥 ${ec} ${R}$(__sep 124 "$BG_DEF")${R}"
    else
      s+="${BG_GIT}${FG_W}${B} 🌿 ${br} ${R}$(__sep 61 "$BG_DEF")${R}"
    fi
  else
    if [[ $ec -ne 0 ]]; then
      s+="${BG_CWD}${FG_W}${B} 📁 \w ${R}$(__sep 236 "$BG_ERR")${R}"
      s+="${BG_ERR}${FG_W}${B} 💥 ${ec} ${R}$(__sep 124 "$BG_DEF")${R}"
    else
      s+="${BG_CWD}${FG_W}${B} 📁 \w ${R}$(__sep 236 "$BG_DEF")${R}"
    fi
  fi

  PS1="${s}\n\[\e[38;5;245m\]❯${R} "
}

# Run ours last (so conda/others don't overwrite it after)
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND; }__ps1_powerline"
set -o vi
export GPG_TTY=$(tty)
export LS_COLORS="di=0:ln=35:so=32:pi=33:ex=31:bd=34;"
alias ls='ls --color=auto'
export EDITOR=vim
export VISUAL=vim
export TERM="xterm-256color"
export MANPAGER="/bin/sh -c \"col -b | vim --not-a-term -c 'set ft=man ts=8 nomod nolist noma' -\""

[[ $- != *i* ]] && return

alias ..='cd ..'
alias ...='cd ../..'
alias 3.='cd ../../..'
alias 4.='cd ../../../..'
alias 5.='cd ../../../../..'
alias toron="echo -n 'Before: ' ; wget -qO - icanhazip.com ; . torsocks on ; echo -n 'After: ' ; wget -qO - icanhazip.com"
alias toroff="echo -n 'Before: ' ; wget -qO - icanhazip.com ; . torsocks off ; echo -n 'After: ' ; wget -qO - icanhazip.com"

bind '"OP":"git log --pretty=format:\"%C(bold red)❤ %C(bold yellow)%h%Creset ➜%C(bold magenta)%d\%Creset %C(bold)%s %C(bold green)(%cr) %C(bold blue)<\%an>\%Creset\" --abbrev-commit"' #F1
bind '"OQ":"clear ; cargo run -- --dev"' #F2
bind '"OR":"clear ; cargo test --workspace --exclude duniter-end2end-tests --exclude duniter-live-tests --features runtime-benchmarks"' #F3
bind '"OS":"clear ; cargo build --release --features runtime-benchmarks"' #F4

bind '"[15~":"git status"' #F5
bind '"[17~":"git add -u"' #F6
bind '"[18~":"git commit"' #F7
bind '"[19~":"git push"' #F8

eval $(keychain --eval --agents ssh id_benjamin)
