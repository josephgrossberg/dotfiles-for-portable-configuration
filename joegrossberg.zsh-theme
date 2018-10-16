#!/usr/bin/env zsh

setopt promptsubst

autoload -U add-zsh-hook

export GIT_RADAR_COLOR_BRANCH="$fg_bold[black]"

function short_dir() {
    pwd | sed -e "s,^$HOME,~," | sed 's/\([^/]\)[^/]*/\1/g';
}

export PROMPT='%{$fg_bold[black]%}[%D{%H:%M:%S}]%{$reset_color%} $(short_dir)%{$fg_bold[black]%}$(git-radar --zsh --fetch)
» %{$reset_color%}';


