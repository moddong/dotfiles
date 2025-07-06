#! /usr/bin/bash

info() {
  echo -e "\e[1;32m${@}\e[0m"
}

link_file() {
  rm -rf "$2"
  ln -sv "$1" "$2"
}

main() {
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

main
