# 
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w \$\[\033[00m\] '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
SCRIPT_DIR="$(cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
# Source my aliases
if [ -f $SCRIPT_DIR/.bash_aliases ]; then
    echo "Found .bash_aliases, sourcing...";
    source $SCRIPT_DIR/.bash_aliases
fi
# Source my software aliases
if [ -f $SCRIPT_DIR/.bash_aliases_software ]; then
    echo "Found .bash_aliases_software, sourcing...";
    source $SCRIPT_DIR/.bash_aliases_software
fi

# Determine active Python virtualenv details.
function set_virtualenv () {
  if test -z "$VIRTUAL_ENV" ; then
      PYTHON_VIRTUALENV=""
  else
	  PYTHON_VIRTUALENV="(`basename \"$VIRTUAL_ENV\"`) "
  fi
}

# for showing git branch and if we are in a virtual env
source $SCRIPT_DIR/software/gitstatus/gitstatus.prompt.sh
set_virtualenv

# For getting screen session use ${STY#[0-9]*.}
SCREENNAME_PROMPT='${STY#[0-9]*.}'

# Place on RHS
printf -v PS1RHS '\[\e[38;5;246m\]${STY#[0-9]*.}\[\e[0m\]'  # -1 is current time
# Strip ANSI commands before counting length
# From: https://www.commandlinefu.com/commands/view/12043/remove-color-special-escape-ansi-codes-from-text-with-sed
PS1RHS_stripped=$(sed "s,\x1B\[[0-9;]*[a-zA-Z],,g" <<<"${STY#[0-9]*.}")
# Reference: https://en.wikipedia.org/wiki/ANSI_escape_code
Save='\e[s' # Save cursor position
Rest='\e[u' # Restore cursor to save point
# Save cursor position, jump to right hand edge, then go left N columns where
# N is the length of the printable RHS string. Print the RHS string, then
# return to the saved position and print the LHS prompt.
# Note: "\[" and "\]" are used so that bash can calculate the number of
# printed characters so that the prompt doesn't do strange things when
# editing the entered text.

# Original prompt
PS1A='\[\e[38;5;22;2m\]\@ \[\e[0;38;5;34;3m\]\u\[\e[38;5;35;1m\]@\[\e[22;38;5;36m\]\h \[\e[0;38;5;22;2m\]in \[\e[0;38;5;142m\]${GITSTATUS_PROMPT}'
PS1B='\n\[\e[38;5;26m\]${PYTHON_VIRTUALENV}\[\e[38;5;32m\]\w \$ \[\e[0m\]'

# Append screen name to the RHS if it exists
PS1="${PS1A}\[${Save}\e[${COLUMNS:-$(tput cols)}C\e[${#PS1RHS_stripped}D${PS1RHS}${Rest}\]${PS1B}"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export BAT_THEME="Solarized (light)"
export GOPATH=$HOME/.local/share/go
export PATH=$HOME/.local/share/go/bin:$PATH
