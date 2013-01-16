###################################
# INITIAL SETUP
###################################
autoload -U compinit promptinit
compinit # command completion
promptinit # prompt customization

###################################
# ENVIRONMENT VARS
###################################
PATH=~/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/usr/local/mysql/bin:$PATH
EDITOR=emacs
VISUAL=emacs
PAGER=cat
MANPATH=$MANPATH:/usr/X11R6/man
GREP_OPTIONS='--color=auto'
GREP_COLOR='1;33'
LESS='--LONG-PROMPT --LINE-NUMBERS --ignore-case --QUIET'
export SOLR_HOME=~/projects/solr14 # export to make available to foreman

###################################
# HISTORY
###################################
HISTFILE=~/.zsh_history
HISTSIZE=SAVEHIST=10000
setopt incappendhistory 
setopt sharehistory
setopt extendedhistory

###################################
# ZSH CONFIG
###################################
# tab completion from both ends.
setopt completeinword
# tab completion should be case-insensitive.
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
# word boundaries dont cross slashes (expunge the '/' character from the list
# of characters that are part of words)
WORDCHARS=${WORDCHARS//\//}

###################################
# PROMPT
###################################
PS1='.:[ %~ ]:.
$ '
echo "TODO: oh my zsh"
echo "* git branch in prompt"
echo "* git branch status"
echo "* git branch name completion"

###################################
# ALIASES
###################################
if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi
if [ -f ~/.zsh_aliases_work ]; then
    . ~/.zsh_aliases_work
fi

###################################
# RVM STUFF
###################################
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

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
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
