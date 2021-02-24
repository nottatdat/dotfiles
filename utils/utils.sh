export BETTER_EXCEPTIONS=1

bold=$(tput bold)
normal=$(tput sgr0)

red="\033[0;31m"
green="\033[0;32m"
yellow="\033[0;33m"
blue="\033[0;34m"

# setting for linux server
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    # change keyboard interupted to Ctrl+o
    stty intr ^o

    source $HOME/.utils/kaggle.sh
    source $HOME/.utils/nvidia.sh
    source $HOME/.utils/domain_ip_update.sh
fi

# nvim and tmux
tmux_v() {
    tmux new-session -s -d "$1" /usr/local/bin/nvim
    tmux attach -t $1
}

# helper function for cd command
cdforward() {
    for var in "$@"; do
        if [ -d $var ]; then
            cd $var
        else
            echo "Folder $var does not exist in $(pwd)"
            return 1
        fi
    done
    return 0
}

cdwrap() {
    if (( $# >= 1 )); then
        cdforward $@; return $?
    else
        cd $HOME; return 0
    fi
}

# files/folders utilities
degrade() {
    mkdir _
    mv $1 _/
    mv _ $1
}

backup() {
    cp $1 $1.backup
}

cache() {
    file_name=$1
    mv $1 ~/cache
}

queue() {
    file_name=$1
    cp $1 ~/doc/queue
}

# archiver utilities
compress() {
    tar -cvzf $1.tgz $1
}

extract() {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1    ;;
            *.tar.gz)    tar xvzf $1    ;;
            *.tar.xz)    tar Jxvf $1    ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       rar x $1       ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xvf $1     ;;
            *.tbz2)      tar xvjf $1    ;;
            *.tgz)       tar xvzf $1    ;;
            *.zip)       unzip -d `echo $1 | sed 's/\(.*\)\.zip/\1/'` $1;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)           echo "don't know how to extract '$1'" ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}

# git utilities
gclone() {
    if (( $# == 1 )); then
        git clone --recursive $1
    elif (( $# == 2 )); then
        git clone --recursive "https://github.com/$1/$2"
    fi
}
sclone() {
    if (( $# == 1 )); then
        repo_name=${1##*/}
        gclone $1
        git submodule add $1 $repo_name
    elif (( $# == 2 )); then
        gclone $1 $2
        git submodule add "https://github.com/$1/$2" $2
    fi
}
gremote() {
    if (( $# == 2 )); then
        git remote add $1 $2
    elif (( $# == 3 )); then
        git remote add $1 "https://github.com/$2/$3"
    fi
}

# temperature utilities
alias temp_cpu='watch "sensors | rg -A 4 k10temp-pci"'
alias temp_gpu='watch nvidia-smi'

# ip utilities
get_ip() {
    if (( $# != 1 )); then
        echo "Usage: get_ip <your website>"
        return 1
    fi

    echo $(dig +short $1)
}

get_server_ip() {
    echo $(get_ip ssh.tatd.at)
}

get_my_ip() {
    echo $(dig +short myip.opendns.com @resolver1.opendns.com)
}

# ssh utilities
me() {
    if [ $(get_server_ip) = $(get_my_ip) ]; then
        mosh me.local
    else
        mosh me
    fi
}

# doc utilities
all2pdf() {
    find . -type f -name "*.ps" -execdir ps2pdf {} \; -execdir rm {} \;
    find . -type f -name "*.djvu" -execdir djvu2pdf {} \; -execdir rm {} \;
}
