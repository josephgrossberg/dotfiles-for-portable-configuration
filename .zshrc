export ZSH=$HOME/.oh-my-zsh # Path to your oh-my-zsh configuration.

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
export ZSH_THEME="joegrossberg"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"
# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
export COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git gitfast)

source $ZSH/oh-my-zsh.sh
source ~/.zprofile

# Customize to your needs...
###################################
# INITIAL SETUP
###################################
autoload -U compinit promptinit
compinit # command completion
promptinit # prompt customization

###################################
# ENVIRONMENT VARS
###################################
export PATH=~/bin:/usr/local/bin:/usr/local/sbin:$PATH

export EDITOR=emacs
export VISUAL=emacs
export PAGER=cat
export PSQL_PAGER=cat
export MANPATH=$MANPATH:/usr/X11R6/man
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;33'
export LESS='--LONG-PROMPT --LINE-NUMBERS --ignore-case --QUIET --RAW-CONTROL-CHARS'

# z for jumping around directories
. ~/bin/z.sh

###################################
# RBENV
###################################
export PATH=$HOME/.rbenv/bin:$PATH
if (which rbenv > /dev/null); then
    eval "$(rbenv init -)"
fi

###################################
# NVM
###################################
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

###################################
# HISTORY
###################################
export HISTFILE=~/.zsh_history
export HISTSIZE=SAVEHIST=10000
setopt incappendhistory 
setopt sharehistory
setopt extendedhistory

# 10ms for key sequences
KEYTIMEOUT=1

# If a command is issued that can’t be executed as a normal command, and the
# command is the name of a directory, perform the cd command to that directory
setopt AUTO_CD

# If a pattern for filename generation has no matches, print an error
# instead of leaving it unchanged in the argument list
unsetopt nomatch

###################################
# ZSH CONFIG
###################################
# tab completion from both ends.
#setopt completeinword
# tab completion should be case-insensitive.
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
# word boundaries dont cross slashes (expunge the '/' character from the list
# of characters that are part of words)
export WORDCHARS=${WORDCHARS//\//}
# From https://github.com/robbyrussell/oh-my-zsh/issues/238
setopt NO_cdable_vars

# Allow comments on command line: http://stackoverflow.com/a/11873793
setopt interactivecomments

###################################
# PROMPT
###################################
# Done via oh-my-zsh now

###################################
# ALIASES
###################################
if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi
if [ -f ~/.zsh_work_aliases ]; then
    . ~/.zsh_work_aliases
fi

###################################
# RESUME EMACS WITH CTRL-Z
###################################
foreground-emacs() {
    fg %emacs
}
zle -N foreground-emacs
bindkey '^Z' foreground-emacs

###################################
# NOTES ON SHELL STUFF
###################################
# &> to redirect STDOUT and STDERR
# 2>&1 to redirect STDERR to STDOUT
# { pwd; ls } > /foo/bar to group output together
# foo.sh | tee out.txt to show and store output
# foo.sh | tee out.txt to show and store output and error
# ls -l $(cat listing.txt) to run one command as the arg of another
# ./myscript 3>&1 1>&2 2>&3 to swamp STDOUT and STDERR
# ./myscript 3>&1 1>out.log 2>&3- | tee -a err.log to store output but pipe err
# set +o/-o noclobber disables overwriting by redirected output
# user >| to ignore a noclobber bit
# ls -l $(cat listing.txt) to run one command as the arg of another
# !$ prev command
# !! prev line
# !:1 prev (first) argument
# all apps using internet connection: lsof -P -i -n | cut -f 1 -d " " | uniq
# diff <(git ls-files) <(find . -type f)
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
