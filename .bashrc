# joegross's .bashrc
# User specific aliases and functions

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

source /sw/bin/init.sh
export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH
export PATH=/opt/local/bin:$PATH
export PATH=~/bin:$PATH
export PATH=~/depot_tools:$PATH

###################################

PS1='.::[ \w ]::.\n$ '

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

export SPRING=mti

###################################

alias aliases='sed -n /#START_ALIASES/,/#STOP_ALIASES/p ~/.bashrc | sed -ne /a/p'
#START_ALIASES
alias bc='bc -l'
alias cpan='perl -MCPAN -e shell'
alias cup='cvs -q update -dP | perl -e "
while(<>){
  if(\$_=~/\.pyc\$/)          {;}
  elsif(\$_=~/^C\s\S/)        {print\"\033[1;31m\".\$_.\"\033[0m\";}
  elsif(\$_=~/^M\s\S/)        {print\"\033[1;33m\".\$_.\"\033[0m\";}
  elsif(\$_=~/^cvs\s\S/)      {print\"\033[1;34m\".\$_.\"\033[0m\";}
  elsif(\$_=~/^\?\s\S/)       {print\"\033[1;32m\".\$_.\"\033[0m\";}
  elsif(\$_=~/^A\s\S/)        {print\"\033[1;33m\".\$_.\"\033[0m\";}
  elsif(\$_=~/^R\s\S/)        {print\"\033[1;33m\".\$_.\"\033[0m\";}
  else{print\$_;}
}
"; date'
alias ducks='du -cks * |sort -rn |head -11'
alias eamcs='emacs'
alias fn='find . -name'
alias joegrossberg='ssh joegross@joegrossberg.com'
alias ls='ls -bG'
alias la='ls -abG'
alias ll='ls -abGl'
alias now='ruby -e "puts Time.now.utc.to_i"'

# svn stuff
alias sdiff='svn diff | perl -e "
while(<>){
  if(\$_=~/\.pyc\$/)          {;}
  elsif(\$_=~/^@@/)       {print\"\033[1;33m\".\$_.\"\033[0m\";}
  elsif(\$_=~/^\+/)        {print\"\033[1;32m\".\$_.\"\033[0m\";}
  elsif(\$_=~/^\-/)        {print\"\033[1;31m\".\$_.\"\033[0m\";}
  else{print\$_;}
}";'
alias colorvc='perl -e "
while(<>){
  if(\$_=~/^C\s/)           {print\"\033[1;36m\".\$_.\"\033[0m\";}
  elsif(\$_=~/^U\s/)        {print\"\033[1;34m\".\$_.\"\033[0m\";}
  elsif(\$_=~/^M\s/)        {print\"\033[1;33m\".\$_.\"\033[0m\";}
  elsif(\$_=~/^\?\s/)       {print\"\033[1;35m\".\$_.\"\033[0m\";}
  elsif(\$_=~/^A\s/)        {print\"\033[1;32m\".\$_.\"\033[0m\";}
  elsif(\$_=~/^R\s/)        {print\"\033[1;33m\".\$_.\"\033[0m\";}
  elsif(\$_=~/^D\s/)        {print\"\033[1;31m\".\$_.\"\033[0m\";}
  else{print\$_;}
}
"'
alias sst='svn st | sort | colorvc;'
alias sup='svn up | sort | colorvc;'
sadd () {
  svn status | grep "^\?" | awk '{print $2}' | xargs svn add;
}

#STOP_ALIASES

###################################

alias am='cd ~/amundo/'
alias pl='cd ~/presently'
alias rlc='rake log:clear'
alias sc='./script/console'
alias ss='./script/server'
