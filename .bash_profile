#-------------------------------------------------------------------------------
# Homebrewでインストールしたgettext用にpathを追加する
export PATH="/usr/local/opt/gettext/bin:$PATH"
# Homebrewで--with-gettextオプションをつけてコンパイルする際に環境変数を設定する。
# makeファイルのconfigに使われるようなので使用後はコメントアウトする。
#export LDFLAGS="-L/usr/local/opt/gettext/lib"
#export CPPFLAGS="-I/usr/local/opt/gettext/include"
#-------------------------------------------------------------------------------
# ターミナル(bash)起動時に.bashrcを読み込む
if [ -f ~/.bashrc ] ; then
  . ~/.bashrc
fi
