#! /usr/bin/bash

info() {
  echo -e "\e[1;32m${@}\e[0m"
}

lsp() {
  info "install lsp server by npm"
  sudo npm i -g pyright
  sudo npm i -g vscode-langservers-extracted
  sudo npm i -g typescript typescript-language-server
  sudo npm i -g bash-language-server
  sudo npm i -g @tailwindcss/language-server
  sudo npm i -g prettier
}

nvim() {
  info "install nvim-nightly"
  while [ ! -e ./nvim-linux64.tar.gz ]; do
    curl -fLO "https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz"
  done
  tar -xvf nvim-linux64.tar.gz
  sudo cp -r nvim-linux64/* /usr/local
  rm -rf nvim-linux64*
}

arch() {
  sudo pacman  --noconfirm -Syu zsh-autosuggestions  zsh-completions  zsh-syntax-highlighting zsh-theme-powerlevel10k \
    python3 python-pip python-msgpack python-black cmake ninja gcc clang curl unzip jq ripgrep lua-language-server proxychains \
    tree-sitter nodejs npm rustup rust-analyzer go gopls tmux fzf lazygit elisa kitty alacritty

  rustup default stable

  sudo chsh -s /bin/zsh mdd

  npm config set registry https://registry.npmmirror.com/
  sudo npm config set registry https://registry.npmmirror.com/
  pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
  sudo pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
  go env -w GO111MODULE=on
  go env -w GOPROXY=https://goproxy.cn,direct
  sudo go env -w GO111MODULE=on
  sudo go env -w GOPROXY=https://goproxy.cn,direct
  [ -e ${CARGO_HOME} ] || mkdir -p ${CARGO_HOME}
  echo -e "[source.crates-io]\nreplace-with = "ustc"\n\n[source.ustc]\nregistry = "https://mirrors.ustc.edu.cn/crates.io-index"" | tee -a ${CARGO_HOME}/config

  ENV_VARS=(
    "QT_IM_MODULE=fcitx5"
    "XMODIFIERS=@im=fcitx5"
    "SDL_IM_MODULE=fcitx5"
    "GLFW_IM_MODULE=fcitx5"
  )
  for var in "${ENV_VARS[@]}"; do
    echo "$var" | sudo tee -a /etc/environment
  done
}
link_file() {
  rm -rf "$2"
  ln -sv "$1" "$2"
}

config() {
  info "install dotfiles"
  local dotfiles="${HOME}/.dotfiles"
  local dotfiles_home="${dotfiles}/home"
  local dotfiles_config="${dotfiles}/config"

  shopt -s dotglob
  for filename in ${dotfiles_home}/*; do
    filename=$(basename $filename)
    link_file "${dotfiles_home}/${filename}" "${HOME}/${filename}"
  done
  shopt -u dotglob

  for filename in ${dotfiles_config}/*; do
    filename=$(basename $filename)
    link_file "${dotfiles_config}/${filename}" "${HOME}/.config/${filename}"
  done
  info "Dotfiles successfuly installed!"
}

main() {
  if [[ $# -eq 0 ]]; then
    info "script must have one or more arguments: lsp nvim arch config"
  else
    for fn in "$@"; do
      ${fn}
    done
  fi
}

main "$@"
