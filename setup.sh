#!/bin/bash
set -x
DROPBOX_DIR=${DROPBOX_DIR:-~/DropBox}
REPO_DIR=${REPO_DIR:-~/setup_mac}
RICTY_FONT_DIR=${RICTY_FONT_DIR:-$DROPBOX_DIR/mac_setting/RictyDiminished}
DEV_DIR=${DEV_DIR:-~/repo}
DROPBOX_DEV_DIR=${DROPBOX_DEV_DIR:-~/DropBox/repo}
set +x

if [[ "${TRACE-0}" == "1" ]]; then
    set -vx
fi

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
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  brew doctor # it might need some commands to be executed guided by above install command
fi

if ask 'Homebrew Brewdler install?'; then
  brew tap Homebrew/brewdler
fi

if ask 'install Dropbox at first?  hint: first sync only neccessary directories (mackup/mac_setting/dotfiles) makes faster to setup '; then
  brew install dropbox
fi

if ask 'oh-my-zsh install?'; then
  curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
  chsh -s /bin/zsh
fi

if ask 'execute brew brewdler?(Brewfile)?'; then
  pushd "$REPO_DIR"
  brew bundle
  popd
fi

if ask 'restore setting from mackup? (need Dropbox directory)'; then
  if ask 'mv original .ssh for restoring mackup?'; then
    mv ~/.ssh ~/.ssh.old
  fi
  mackup restore
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
  defaults write -g InitialKeyRepeat -int 13 # normal minimum is 15 (225 ms)
  defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)
fi

if ask 'install crontab?'; then
  crontab < "$REPO_DIR/_crontab"
fi

if ask 'add execution permit for .git-templates/git-secrets/hooks?'; then
  chmod +x ~/.git-templates/git-secrets/hooks/*
fi

if ask 'setup postfix relay by gmail?'; then
  "$REPO_DIR/postfix_gmail_relay.sh"
fi

if ask "make $DEV_DIR ?"; then
  [ ! -d "$DEV_DIR" ] && sudo mkdir "$DEV_DIR"
  sudo chown "$USER" "$DEV_DIR"
fi

if ask "restore $DEV_DIR from $DROPBOX_DEV_DIR?"; then
  cd "$DROPBOX_DEV_DIR"; for dir in *; do tar -xzf "$dir" -C "$DEV_DIR"; done
fi

if ask 'setup programming languages? (asdf)'; then
  [[ -z $(asdf plugin list | grep ruby) ]]   && asdf plugin add ruby
  [[ -z $(asdf plugin list | grep golang) ]] && asdf plugin add golang
  [[ -z $(asdf plugin list | grep nodejs) ]] && asdf plugin add nodejs
  asdf install ruby latest
  asdf install golang latest
  asdf install nodejs latest
  asdf list | sed 'N;s/\n//' > ~/.tool-versions
fi

if ask 'install git-cz?'; then
  npm install -g git-cz
fi
