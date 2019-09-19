export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"
plugins=(git)

source $ZSH/oh-my-zsh.sh

source ~/.keys/keys.sh

source ~/.scripts/aliases.sh
source ~/.scripts/competitive-programming.sh
source ~/.scripts/crypto.sh
source ~/.scripts/utils.sh
source ~/.scripts/paths.sh
source ~/.scripts/conda.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


