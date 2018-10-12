#!/usr/bin/env zsh

setopt promptsubst

autoload -U add-zsh-hook

export GIT_RADAR_COLOR_BRANCH="$fg_bold[black]"

export PROMPT="%{$fg_bold[black]%}[%D{%H:%M:%S}]%{$reset_color%} %15<...<%~%<< %{$fg_bold[black]%}\$(git-radar --zsh --fetch)
» %{$reset_color%}";


