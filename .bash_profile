# ターミナル(bash)起動時に.bashrcを読み込む
if [ -f ~/.bashrc ] ; then
  . ~/.bashrc
fi
