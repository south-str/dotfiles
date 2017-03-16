# 何の設定か忘れた。多分gitとかの設定？
export PATH=/usr/local/bin:usr/bin
#export PATH=$HOME/.nodebrew/current/bin:$PATH
#-------------------------------------------------------------------------------
# Macのmanはカラー化できないようだ。残念。
export MANPAGER='less -iMRs'
#-------------------------------------------------------------------------------
#lsのエイリアスを設定し、色分けされるようにする
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
# glsをlsのエイリアスにし、色分けするようにする
#alias ls='gls --color=auto'
#alias gls='gls --color=auto'
#eval $(gdircolors ~/Product/dircolors-solarized/dircolors.ansi-universal)

#-------------------------------------------------------------------------------
# promptの表示を変更する
## gitのブランチを表示する
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

## SSHセッション用プロンプト
if [ -n "$SSH_CLIENT" ] ; then ssh="[ssh-session]"
fi

## promptの表示を変更する
export PS1="\h@\u:\[\e[0;34m\]\w\[\e[m\]\n\t\[\e[0;32m\]\$(parse_git_branch)${ssh}\[\e[m\] $ "
#-------------------------------------------------------------------------------
