#!/usr/bin/env zsh

setopt promptsubst

autoload -U add-zsh-hook

DIRECTORY_INVERSE_COLOR=$FG[244]$BG[000]

export GIT_RADAR_COLOR_BRANCH="$fg_bold[black]"
CURRENT_DIR_PROMPT="%{$DIRECTORY_INVERSE_COLOR%} %~ %{$reset_color%}"

export PROMPT='$CURRENT_DIR_PROMPT » '
export RPROMPT="\$(git-radar --zsh --fetch) [%D{%H:%M:%S}]"
