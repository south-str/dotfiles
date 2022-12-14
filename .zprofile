#-------------------------------------------------------------------------------
# .zprofile
#-------------------------------------------------------------------------------
# zsh, bash共用の.common_profileを読み込む
COMMON_PROFILE=~/.common_profile
if [ -e ${COMMON_PROFILE} ]
then source ${COMMON_PROFILE}
fi
#-------------------------------------------------------------------------------
#Homebrew用コマンド
eval "$(/opt/homebrew/bin/brew shellenv)"
