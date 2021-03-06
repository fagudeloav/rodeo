#!/bin/bash
STARTING_DIR=$(pwd)
TARGET_DIR=~/Projects/yhat/rodeo

cd $TARGET_DIR

#dependencies
./scripts/osx/install-deps.sh
./scripts/osx/install-dist-deps.sh

#remember nvm
echo '#remember nvm'
source $(brew --prefix nvm)/nvm.sh
nvm use $NODE_VERSION

#build distributable
./node_modules/.bin/gulp dist:all

#list created files
echo '#list created files'
git ls-files dist -o -x node_modules --directory

cd $STARTING_DIR
