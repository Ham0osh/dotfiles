alias ls='eza --header'
alias ll="ls -lF --color=auto --git"
alias la="ll -a --icons"
alias lt="ll --tree --level=1"
alias ltt="ll --tree --level=2"
alias lttt="ll --tree --level=3"
alias ltttt="ll --tree --level=4"
alias lttttt="ll --tree --level=5"
alias lT="ll --tree"

alias ld="ll -M"
alias lta="lt -a"

alias oldcat="cat" cat="batcat"
alias catdiff="cat --style=changes"

alias ..="cd .."
alias ....='cd ..\..'
alias mount="mount |column -t"

alias ping5='ping -c 5'
alias rm='rm -I --preserve-root'

alias aptupdate="sudo apt-get update && sudo apt-get upgrade"
alias bsource='source ~/.bashrc'

alias meminfo='free -m -l -t'
alias psmem='ps auxf | sort -nr -k 4 | head -10'
alias pscpu='ps aufx | sort -nr -k 3 | head -10'

alias wtr='curl wttr.in/sfu?0?Q'
alias tree='ls -lT'
alias cl='clear'
