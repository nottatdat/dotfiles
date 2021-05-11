#!/bin/bash
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

apath() {
    new_path="$(pwd)"
	  if [ $# -eq 1 ]; then new_path=$1 fi

	  echo "export PATH=\"$new_path:"'$PATH"' >> $HOME/.utils/paths.sh
}
alias epath="nvim $HOME/.utils/paths.sh"
alias path="echo -e ${PATH//:/\\n}"

# local binaries storage
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"

# set paths for anaconda
source $HOME/.utils/conda.sh

# set paths for CUDA binaries
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    export CUDA_HOME="/usr/local/cuda"
    export PATH="/usr/local/cuda/bin:$PATH"
fi

# set paths for go language
export GOROOT="$HOME/.go"
export GOPATH="$HOME/.go_workspace"
export PATH="$GOROOT/bin:$GOPATH/bin:$PATH"

# set paths for llvm
if [[ "$OSTYPE" == "darwin"* ]]; then
    export PATH="/usr/local/opt/llvm/bin:$PATH"
    export LDFLAGS="-L/usr/local/opt/llvm/lib"
    export CPPFLAGS="-I/usr/local/opt/llvm/include"
fi

# set paths for linux brew
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
fi

# set paths for OCaml language
test -r $HOME/.opam/opam-init/init.zsh && . $HOME/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# set paths for Rust programming language
export PATH="$HOME/.cargo/bin:$PATH"

# set paths for nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# set paths for neovim
export EDITOR="/usr/bin/nvim"

# set paths for ghcup
[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"
