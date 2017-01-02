#!/usr/bin/env bash

set -eu -o pipefail
#set -vx

time nice -n19 brew update && \
  time nice -n19 brew upgrade && \
  time nice -n19 brew cleanup
