export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"
plugins=(
    git
    git-prompt
    shrink-path
    vi-mode
)

source $ZSH/oh-my-zsh.sh

setopt prompt_subst
PS1='%n@%m $(shrink_path -f)> '

source ~/.keys/keys.sh
source ~/.scripts/aliases.sh
source ~/.scripts/competitive-programming.sh
source ~/.scripts/conda.sh
source ~/.scripts/crypto.sh
source ~/.scripts/fuzzy_history.sh
source ~/.scripts/paths.sh
source ~/.scripts/utils.sh
