export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

apath() {
    new_path="$(pwd)"
	  if [ $# -eq 1 ]; then new_path=$1 fi

	  echo "export PATH=\"$new_path:"'$PATH"' >> $HOME/.scripts/paths.sh
}
alias epath="nvim $HOME/.scripts/paths.sh"
alias path="echo -e ${PATH//:/\\n}"

# macports
export PATH="/opt/local/bin:$PATH"

# local binaries storage
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"

# set paths for go language
export GOPATH="$HOME/.go"
export PATH="$GOPATH/bin:$PATH"

# set paths for opam for OCaml language
test -r /Users/dat/.opam/opam-init/init.zsh && . /Users/dat/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# set paths for CUDA binaries
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    export CUDA_HOME="/usr/local/cuda"
    export PATH="/usr/local/cuda/bin:$PATH"
fi

# set paths for TensorFlow for Swift
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    export PATH="$HOME/frameworks/tensorswift/usr/bin:$PATH"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    export PATH="/Library/Developer/Toolchains/swift-latest/usr/bin:$PATH"
fi

# set paths for ghcup
source $HOME/.ghcup/env

# set paths for vcpkg
export PATH="/home/titan/src/contribute/tools/vcpkg:$PATH"
alias cmake_vcpkg="cmake -DCMAKE_TOOLCHAIN_FILE=/home/titan/resources/src/contribute/tools/vcpkg/scripts/buildsystems/vcpkg.cmake"
