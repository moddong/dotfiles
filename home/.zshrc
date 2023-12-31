if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

setopt histignorealldups sharehistory

bindkey -e

HISTSIZE=10000
SAVEHIST=10000
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
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# alias
alias ls="ls --color=auto"
alias ll="ls -lh --color=auto"
alias la="ls -Alh --color=auto"
alias reload="source ~/.zshrc"
alias vi="nvim"
alias lg="lazygit"
alias update="sudo pacman -Syyu --noconfirm"
alias autoremove="sudo pacman -Qtdq | sudo pacman -Rns -"
proxy() {
    if [ -d /mnt/c/ ]; then
        export HTTP_PROXY="http://192.168.0.110:10811"
        export HTTPS_PROXY="http://192.168.0.110:10811"
    else
        export HTTP_PROXY="http://127.0.0.1:10811"
        export HTTPS_PROXY="http://127.0.0.1:10811"
    fi
}
alias unproxy="unset HTTP_PROXY;unset HTTPS_PROXY"

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
