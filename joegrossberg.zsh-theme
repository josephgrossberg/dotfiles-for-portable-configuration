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

CURRENT_DIR_PROMPT="[%D{%I:%M:%S}] %{$DIRECTORY_INVERSE_COLOR%}%~%{$reset_color%}"
PROMPT='$CURRENT_DIR_PROMPT'
export PROMPT="$CURRENT_DIR_PROMPT\$(git-radar --zsh --fetch)
» "
