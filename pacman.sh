#! /usr/bin/bash


PKGLIST=()

sudo pacman -S git base-devel
sudo pacman  --noconfirm -Syu zsh-autosuggestions  zsh-completions  zsh-syntax-highlighting \
  python3 python-pip python-msgpack python-black python-ruff cmake ninja gcc clang curl unzip jq ripgrep proxychains \
  tree-sitter nodejs npm go gopls lua-language-server stylua fzf lazygit


curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup default stable
rustup component add rust-analyzer

npm config set registry https://registry.npmmirror.com/
sudo npm config set registry https://registry.npmmirror.com/
pip config set global.index-url https://repo.huaweicloud.com/repository/pypi/simple
sudo pip config set global.index-url https://repo.huaweicloud.com/repository/pypi/simple
go env -w GO111MODULE=on
go env -w GOPROXY=https://goproxy.cn,direct
sudo go env -w GO111MODULE=on
sudo go env -w GOPROXY=https://goproxy.cn,direct
sudo npm i -g bash-language-server pyright vscode-langservers-extracted typescript typescript-language-server
[ -e ${CARGO_HOME} ] || mkdir -vp ${CARGO_HOME:-$XDG_DATA_HOME/cargo}
cat << EOF | tee -a ${CARGO_HOME:-$XDG_DATA_HOME}/config.toml
[source]
crates-io = { replace-with = "rsproxy-sparse" }
rsproxy-sparse = { registry = "sparse+https://rsproxy.cn/index/" }

EOF
