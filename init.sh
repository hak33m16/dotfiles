#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

help() {
  echo "\
Dotfiles Initializer

Usage:
-w, --wet-run: Actually perform the operations
"
}

while test $# -gt 0; do
  case "$1" in
  -h | --help)
    help
    exit 0
    ;;

  -w | --wet-run)
    export WET_RUN=true
    shift
    ;;

  *)
    echo "ERROR: Unrecognized argument '$1'"
    help
    exit 1
    ;;
  esac
done

if [[ $WET_RUN != true ]]; then
  echo "In dry-run mode"
fi

# for each file in here
# if it's a file (not directory) and starts with .
#   if no files/symlinks for it in the home dir exist
#      create a symlink in the home dir pointing to here
for file in .*; do
  if [[ ! -d "$file" ]]; then
    if [[ ! -d "$HOME/$file" ]]; then
      if [[ $WET_RUN == true ]]; then
        ln -s "$SCRIPT_DIR/$file" "$HOME/$file"
        ls -lAh -1 "$HOME/$file"
      else
        echo "Would create symlink in home for '$file'"
      fi
    else
      echo "File '$file' already exists in the home directory, skipping symlink creation"
    fi
  fi
done
