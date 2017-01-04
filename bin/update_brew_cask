#!/usr/bin/env bash

set -eu -o pipefail
#set -vx

for c in `brew cask list`; do
  ! brew cask info $c | grep -qF "Not installed" ||
    time nice -n19 brew cask install $c
done &&
time nice -n19 brew cask cleanup &&
for c in /usr/local/Caskroom/*; do
  vl=(`ls -t $c`) &&
  for v in "${vl[@]:1}"; do
    \rm -rf "$c/$v";
  done;
done
