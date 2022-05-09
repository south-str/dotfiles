#-------------------------------------------------------------------------------
# .bashrc for Darwin and Linux
#-------------------------------------------------------------------------------
# zsh, bash共用の.common_run_commandを読み込む
COMMON_RUN_COMMAND=~/.common_run_command
if [ -e ${COMMON_RUN_COMMAND} ]
then source ${COMMON_RUN_COMMAND}
fi
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

## nodebrewの補完
nodebrewCompletion=/usr/local/etc/bash_completion.d/nodebrew
if [ -e ${nodebrewCompletion} ]; then
  source ${nodebrewCompletion}
fi

## dockerの補完
dockerCompletion=/usr/local/etc/bash_completion.d/docker
if [ -e ${dockerCompletion} ]; then
  source ${dockerCompletion}
fi

## pandocの補完
pandocCompletion=/usr/local/etc/bash_completion.d/pandoc
if [ -e ${pandocCompletion} ]; then
  eval "$(pandoc --bash-completion)"
fi
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
