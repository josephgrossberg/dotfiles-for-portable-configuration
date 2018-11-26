#!/usr/bin/env zsh

setopt promptsubst

autoload -U add-zsh-hook

export GIT_RADAR_COLOR_BRANCH="$fg_bold[black]"

function short_dir() {
    pwd | sed -e "s,^$HOME,~," | sed 's/\([^/]\)[^/]*\//\1\//g';
}

function git_prompt() {
    git-radar --zsh --fetch |
        # output is "(", then first match, then "..." subbed for \2
        sed 's/(\([^)]\{15,127\}\)\([^)]*\)/(\1.../';
}

export PROMPT='$(short_dir)%{$fg_bold[black]%}$(git_prompt)%{$fg_bold[black]%}» %{$reset_color%}';
