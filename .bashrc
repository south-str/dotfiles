#-------------------------------------------------------------------------------
# .bashrc for Darwin and Linux
#-------------------------------------------------------------------------------
# manのカラー化。ページャの設定でANSIカラーコードを有効にする。
export MANPAGER='less -iMRs'
# ネットから持ってきた設定
# $LESS_TERMCAP_*の*部分はman terminfoのTCap Codeと思われる。
# $LESS_TERMCAPについてはマニュアルに載っていないっぽい。
# ANSIエスケープシーケンスで色の設定を行う。
# <Esc>[<color code>mで色付け開始、<Esc>[0mで色付け終了(デフォルト設定にする)。
# <Esc>は\eで表す。LESS_TERMCAPに関しては大文字でないと反映されない?
export LESS_TERMCAP_md=$'\E[01;31m'      # Begins bold.
export LESS_TERMCAP_us=$'\E[04;32m'      # Begins underline.
export LESS_TERMCAP_ue=$'\E[0m'          # Ends underline.
export LESS_TERMCAP_mb=$'\E[05;31m'      # Begins blinking.
export LESS_TERMCAP_me=$'\E[0m'          # Ends mode.
export LESS_TERMCAP_so=$'\E[00;47;30m'   # Begins standout-mode.
export LESS_TERMCAP_se=$'\E[0m'          # Ends standout-mode.

#-------------------------------------------------------------------------------
# lsのエイリアスを設定し、色分けされるようにする
# [ ]はtest関数の省略表記。
if [ "$(uname)" == 'Darwin' ]; then
  alias ls='ls -FGh'
  alias ll='ls -FGhl'
  alias la='ls -aFGhl'
elif [ "$(uname)" == 'Linux' ]; then
  alias ls='ls -Fh --color=auto'
  alias ll='ls -Fhl --color=auto'
  alias la='ls -aFhl --color=auto'
fi
## export CLICOLOR=1を設定してもlsで色がつくようになる。このとき-Gはいらない。
## man lsを見てみると、-GをつけることによってCLICOLORを定義することと同等になる。
## LSCOLORSを有効にするには-GかCLICOLORの定義が必要。
#export CLICOLOR=1
## LSCOLORSのデフォルト値。man lsを参照。
#export LSCOLORS=exfxcxdxbxegedabagacad

#-------------------------------------------------------------------------------
# 補完を有効にする
## git-completion.bashはgitをHomebrewでインストールした際のパス(恐らく)
gitCompletion=/usr/local/etc/bash_completion.d/git-completion.bash
if [ -e ${gitCompletion} ]; then
  source ${gitCompletion}
fi

## homebrewの補完
brewCompletion=/usr/local/etc/bash_completion.d/brew
if [ -e ${brewCompletion} ]; then
  source ${brewCompletion}
fi

## dockerの補完
dockerCompletion=/usr/local/etc/bash_completion.d/docker
if [ -e ${dockerCompletion} ]; then
  source ${dockerCompletion}
fi

#-------------------------------------------------------------------------------
# grepの色付け
alias grep='grep --color=auto'

#-------------------------------------------------------------------------------
# promptの表示を変更する
## gitのブランチを表示する
gitPrompt=/usr/local/etc/bash_completion.d/git-prompt.sh
if [ -e ${gitPrompt} ]; then
  source ${gitPrompt}
fi
## 環境変数で__git_ps1のオプションを指定する。詳細はソースコードを参照
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWSTASHSTATE=1

## SSHセッション用プロンプト
if [ -n "${SSH_CLIENT}" ] ; then ssh="[ssh-session]"
fi

## promptの表示を変更する
## ANSIカラーシーケンスは"\e[text;fore;backm"で開始され、元に戻す場合は"\e[0m"で閉じる。
if [ -e ${gitPrompt} ]; then
  export PS1="\h@\u:\[\e[0;34m\]\w\[\e[m\]\n\t\[\e[0;32m\]\$(__git_ps1)\[\e[m\]\[\e[4;32m\]${ssh}\[\e[m\] $ "
else
  export PS1="\h@\u:\[\e[0;34m\]\w\[\e[m\]\n\t\[\e[4;32m\]${ssh}\[\e[m\] $ "
fi
#-------------------------------------------------------------------------------
# XLD.appのCLI設定。XLDについてくるシェルを参考にaliasを設定する。
# これをしておけばインストールするたびにコピーしてというのを防げる。
#XLD_APP="/Applications/XLD.app"

#if [ ! -d "${XLD_APP}" ] ; then
  #echo "XLD.app not found"
  #alias xld="${XLD_APP}/Contents/MacOS/XLD --cmdline $@"
  #exit;
#fi
#-------------------------------------------------------------------------------
