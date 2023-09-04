#! /usr/bin/bash
#set -e

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
  go install golang.org/x/tools/gopls@latest
  go install github.com/segmentio/golines@latest
  cargo install stylua

  info "install lua lsp server"
  local lua_lsp_home="${HOME}/.local/share/nvim/lua-language-server"
  rm -rf "${lua_lsp_home}"
  mkdir -p "${lua_lsp_home}"

  while [[ ! -e lua-language-server.tar.gz ]]; do
    local lua_lsp_tag=$(curl -s https://api.github.com/repos/LuaLS/lua-language-server/releases/latest | jq -r '.tag_name')
    curl -fL "https://github.com/LuaLS/lua-language-server/releases/download/${lua_lsp_tag}/lua-language-server-${lua_lsp_tag}-linux-x64.tar.gz" -o lua-language-server.tar.gz
  done
  tar -xvf lua-language-server.tar.gz -C "${lua_lsp_home}"
  rm -rf lua-language-server.tar.gz
}

nvim() {
  info "install nvim-nightly"
  while [ ! -e ./nvim-linux64.tar.gz ]; do
    curl -fLO "https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz"
  done
  tar -xvf nvim-linux64.tar.gz
  sudo cp -r nvim-linux64/{bin,lib,share} /usr/local
  sudo cp -r nvim-linux64/man/man1/nvim.1 /usr/local/share/man/man1/
  rm -rf nvim-linux64*
}

utils() {
  info "install tree-sitter"
  while [[ ! -e ./tree-sitter-linux-x64.gz ]]; do
    local tree_sitter_tag=$(curl -s https://api.github.com/repos/tree-sitter/tree-sitter/releases/latest | jq -r '.tag_name')
    curl -fLO "https://github.com/tree-sitter/tree-sitter/releases/download/${tree_sitter_tag}/tree-sitter-linux-x64.gz"
  done
  gzip -d tree-sitter-linux-x64.gz
  [[ -e /usr/local/bin/tree-sitter ]] && sudo rm /usr/local/bin/tree-sitter
  chmod +x tree-sitter-linux-x64
  sudo mv tree-sitter-linux-x64 /usr/local/bin/tree-sitter

  info "install py formater black"
  while [[ ! -e ./black_linux ]]; do
    local black_tag=$(curl -s https://api.github.com/repos/psf/black/releases/latest  | jq -r '.tag_name')
    curl -fLO "https://github.com/psf/black/releases/download/${black_tag}/black_linux"
  done
  [[ -e /usr/local/bin/black ]] && sudo rm /usr/local/bin/black
  chmod +x black_linux
  sudo mv black_linux /usr/local/bin/black
}

basic() {
  sudo apt install -y zsh zsh-autosuggestions zsh-syntax-highlighting \
                      python3 python3-pip gcc clang wget golang curl  \
                      unzip jq ripgrep clangd clang-format \
                      fonts-jetbrains-mono fonts-lxgw-wenkai
  sudo chsh -s /bin/zsh md

  git clone https://github.com/romkatv/powerlevel10k.git
  sudo mkdir /usr/share/zsh/plugins
  sudo mv powerlevel10k /usr/share/zsh/plugins/zsh-theme-powerlevel10k
  sudo mv /usr/share/zsh-autosuggestions /usr/share/zsh-syntax-highlighting /usr/share/zsh/plugins

  info 'fonts install!'
  sudo cp -r ./fonts/* /usr/share/fonts
  sudo fc-cache -fv
}

registry() {
  info "config npm's and pip's registry and goproxy"
  npm config set registry https://registry.npmmirror.com/
  sudo npm config set registry https://registry.npmmirror.com/
  pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
  sudo pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
  go env -w GO111MODULE=on
  go env -w GOPROXY=https://goproxy.cn,direct
  sudo go env -w GO111MODULE=on
  sudo go env -w GOPROXY=https://goproxy.cn,direct
}

link_file() {
  rm -rf "$2"
  ln -sv "$1" "$2"
}

config() {
  info "install dotfiles"
  sleep 1
  local dotfiles="$(pwd)"
  local dotfiles_home="${dotfiles}/home"
  local dotfiles_config="${dotfiles}/config"

  for filename in $(ls ${dotfiles_home}); do
    link_file "${dotfiles_home}/${filename}" "${HOME}/.${filename}"
  done

  for filename in $(ls ${dotfiles_config}); do
    link_file "${dotfiles_config}/${filename}" "${HOME}/.config/${filename}"
  done
  info 'Dotfiles successfuly installed!'
}

main() {
  if [[ $# -eq 0 ]]; then
    info 'run command [ ./util.sh lsp      ] to install lsp server'
    info 'run command [ ./util.sh nvim     ] to install nvim-nightly'
    info 'run command [ ./util.sh utils    ] to install tree-sitter black'
    info 'run command [ ./util.sh registry ] to configure the registry of npm pip go rust'
    info 'run command [ ./util.sh basic    ] to install basic software'
    info 'run command [ ./util.sh config   ] to install dotfiles'
  else
    for fn in "$@"; do
      ${fn}
    done
  fi
}

main "$@"
