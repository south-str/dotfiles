#-------------------------------------------------------------------------------
# .zshrc for Darwin and Linux
#-------------------------------------------------------------------------------
# zsh, bash共用の.common_run_commandを読み込む
COMMON_RUN_COMMAND=~/.common_run_command
if [ -e ${COMMON_RUN_COMMAND} ]
then source ${COMMON_RUN_COMMAND}
fi
#-------------------------------------------------------------------------------
# git補完(だけにとどまらないかも)
autoload -Uz compinit && compinit
# bashの補完スクリプトも必要
gitCompletion=/usr/local/etc/bash_completion.d/git-completion.bash
if [ -e ${gitCompletion} ]; then
  zstyle ':completion:*:*:git:*' script ${gitCompletion}
fi
# homebrewでインストールされた補完を一括で読み込む
zshCompletion=/usr/local/share/zsh/site-functions
fpath=(${zshCompletion} $fpath)
#-------------------------------------------------------------------------------
# プロンプトの変更
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

setopt prompt_subst # 環境変数PROMPT内で変数を展開するように設定
if [ -e ${gitPrompt}   ]; then
  PROMPT='%m@%n:%F{blue}%~%f%F{green}$(__git_ps1)%f%F{yellow}${ssh}%f'$'\n''$ '
else
  PROMPT='%m@%n:%F{yellow}${ssh}%f%F{blue}%~%f
$ '
fi

# 右プロンプトの変更
RPROMPT="%*"
#-------------------------------------------------------------------------------
