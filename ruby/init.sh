#!/bin/bash
pushd ~

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

if ask "Do you want to install ruby by rbenv-rubybuild?"; then
  INSTALL_RUBY_VERSION="$( rbenv install -l | peco)"
  brew link readline --force
  RUBY_CONFIGURE_OPTS="--with-readline-dir=$(brew --prefix readline)" rbenv install $INSTALL_RUBY_VERSION
fi

if ask "Do you want to setup global ruby version?"; then
  rbenv global $(rbenv versions | peco)
fi

if ask "Do you want to setup puma-dev?"; then
  sudo puma-dev -setup
  puma-dev -install
fi

if ask "Do you want to install Gemfile?"; then
  gem install bundler
  bundle install -j4
fi

echo
echo 'search old gems...'
bundle outdated
echo

if ask "Do you want to update Gemfile?"; then
  bundle update

  if ask "Do you want to clean up old Gem?"; then
    bundle clean --force
  fi
fi

# echo "Do you want to create rdocs for Gemfile (using for Dash)? [y/n]"
# read ANS
# if [ $ANS = 'y' -o $ANS = 'yes' ]; then
#   gem rdoc --rdoc --all
# fi

popd
