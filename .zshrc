echo "TODO: header"

echo "TODO: default"

echo "TODO: bashrc stuff"

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
# GIT ALIASES
###################################
#if [ -f ~/git-completion.zsh ]; then
#    . ~/git-completion.zsh
#fi
echo "TODO: git branch completion"

[[ -s "/Users/joegrossberg/.rvm/scripts/rvm" ]] && source "/Users/joegrossberg/.rvm/scripts/rvm"  # This loads RVM into a shell session.

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

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
