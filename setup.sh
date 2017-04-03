#!/bin/sh
# セットアップ用環境変数の設定
CURRENT_DIRECTORY=$(pwd)

# ファイルを格納するためのディレクトリを作成する
if [ -f =/.vim ] ; then
  mkdir ~/.vim
fi
# 設定ファイルのシンボリックリンクを$HOME配下に配置する
# 本当はループで回す方がいいけど、まだ数が少ないので直書きで
ln -s ${CURRENT_DIRECTORY}/.bash_profile ~/.bash_profile
ln -s ${CURRENT_DIRECTORY}/.bashrc ~/.bashrc
ln -s ${CURRENT_DIRECTORY}/.vimrc ~/.vimrc
ln -s ${CURRENT_DIRECTORY}/.vim/plugin.vim ~/.vim/plugin.vim
