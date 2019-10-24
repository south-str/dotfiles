# dotfiles

個人用の設定ファイル集。
なるべくMacとLinuxで使えるようにしたい。

## files

それぞれのファイルについての概要を示す。

|filename|summary|
|---|---|
|readme.md|今読んでいるreadmeファイル|
|setup.sh|dotfiesを各所に配置するためのシェル|
|.bash\_profile|bashログイン時に1回だけ読み込まれる設定|
|.bashrc|bash実行時に毎回読み込まれる設定|
|.common\_run\_command|zsh, bash共用の設定。共用できそうな設定は全てここに書く|
|.vimrc|vim起動時に読み込まれる設定|
|.zshrc|zsh実行時に毎回読み込まれる設定|

## knowledge

設定ファイルを作成する中で得られた知見を書き連ねる。

### manをカラー化する

まずページャに指定されているプログラムがANSI escape codeのSelect Graphic Rendition
に対応しているかを確認する必要がある。
色付き表示するオプションが存在していれば対応しているとみなして良いだろう。

環境変数`MANPAGER`に色付き表示をするオプションをつけたプログラムを指定すれば良い。
そして`LESS_TERMCAP_*`にそれぞれのSGRを定義する。
`*`部分はterminfoのTCap Codeを参考にする。


```sh
export MANPAGER='less -iMRs'
export LESS_TERMCAP_md=$'\E[01;31m'      # Begins bold.
export LESS_TERMCAP_us=$'\E[04;32m'      # Begins underline.
export LESS_TERMCAP_ue=$'\E[0m'          # Ends underline.
export LESS_TERMCAP_mb=$'\E[05;31m'      # Begins blinking.
export LESS_TERMCAP_me=$'\E[0m'          # Ends mode.
export LESS_TERMCAP_so=$'\E[00;47;30m'   # Begins standout-mode.
export LESS_TERMCAP_se=$'\E[0m'          # Ends standout-mode.
```

## zshでgitのリポジトリを表示するには

[Git - ZshでGitを使う](https://git-scm.com/book/ja/v2/Appendix-A%3A-%E3%81%9D%E3%81%AE%E4%BB%96%E3%81%AE%E7%92%B0%E5%A2%83%E3%81%A7%E3%81%AEGit-Zsh%E3%81%A7Git%E3%82%92%E4%BD%BF%E3%81%86)
