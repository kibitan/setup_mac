#!/bin/bash
DROPBOX_DIR=~/DropBox
REPO_DIR=$DROPBOX_DIR/setup_mac

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
  pushd $REPO_DIR
  brew bundle
  popd
fi

if ask 'install diff-highlight?'; then
  wget https://raw.github.com/git/git/master/contrib/diff-highlight/diff-highlight && chmod +x diff-highlight && sudo mv diff-highlight /usr/local/bin
fi

# https://github.com/yascentur/RictyDiminished
if ask 'install Ricty font?'; then
  ls $DROPBOX_DIR/materials/RictyDiminished-master/*.ttf | xargs open
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
  crontab < $REPO_DIR/_crontab
fi

if ask 'make /var/www?'; then
  [ ! -d /var/www ] && sudo mkdir /var/www
  sudo chown $USER /var/www
fi

if ask 'restore /var/www?'; then
  cd $DROPBOX_DIR/www/; for dir in *; do tar -xzf $dir -C /var/www ; done
fi

if ask 'execute ruby setup?'; then
  $REPO_DIR/ruby/init.sh
fi
