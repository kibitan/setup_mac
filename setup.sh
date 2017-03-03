#!/bin/bash
set -x
DROPBOX_DIR=${DROPBOX_DIR:-~/DropBox}
REPO_DIR=${REPO_DIR:-~/setup_mac}
RICTY_FONT_DIR=${RICTY_FONT_DIR:-$DROPBOX_DIR/C&S/material/RictyDiminished}
DEV_DIR=${DEV_DIR:-~/www}
DROPBOX_DEV_DIR=${DROPBOX_DEV_DIR:-~/DropBox/www}
set +x

ask() {
  printf "%s [y/n] " "$*"
  local answer
  read -r answer

  case $answer in
    "yes" ) return 0 ;;
    "y" )   return 0 ;;
    * )     return 1 ;;
  esac
}

set -e

if ask 'xcode install?'; then
  xcode-select --install
fi

if ask 'Homebrew install?'; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  brew doctor
fi

if ask 'Homebrew Brewdler install?'; then
  brew tap Homebrew/brewdler
fi

if ask 'oh-my-zsh install?'; then
  brew install zsh
  curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
  chsh -s /bin/zsh
fi

if ask 'execute brew brewdler?(Brewfile)?'; then
  pushd "$REPO_DIR"
  brew bundle
  popd
fi

if ask 'install Ricty font?'; then
  # https://github.com/edihbrandon/RictyDiminished
  [[ ! -d $RICTY_FONT_DIR ]] && git clone git@github.com:edihbrandon/RictyDiminished.git
  find "$RICTY_FONT_DIR" -name "*.ttf" -print0 | xargs -0 open
fi

## mac setting
if ask "set 'locate' command?"; then
  sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist
fi

if ask 'set visible dotfiles in finder?'; then
  defaults write com.apple.finder AppleShowAllFiles TRUE
  killall Finder
fi

if ask 'set fullpath title at finder?'; then
  defaults write com.apple.finder _FXShowPosixPathInTitle -bool yes
  killall Finder
fi

if ask 'set always expand save dialog?'; then
  defaults write -g NSNavPanelExpandedStateForSaveMode -bool yes
fi

if ask 'set mute in mac booting sound?'; then
  sudo nvram SystemAudioVolume=%80
fi

# for macOS Sierra
# http://qiita.com/bsdmad/items/d8099682c17b6df74baa
if ask 'set keyboard keyrepeat faster?'; then
  defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
  defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)
fi

if ask 'restore setting from mackup? (need Dropbox directory)'; then
  echo 'warning: do not overwrite .ssh/config, it will be deleted...'
  mackup restore
fi

if ask 'install crontab?'; then
  crontab < "$REPO_DIR/_crontab"
fi

if ask "make $DEV_DIR ?"; then
  [ ! -d "$DEV_DIR" ] && sudo mkdir "$DEV_DIR"
  sudo chown "$USER DEV_DIR"
fi

if ask "restore $DEV_DIR from $DROPBOX_DEV_DIR?"; then
  cd "$DROPBOX_DEV_DIR"; for dir in *; do tar -xzf "$dir" -C "$DEV_DIR"; done
fi

if ask 'execute ruby setup?'; then
  "$REPO_DIR/ruby/init.sh"
fi
