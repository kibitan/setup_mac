#!/usr/bin/env bash

set -eu -o pipefail
#set -vx

cd ~/setup_mac &&
if [ $(git status --short --untracked-files=no | wc -l) -gt 0 ]; then
  git stash && \
  git pull --rebase && \
  git stash pop
else
  git pull --rebase
fi
/usr/local/bin/brew bundle dump --force && \
git add Brewfile && \
git commit -m "auto commit of Brewfile dump `date "+\%Y-\%m-\%d \%H:\%M:\%S"`" && \
git push
