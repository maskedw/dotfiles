#!/bin/bash -
#===============================================================================
#
#          FILE: setup.sh
#
#         USAGE: ./setup.sh
#
#   DESCRIPTION:
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (),
#  ORGANIZATION:
#       CREATED: 2014/04/06 23:13
#      REVISION:  ---
#===============================================================================
set -o nounset                              # Treat unset variables as an error

PWD=$(pwd)

TARGET=".vimrc .gvimrc "
TARGET+=" .bash_profile"
TARGET+=" .gdbinit"
TARGET+=" .ctags"
TARGET+=" .astylerc"
TARGET+=" .gitignore"
TARGET+=" .gitconfig.common"
TARGET+=" .grepignore"
TARGET+=" .neosnippets"
TARGET+=" .zshrc"
TARGET+=" .tmux.conf"
TARGET+=" .shrc"
TARGET+=" .dircolors"

for f in $TARGET ; do
    ln -sfv "$PWD/$f" "$HOME/$f"
done

TARGET=".gitconfig.unix"
TARGET+=" .bashrc.unix"
for f in $TARGET ; do
    ln -sfv "$PWD/$f" "$HOME/${f//\.unix/}"
done

ln -sfv "$PWD/vimfiles" "$HOME/.vim"
