alias ls='eza --header'
alias ll="ls -lF --color=auto"
alias la="ll -a"

alias botscr="screen -d -r bot"

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
