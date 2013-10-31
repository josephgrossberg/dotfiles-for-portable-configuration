# joegross's .bashrc
# User specific aliases and functions

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

###################################
# PATHS
###################################
export PATH=/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/usr/local/mysql/bin:$PATH
#export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH=~/bin:$PATH
export PATH=/usr/local/git/bin:$PATH

###################################
# SETTINGS
###################################
export EDITOR=emacs
export VISUAL=emacs
export PAGER=cat
export HISTSIZE=20000
export HISTFILESIZE=20000
export HISTTIMEFORMAT='%Y-%m-%d %H:%M:%S - '
export MANPATH=$MANPATH:/usr/X11R6/man
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;33'
export LESS='--LONG-PROMPT --LINE-NUMBERS --ignore-case --QUIET'
export SOLR_HOME=~/projects/solr14

###################################
# PROMPT
###################################
if [ -f ~/.bash_prompt ]; then
    . ~/.bash_prompt
fi

###################################
# ALIASES
###################################
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

###################################
# WORK STUFF
###################################
if [ -f ~/.bash_profile ]; then
    . ~/.bash_profile
fi
if [ -f ~/.bash_aliases_work ]; then
    . ~/.bash_aliases_work
fi

###################################
# GIT ALIASES
###################################
if [ -f ~/git-completion.bash ]; then
    . ~/git-completion.bash
fi

#[[ -s "/Users/joegrossberg/.rvm/scripts/rvm" ]] && source "/Users/joegrossberg/.rvm/scripts/rvm"  # This loads RVM into a shell session.

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

#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
