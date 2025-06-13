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
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

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
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
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
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

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

export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion



# my own functions 20250612
#helpers

# Standard aliases (very common shortcuts)
alias ll='exa -l'          # detailed file list with colors
alias la='exa -la'         # detailed list including hidden files
alias ls='exa'             # replace ls with exa for colors
alias lt='exa -la --sort=modified'  # list by time modified
alias tree='exa --tree'    # tree view of directories
alias ..='cd ..'           # go up one directory (very common shortcut)
alias py='python'          # shorter python command
alias activate='source venv/bin/activate'  # quick venv activation

# Master help function - shows all available helpers
help() {
    echo "=== Available Helper Functions ==="
    echo "help          # Show this menu"
    echo "githelp       # Git commands"
    echo "venvhelp      # Python virtual environments"
    echo "pyhelp        # Python project shortcuts"
    echo "tmuxhelp      # Terminal multiplexer"
    echo "exahelp       # File listing with exa"
    echo ""
    echo "Type any function name for specific help"
}

# Git command reference
githelp() {
    echo "Git Quick Reference:"
    echo "git add .                  # Stage all changes"
    echo "git commit -m 'message'    # Commit with a message"
    echo "git push origin branch     # Push to remote branch"
    echo "git pull origin branch     # Pull from remote branch"
    echo "git checkout -b newbranch  # Create and switch to new branch"
    echo "git status                 # Check repository status"
    echo "git log --oneline          # View commit history"
}

# Python virtual environment reference
venvhelp() {
    echo "Python venv Quick Reference:"
    echo "python -m venv myenv       # Create a new virtual environment"
    echo "source myenv/bin/activate  # Activate the environment (Unix)"
    echo "activate                   # Quick activate (alias)"
    echo "deactivate                 # Deactivate the current environment"
}

# Python project helpers
pyhelp() {
    echo "Python Project Shortcuts:"
    echo "py                         # python (alias)"
    echo "activate                   # source venv/bin/activate (alias)"
    echo "pip list                   # show installed packages"
    echo "pip freeze > requirements.txt  # save current dependencies"
    echo "pip install -r requirements.txt  # install from requirements file"
}

# Terminal multiplexer reference
tmuxhelp() {
    echo "Tmux Quick Reference:"
    echo "tmux new -s mysession      # Start a new session"
    echo "tmux attach -t mysession   # Attach to an existing session"
    echo "tmux ls                    # List all sessions"
    echo "Ctrl-b d                   # Detach from session"
    echo "Ctrl-b c                   # Create a new window"
    echo "Ctrl-b p                   # Previous window"
    echo "Ctrl-b n                   # Next window"
}

# Quick file search function
findfile() { 
    find . -name "*$1*" 2>/dev/null    # Find files by name pattern
}

# Exa file listing helper
exahelp() {
    echo "Exa File Listing Commands:"
    echo "ls                         # basic colorized list (exa)"
    echo "ll                         # detailed list (exa -l)"
    echo "la                         # detailed list with hidden files (exa -la)"
    echo "lt                         # list sorted by modification time"
    echo "tree                       # tree view of directories (exa --tree)"
    echo "exa --icons -la            # detailed list with file type icons"
    echo "exa --tree --level=2       # tree view limited to 2 levels deep"
    echo "exa -la --group-directories-first  # directories first, then files"
}

export PATH="$HOME/.local/bin:$PATH"
