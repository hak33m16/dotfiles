#!/bin/bash

# general
alias ls="lsd --group-dirs first"

# git
fu() {
  local branch=$(git --no-pager rev-parse --abbrev-ref HEAD)
  git checkout main
  git pull upstream main
  git pull --rebase upstream main
  git checkout "$branch"
}
alias gs="git status"
alias gd="git diff"
alias gcb="git checkout -b"
alias gcm="git commit -m"

# machine
alias isleep="pmset sleepnow"
