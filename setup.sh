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

PWD=`pwd`
echo $PWD

TARGET=".vimrc .gvimrc .vsvimrc "
TARGET+=".gdbinit .ctags .gitignore .gitconfig.common"
for f in $TARGET ; do
    echo $f
    ln -siv $PWD/$f $HOME/$f
done

TARGET=".gitconfig.unix"
for f in $TARGET ; do
    echo $f
    ln -siv $PWD/$f $HOME/`echo $f | sed s/\.unix//g`
done

ln -siv $PWD/vimfiles $HOME/.vim
