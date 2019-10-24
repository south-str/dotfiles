#!/bin/sh
###
# @(#) setup.sh ver 0.0.x 04.13.2017
#
# Usage:
#  no parameters
#
# Description:
#  This script setup my local development environment.
###

# セットアップ用環境変数の設定
CURRENT_DIRECTORY=$(pwd)

# ファイルを格納するためのディレクトリを作成する
echo "make directories"
if [ -d ~/.vim ] ; then
  echo "~/.vim directory is exists"
else
  mkdir ~/.vim
fi
# 設定ファイルのシンボリックリンクを$HOME配下に配置する
# 本当はループで回す方がいいけど、まだ数が少ないので直書きで
echo "create links"
ln -s ${CURRENT_DIRECTORY}/.common_profile ~/.common_profile
ln -s ${CURRENT_DIRECTORY}/.bash_profile ~/.bash_profile
ln -s ${CURRENT_DIRECTORY}/.zprofile ~/.zprofile
ln -s ${CURRENT_DIRECTORY}/.common_run_command ~/.common_run_command
ln -s ${CURRENT_DIRECTORY}/.bashrc ~/.bashrc
ln -s ${CURRENT_DIRECTORY}/.zshrc ~/.zshrc
ln -s ${CURRENT_DIRECTORY}/.vimrc ~/.vimrc
if [ -d ~/.vim ] ; then
  ln -s ${CURRENT_DIRECTORY}/.vim/plugin.vim ~/.vim/plugin.vim
else
  echo "~/.vim directory is not exists"
fi

echo "download dein"
cd ~/.vim
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.vim
echo "open vim and execute [:call dein#install()]"
