export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH="/usr/local/Cellar/git/2.11.0/bin:$PATH"
eval $(gdircolors ~/Second/gitClone/dircolors-solarized/dircolors.ansi-universal)
#export RBENV_ROOT=/usr/local/var/rbenv
[[ -d ~/.rbenv ]] && \
  export PATH=$HOME/.rbenv/bin:$PATH && \
  eval "$(rbenv init -)"
alias ls='gls --color=auto'
alias gls='gls --color=auto'
