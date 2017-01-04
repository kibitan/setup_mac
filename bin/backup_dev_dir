#!/usr/bin/env bash

set -eu -o pipefail
#set -vx

cd /var/www &&
for dir in `find ./* -maxdepth 4 -mmin -360 | cut -f2 -d / | uniq`; do
  echo $dir &&
  time nice -n19 tar -czf ~/Dropbox/www/$dir.tar.gz --exclude ./vendor/bundle --exclude ./cookbooks --exclude '*.log' --exclude ./node_modules $dir
done
