#!/bin/bash
LIB_DIR=~/Dropbox/ctokoro_library
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

if ask "Do you want to change system ruby Readline Library?(for irb japanese input problem)"; then
  # http://d.hatena.ne.jp/zariganitosh/20140923/japanese_irb
  BUNDLE=`ruby -r readline -e 'puts $LOADED_FEATURES.grep /readline/'`
  OLD=`otool -L $BUNDLE | awk '/libedit/{print $1}'`
  NEW=`brew list readline | grep libreadline.dylib`
  sudo install_name_tool -change $OLD $NEW $BUNDLE
fi

if ask "Do you want to install ruby by rbenv-rubybuild?"; then
  INSTALL_RUBY_VERSION="$( rbenv install -l | peco)"
  brew link readline --force
  RUBY_CONFIGURE_OPTS="--with-readline-dir=$(brew --prefix readline)" rbenv install $INSTALL_RUBY_VERSION
fi

if ask "Do you want to install pow?"; then
  curl get.pow.cx | sh
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
