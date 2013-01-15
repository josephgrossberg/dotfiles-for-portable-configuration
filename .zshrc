###################################
# INITIAL SETUP
###################################
autoload -U compinit promptinit
compinit # command completion
promptinit # prompt customization

###################################
# PATHS
###################################
export PATH=/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/usr/local/mysql/bin:$PATH
export PATH=~/bin:$PATH
export PATH=/usr/local/git/bin:$PATH

###################################
# SETTINGS
###################################
export EDITOR=emacs
export VISUAL=emacs
export PAGER=cat
export MANPATH=$MANPATH:/usr/X11R6/man
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;33'
export LESS='--LONG-PROMPT --LINE-NUMBERS --ignore-case --QUIET'

###################################
# HISTORY
###################################
export HISTTIMEFORMAT='%Y-%m-%d %H:%M:%S - '
HISTFILE=~/.zhistory
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


###################################
# PROMPT
###################################
PS1='.:[ %~ ]:.
$ '
echo "TODO: oh my zsh"
echo "TODO: git branch in prompt"
echo "TODO: git branch status"
echo "TODO: git branch name completion"

###################################
# ALIASES
###################################
if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi

###################################
# WORK ALIASES
###################################
if [ -f ~/.zsh_aliases_work ]; then
    . ~/.zsh_aliases_work
fi

###################################
# RVM STUFF
###################################
[[ -s "/Users/joegrossberg/.rvm/scripts/rvm" ]] && source "/Users/joegrossberg/.rvm/scripts/rvm"  # This loads RVM into a shell session.

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

###################################
# NOTES
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
