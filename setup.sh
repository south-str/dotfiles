#!/bin/bash
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
echo "finish make directories"

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
  ln -s ${CURRENT_DIRECTORY}/.vim/plugin.toml ~/.vim/plugin.toml
  ln -s ${CURRENT_DIRECTORY}/.vim/plugin_lazy.toml ~/.vim/plugin_lazy.toml
  echo "finish create links"
else
  echo "~/.vim directory is not exists"
fi

echo "download dein"
cd ~/.vim
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
echo "execute install script"
sh ./installer.sh ~/.vim/dein
echo "finish install script"
echo "---------------------------------------------------------------------------------"
echo "please execute [pip3 install --user pynvim]" # deopleteプラグインをインストールする前に必要になる。
echo "open vim and execute [:call dein#install()]"
