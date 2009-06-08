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
#export PATH=/opt/jruby/bin:$PATH
export PATH=~/bin:$PATH

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
  git_log_oneline="$(git log --pretty=oneline origin/master..master 2> /dev/null | wc -l)"
  branch_pattern="^# On branch ([^${IFS}]*)"
  remote_pattern="# Your branch is (.*) of"
  diverge_pattern="# Your branch and (.*) have diverged"
  if [[ ! ${git_status}} =~ "working directory clean" ]]; then
state="${RED}C"
  fi
  if [[ ! ${git_log_oneline}} =~ "       0" ]]; then
needs_push="${GREEN}P"
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
    echo "(${branch}) ${remote}${state}${needs_push}"
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
alias gem='sudo gem'
alias guid='mysql -u root -e"select uuid();"'
alias joegrossberg='ssh joegross@joegrossberg.com'
alias ls='ls -bG'
alias la='ls -abG'
alias ll='ls -abGl'
alias lynx='/Applications/Lynxlet.app/Contents/Resources/lynx/bin/lynx'
alias now='ruby -e "puts Time.now.utc.to_i"'
alias rr='railroad -M | dot -Tsvg > doc/database/models.svg; railroad -M | neato -Tpng > doc/database/models.png'

###################################
# WORK ALIASES
###################################
alias am='cd ~/amundo/'
alias brookes='cd ~/brookes/'
alias comcast='cd ~/comcast/'
alias ea='cd ~/earthaid/'
alias ez='cd ~/ez/equipped/'
alias hm='cd ~/streamsage/'
alias intridea='cd ~/intridea/newsite'
alias iu='cd ~/intridea_university/ruby-on-rails'
alias mlt='cd ~/mlt/'
alias mti='cd ~/mti/'
alias pl='cd ~/presently'
alias rlc='rake log:clear'
alias sc='./script/console'
alias ss='./script/server'
alias streamsage='cd ~/streamsage/'

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
