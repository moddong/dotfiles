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

black() {
    info "install py formater black"
    while [[ ! -e ./black_linux ]]; do
        local black_tag=$(curl -s https://api.github.com/repos/psf/black/releases/latest  | jq -r '.tag_name')
        curl -fLO "https://github.com/psf/black/releases/download/${black_tag}/black_linux"
    done
    [[ -e /usr/local/bin/black ]] && sudo rm /usr/local/bin/black
    chmod +x black_linux
    sudo mv black_linux /usr/local/bin/black
}

arch() {
    echo -e "\n[archlinuxcn]\nServer = https://mirrors.ustc.edu.cn/archlinuxcn/\$arch" | sudo tee -a /etc/pacman.conf
    sudo pacman -Syu
    sudo pacman -S archlinuxcn-keyring

    yay --noconfirm -Syu zsh-autosuggestions  zsh-completions  zsh-syntax-highlighting zsh-theme-powerlevel10k \
        python3 python-pip cmake ninja gcc clang curl unzip jq ripgrep lua-language-server proxychains \
        tree-sitter nodejs npm rustup rust-analyzer go gopls tmux wl-clipboard linuxqq \
        fzf wqy-microhei ttf-lxgw-wenkai adobe-source-han-sans-cn-fonts ttf-font-awesome noto-fonts-emoji \
        waybar grim swappy slurp imv firefox nemo nemo-fileroller hyprpaper wofi hyprland \
        pavucontrol less python-msgpack doxygen mpv xpdf fcitx5-im fcitx5-rime fcitx5-nord

    rustup default stable

    sudo chsh -s /bin/zsh mdd

    info 'fonts install!'
    sudo cp -r ./fonts/* /usr/share/fonts
    sudo fc-cache -fv

    npm config set registry https://registry.npmmirror.com/
    sudo npm config set registry https://registry.npmmirror.com/
    pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
    sudo pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
    go env -w GO111MODULE=on
    go env -w GOPROXY=https://goproxy.cn,direct
    sudo go env -w GO111MODULE=on
    sudo go env -w GOPROXY=https://goproxy.cn,direct

    ENV_VARS=(
        'QT_IM_MODULE=fcitx'
        'XMODIFIERS=@im=fcitx'
        'SDL_IM_MODULE=fcitx'
        'GLFW_IM_MODULE=fcitx'
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
    sleep 1
    local dotfiles="${HOME}/.dotfiles"
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
        info 'script must have one or more arguments: lsp nvim black arch config '
    else
        for fn in "$@"; do
            ${fn}
        done
    fi
}

main "$@"
