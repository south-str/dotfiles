#-------------------------------------------------------------------------------
# Homebrewでインストールしたgettext用にpathを追加する
export PATH="/usr/local/opt/gettext/bin:$PATH"
# Homebrewで--with-gettextオプションをつけてコンパイルする際に環境変数を設定する。
# makeファイルのconfigに使われるようなので使用後はコメントアウトする。
#export LDFLAGS="-L/usr/local/opt/gettext/lib"
#export CPPFLAGS="-I/usr/local/opt/gettext/include"
#-------------------------------------------------------------------------------
# nodebrew用の環境変数設定
export PATH="$HOME/.nodebrew/current/bin:$PATH"
# Node.jsをインストールする前は無効化しておく
# Homebrew経由でnodebrewをインストールしている場合は、~/.nodebrew/srcが存在していないと
# nodeのインストールでエラーが発生する。
export NODEBREW_ROOT=/usr/local/var/nodebrew
# /usr/local/etc/bash_completion.dにbash保管がインストールされている
#-------------------------------------------------------------------------------
# ターミナル(bash)起動時に.bashrcを読み込む
if [ -f ~/.bashrc ] ; then
  . ~/.bashrc
fi
