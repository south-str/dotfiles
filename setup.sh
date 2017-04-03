#!/bin/sh
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
ln -s ${CURRENT_DIRECTORY}/.bash_profile ~/.bash_profile
ln -s ${CURRENT_DIRECTORY}/.bashrc ~/.bashrc
ln -s ${CURRENT_DIRECTORY}/.vimrc ~/.vimrc
if [ -d ~/.vim ] ; then
  ln -s ${CURRENT_DIRECTORY}/.vim/plugin.vim ~/.vim/plugin.vim
else
  echo "~/.vim directory is not exists"
fi
