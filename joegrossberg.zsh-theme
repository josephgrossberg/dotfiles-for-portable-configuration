#!/usr/bin/env zsh

setopt promptsubst

autoload -U add-zsh-hook

DIRECTORY_INVERSE_COLOR=$FG[244]$BG[000]

export GIT_RADAR_COLOR_BRANCH="$fg_bold[black]"

# export PROMPT='$CURRENT_DIR_PROMPT » '
# export RPROMPT="\$(git-radar --zsh --fetch) [%D{%H:%M:%S}]"
export PROMPT="\$(git-radar --zsh --fetch)
%{$GIT_RADAR_COLOR_BRANCH%} [%D{%H:%M:%S}] %{$reset_color%} %~ %{$GIT_RADAR_COLOR_BRANCH%} » %{$reset_color%}";


