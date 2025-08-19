#! /usr/bin/bash

sudo pacman -Syu git base-devel zsh-autosuggestions  zsh-completions  zsh-syntax-highlighting


cat << EOF | tee -a ~/.cargo/config.toml
[source]
crates-io = { replace-with = "rsproxy-sparse" }
rsproxy-sparse = { registry = "sparse+https://rsproxy.cn/index/" }
EOF


rustup default stable
rustup component add rust-analyzer
cargo install cargo-shear cargo-expand cargo-msrv cargo-edit cargo-supply-chain  cargo-deny \
  cargo-audit cargo-depgraph cargo-update cargo-cache cargo-xwin cargo-zigbuild cargo-wizard \
  cargo-binstall cargo-get cargo-workspace-unused-pub cargo-insta cargo-autoinherit  cargo-bloat \
  typos-cli git-cliff cargo-nextest cargo-generate



until [[ -x "/usr/bin/paru" ]]; do
  git clone https://aur.archlinux.org/paru.git
  cd paru
  makepkg -si
done
rm -rf paru

if [[ -x "/usr/bin/paru" ]]; then
  paru -Sy --needed linuxqq thunderbird wechat-universal-bwrap wemeet-wayland-screenshare-git \
    python3 python-pip python-msgpack python-black python-ruff cmake ninja gcc clang curl unzip  \
    jq ripgrep tree-sitter nodejs npm go gopls lua-language-server stylua fzf lazygit \
    qemu-full pipewir wireplumber pipewire-pulse pipewire-alsa pipewire-jack shfmt biome \
    cliphist dbeaver sqlitebrowser exa postgresql sqlite rsync parallel-disk-usage bottom yazi \
    ffmpegthumbnailer unarchiver ffmpeg man-db man-pages kdiff3 dos2unix bat fd hexyl \
    libtree zip unrar 7zip viu imagemagick mupdf-tools gwenvied poppler \
    wps-office-cn wps-office-mui-zh-cn ttf-wps-fonts wps-office-fonts openssh lsof gping \
    rustscan asciinema screenkey macchina erdtree dysk bottom acpi bandwhich obs-studio pueue \
    gwenview inkscape gmp pot-translation procs navi qbittorrent gimp atuin wl-clipboard libnotify \
    microsoft-edge-stable-bin microsoft-edge-stable-bin alacritty mako grim  swappy jq slurp
fi

npm config set registry https://registry.npmmirror.com/
sudo npm config set registry https://registry.npmmirror.com/
pip config set global.index-url https://repo.huaweicloud.com/repository/pypi/simple
sudo pip config set global.index-url https://repo.huaweicloud.com/repository/pypi/simple
go env -w GO111MODULE=on
go env -w GOPROXY=https://goproxy.cn,direct
sudo go env -w GO111MODULE=on
sudo go env -w GOPROXY=https://goproxy.cn,direct
sudo npm i -g bash-language-server pyright vscode-langservers-extracted typescript typescript-language-server
