#!/usr/bin/env zsh
#local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

setopt promptsubst

autoload -U add-zsh-hook

DIRECTORY_INVERSE_COLOR=$FG[000]$BG[059]

prompt_mail_count() {
  MAIL_COUNT_PATH="~/bin/mail_count.scpt"
  if [ -f $MAIL_COUNT_PATH ]; then
    osascript $MAIL_COUNT_PATH
  fi
}

export GIT_RADAR_COLOR_BRANCH="$fg_bold[black]"
CURRENT_DIR_PROMPT="%{$DIRECTORY_INVERSE_COLOR%} %~ %{$reset_color%}"

export PROMPT='$CURRENT_DIR_PROMPT » '
export RPROMPT="\$(git-radar --zsh --fetch) [%D{%H:%M:%S}]"
