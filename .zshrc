# zmodload zsh/zprof

# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

zstyle ':omz:update' mode disabled  # disable automatic updates

plugins=(git asdf kubectl)

source $ZSH/oh-my-zsh.sh

# User configuration

export EDITOR='nano'

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source ~/dotfiles/alii.sh
if [[ -f "$HOME/proprietary.sh" ]]; then
  source ~/proprietary.sh
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

case $OSTYPE in
  "darwin"*)
  eval "$(/usr/local/bin/brew shellenv)"
  ;;
  "linux-gnu")
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  ;;
  *)
  echo "Unknown OS ($OSTYPE), no OS-dependent setup will be done"
  ;;
esac

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
#[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

autoload -Uz compinit && compinit
which kubectl > /dev/null
if [[ $? -eq 0 ]]; then
  source <(command kubectl completion zsh)
fi

# zprof
