export LC_ALL=en_GB.UTF-8
export LANG=en_GB.UTF-8

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

# set paths for macports
if [[ "$OSTYPE" == "darwin"* ]]; then
    export PATH="/opt/local/bin:$PATH"
fi

# set paths for OCaml language
test -r $HOME/.opam/opam-init/init.zsh && . $HOME/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# set paths for Rust programming language
export PATH="$HOME/.cargo/bin:$PATH"

# set paths for TensorFlow for Swift
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    export PATH="$HOME/frameworks/tensorswift/usr/bin:$PATH"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    export PATH="/Library/Developer/Toolchains/swift-latest/usr/bin:$PATH"
fi

# set paths for vcpkg
export PATH="$HOME/src/contribute/tools/vcpkg:$PATH"
alias cmake_vcpkg="cmake -DCMAKE_TOOLCHAIN_FILE=/home/titan/resources/src/contribute/tools/vcpkg/utils/buildsystems/vcpkg.cmake"

# set paths for neovim
export EDITOR="/usr/bin/nvim"

# set paths for ghcup
[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"
