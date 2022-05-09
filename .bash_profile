#-------------------------------------------------------------------------------
# Homebrewでインストールしたgettext用にpathを追加する
export PATH="/usr/local/opt/gettext/bin:$PATH"
# Homebrewでインストールしたsqlite用にpathを追加する
export PATH="/usr/local/opt/sqlite/bin:$PATH"
# Homebrewでインストールしたopenssl用にpathを追加する
export PATH="/usr/local/opt/openssl/bin:$PATH"
# Homebrewでインストールしたcurl用にpathを追加する
export PATH="/usr/local/opt/curl/bin:$PATH"
# Homebrewでインストールしたruby用にpathを追加する
export PATH="/usr/local/opt/ruby/bin:$PATH"
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
###### PHPインストール用 start
# Homebrewでインストールしたbison用にpathを追加する
export PATH="/usr/local/opt/bison/bin:$PATH"
# Homebrewでインストールしたlibxml2用にpathを追加する
export PATH="/usr/local/opt/libxml2/bin:$PATH"
# Homebrewでインストールしたbzip2用にpathを追加する
export PATH="/usr/local/opt/bzip2/bin:$PATH"
# Homebrewでインストールしたlibiconv用にpathを追加する
export PATH="/usr/local/opt/libiconv/bin:$PATH"
# Homebrewでインストールしたkrb5用にpathを追加する
export PATH="/usr/local/opt/krb5/bin:$PATH"
# Homebrewでインストールしたopenssl@1.1用にpathを追加する
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
# Homebrewでインストールしたicu4c用にpathを追加する
export PATH="/usr/local/opt/icu4c/bin:$PATH"
# PHPビルド用PKG_CONFIG_PATH
#export PKG_CONFIG_PATH="/usr/local/opt/krb5/lib/pkgconfig:$PKG_CONFIG_PATH"
#export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig:$PKG_CONFIG_PATH"
#export PKG_CONFIG_PATH="/usr/local/opt/icu4c/lib/pkgconfig:$PKG_CONFIG_PATH"
#####  PHPインストール用 end
#-------------------------------------------------------------------------------
# nodebrew用の環境変数設定
export PATH="$HOME/.nodebrew/current/bin:$PATH"
# Node.jsをインストールする前は無効化しておく <- 間違い。インストール後にsetupを実行していないから
# Homebrew経由でnodebrewをインストールしている場合は、~/.nodebrew/srcが存在していないと
# nodeのインストールでエラーが発生する。 <- setupを実行していないから
# /usr/local/etc/bash_completion.dにbash補完がインストールされている
#-------------------------------------------------------------------------------
# goenv用の設定
GOENV_PATH=/usr/local/bin/goenv
if [ -f $GOENV_PATH ] ; then
  eval "$(goenv init -)"
fi
#-------------------------------------------------------------------------------
# go用の環境変数設定
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"
#-------------------------------------------------------------------------------
# curl用の環境変数設定
export PATH="/usr/local/opt/curl/bin:$PATH"
#-------------------------------------------------------------------------------
# Google Cloud Platform SDK
if [ -f '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc' ]; then
  source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc'
fi
if [ -f '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc' ]; then
  source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc'
fi
#-------------------------------------------------------------------------------
# Homebrewでインストールしたanyenv用にpathを追加する
export PATH="$HOME/.anyenv/bin:$PATH"
# Homebrewでインストールしたanyenvを起動する
eval "$(anyenv init -)"
#-------------------------------------------------------------------------------
# ターミナル(bash)起動時に.bashrcを読み込む
if [ -f ~/.bashrc ] ; then
  . ~/.bashrc
fi
