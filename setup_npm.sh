#!/usr/bin/env bash

set -Ceu -o pipefail
set -x
NPM_PACKAGES=${NPM_PACKAGES:-~/npm_packages}
set +x

ask() {
  printf "$* [y/n] "
  local answer
  read answer

  case $answer in
    "yes" ) return 0 ;;
    "y" )   return 0 ;;
    * )     return 1 ;;
  esac
}

if ask "Do you want to install npm packages from "; then
  # https://stackoverflow.com/questions/32628351/export-import-npm-global-packages
  xargs npm install --global < "$NPM_PACKAGES"
fi
