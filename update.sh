#!/bin/bash

pushd ~/ag_build/the_silver_searcher
  git pull
  ./build.sh
  sudo make install
popd

# fzf - command-line fuzzy finder
pushd ~/.fzf
  git pull 
  ./install
popd
