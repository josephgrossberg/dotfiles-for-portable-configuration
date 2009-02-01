# joegross's .bashrc
# User specific aliases and functions

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

###################################
# PATHS
###################################
source /sw/bin/init.sh
export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH
export PATH=/opt/local/bin:$PATH
export PATH=~/bin:$PATH
export PATH=~/depot_tools:$PATH

###################################
# SETTINGS
###################################
export EDITOR=emacs
export VISUAL=emacs
export PAGER=cat
export HISTSIZE=20000
export HISTFILESIZE=20000
export MANPATH=$MANPATH:/usr/X11R6/man
export GEMHOME=/usr/local/lib/ruby/gems/1.8/gems
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;33'
export SPRING=mti

###################################
# PROMPT
###################################
        RED="\[\033[0;31m\]"
     YELLOW="\[\033[0;33m\]"
    GREEN="\[\033[0;32m\]"
       BLUE="\[\033[0;34m\]"
      WHITE="\[\033[1;37m\]"
 COLOR_NONE="\[\e[0m\]"
 
function parse_git_branch {
  git rev-parse --git-dir &> /dev/null
  git_status="$(git status 2> /dev/null)"
  branch_pattern="^# On branch ([^${IFS}]*)"
  remote_pattern="# Your branch is (.*) of"
  diverge_pattern="# Your branch and (.*) have diverged"
  if [[ ! ${git_status}} =~ "working directory clean" ]]; then
state="${RED}⚡"
  fi
  # add an else if or two here if you want to get more specific
  if [[ ${git_status} =~ ${remote_pattern} ]]; then
if [[ ${BASH_REMATCH[1]} == "ahead" ]]; then
remote="${YELLOW}↑"
    else
remote="${YELLOW}↓"
    fi
fi
if [[ ${git_status} =~ ${diverge_pattern} ]]; then
remote="${YELLOW}↕"
  fi
if [[ ${git_status} =~ ${branch_pattern} ]]; then
branch=${BASH_REMATCH[1]}
    echo "(${branch})${remote}${state}"
  fi
}
 
function prompt_func() {
    previous_return_value=$?;
    prompt="${TITLEBAR}.:[ \w ]:. ${BLUE}$(parse_git_branch)${COLOR_NONE}"
    PS1="${prompt}\n${COLOR_NONE}$ "
}
 
PROMPT_COMMAND=prompt_func

###################################
# ALIASES
###################################
alias bc='bc -l'
alias cpan='perl -MCPAN -e shell'
alias ducks='du -cks * |sort -rn |head -11'
alias eamcs='emacs'
alias fn='find . -name'
alias joegrossberg='ssh joegross@joegrossberg.com'
alias ls='ls -bG'
alias la='ls -abG'
alias ll='ls -abGl'
alias now='ruby -e "puts Time.now.utc.to_i"'

###################################
# WORK ALIASES
###################################
alias am='cd ~/amundo/'
alias ez='cd ~/ez/equipped/'
alias hm='cd ~/ez/equipped/'
alias mti='cd ~/mti/'
alias pl='cd ~/presently'
alias rlc='rake log:clear'
alias sc='./script/console'
alias ss='./script/server'

###################################
