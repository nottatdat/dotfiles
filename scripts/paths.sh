export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

apath() {
	new_path="$(pwd)"
	if [ $# -eq 1 ]; then new_path=$1 fi

	echo "export PATH=\"$new_path:"'$PATH"' >> $HOME/.scripts/paths.sh
}
alias epath="vim $HOME/.scripts/paths.sh"

#export LD_LIBRARY_PATH="$HOME/frameworks/anaconda3/envs/ml/lib:$LD_LIBRARY_PATH"

export GOPATH="$HOME/.go"

export CUDA_HOME="/usr/local/cuda"

export PATH="$HOME/bin:$PATH"
export PATH="/usr/local/cuda/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/frameworks/tensorswift/usr/bin:$PATH"

source $HOME/.ghcup/env
