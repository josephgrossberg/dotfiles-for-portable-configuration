#!/usr/bin/env zsh
# shellcheck shell=bash

setopt promptsubst

autoload -U add-zsh-hook

function short_dir() {
    pwd | sed -e "s,^$HOME,~," | sed 's/\([^/]\)[^/]*\//\1\//g';
}

function git_prompt() {
    git-radar --zsh --fetch
}

PROMPT="$(short_dir)$(git_prompt)» ";
export PROMPT
