#-------------------------------------------------------------------------------
# Homebrewでインストールしたgettext用にpathを追加する
export PATH="/usr/local/opt/gettext/bin:$PATH"
# Homebrewでインストールしたsqlite用にpathを追加する
export PATH="/usr/local/opt/sqlite/bin:$PATH"
# Homebrewでインストールしたopenssl用にpathを追加する
export PATH="/usr/local/opt/openssl/bin:$PATH"
# Homebrewで--with-gettextオプションをつけてコンパイルする際に環境変数を設定する。
# makeファイルのconfigに使われるようなので使用後はコメントアウトする。
#export LDFLAGS="-L/usr/local/opt/gettext/lib"
#export CPPFLAGS="-I/usr/local/opt/gettext/include"
# For compilers to find this software you may need to set:
#export LDFLAGS="-L/usr/local/opt/sqlite/lib"
#export CPPFLAGS="-I/usr/local/opt/sqlite/include"
# For pkg-config to find this software you may need to set:
#export PKG_CONFIG_PATH="/usr/local/opt/sqlite/lib/pkgconfig"
# For compilers to find this software you may need to set:
#export LDFLAGS="-L/usr/local/opt/openssl/lib"
#export CPPFLAGS="-I/usr/local/opt/openssl/include"
#For pkg-config to find this software you may need to set:
#export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig"
#-------------------------------------------------------------------------------
# nodebrew用の環境変数設定
export PATH="$HOME/.nodebrew/current/bin:$PATH"
# Node.jsをインストールする前は無効化しておく
# Homebrew経由でnodebrewをインストールしている場合は、~/.nodebrew/srcが存在していないと
# nodeのインストールでエラーが発生する。
export NODEBREW_ROOT=/usr/local/var/nodebrew
# /usr/local/etc/bash_completion.dにbash補間がインストールされている
#-------------------------------------------------------------------------------
# ターミナル(bash)起動時に.bashrcを読み込む
if [ -f ~/.bashrc ] ; then
  . ~/.bashrc
fi
