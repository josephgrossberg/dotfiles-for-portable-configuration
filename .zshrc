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

export ZSH=$HOME/.oh-my-zsh # Path to your oh-my-zsh configuration.
plugins=(git gitfast zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# z for jumping around directories
. ~/bin/z.sh

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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

###################################
# PROMPT
###################################
export POWERLEVEL9K_MODE="nerdfont-complete"
[ -f ~/powerlevel9k.zsh-theme ] && source ~/powerlevel9k.zsh-theme
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs newline status)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

POWERLEVEL9K_VCS_SHORTEN_LENGTH=20
POWERLEVEL9K_VCS_SHORTEN_MIN_LENGTH=20
POWERLEVEL9K_VCS_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
