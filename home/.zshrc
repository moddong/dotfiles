if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

setopt histignorealldups sharehistory

bindkey -e

HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history

autoload -Uz compinit
compinit
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# plugin
source /home/mdd/.powerlevel10k/powerlevel10k.zsh-theme
source /home/mdd/.p10k.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# alias
alias ls="ls --color=auto"
alias ll="ls -lh --color=auto"
alias la="ls -Alh --color=auto"
alias reload="source ~/.zshrc"
alias vim="nvim"
alias lg="lazygit"
alias update="sudo pacman -Syyu --noconfirm"
alias autoremove="sudo pacman -Qtdq | sudo pacman -Rns -"
www_proxy="http://127.0.0.1:10808"
toggle_proxy() {
  local proxy="${www_proxy}"
  case $1 in
    set)
      export http_proxy=$proxy https_proxy=$proxy HTTP_PROXY=$proxy HTTPS_PROXY=$proxy
      ;;
    unset)
      unset http_proxy https_proxy HTTP_PROXY HTTPS_PROXY
      ;;
    show)
      echo "\$http_proxy: ${http_proxy}"
      echo "\$https_proxy: ${http_proxy}"
      echo "\$HTTP_PROXY: ${HTTP_PROXY}"
      echo "\$HTTPS_PROXY: ${HTTP_PROXY}"
      ;;
    *) return 0
  esac
}

# env
path_add() {
  if [[ -d "${1}" ]] && ! [[ "${PATH}" =~ "${1}" ]]; then
    PATH="${1}:${PATH}"
  fi
}

export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/var"

export GOPATH="$XDG_DATA_HOME/go"
export GOBIN="$XDG_DATA_HOME/go/bin"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"

path_add "$GOBIN"
path_add "$CARGO_HOME/bin"
unset -f path_add

export editor=nvim
