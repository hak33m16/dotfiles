#!/bin/bash

# general
alias ls="lsd --group-dirs first"

# git
fu() {
  local master=${1:-main}
  local branch=$(git --no-pager rev-parse --abbrev-ref HEAD)
  git checkout $master &&
    git pull upstream $master &&
    git pull --rebase upstream $master &&
    git checkout "$branch"
}
alias gs="git status"
alias gd="git diff"
alias gcb="git checkout -b"
alias gcm="git commit -m"

# machine
alias isleep="pmset sleepnow"

# dns
# ip txt record
iptxt() {
  local name=$(dig +short -x $1)
  dig +short txt "$name" | jq fromjson
}

# generic txt record
gtxt() {
  dig +short txt "$1"
}
