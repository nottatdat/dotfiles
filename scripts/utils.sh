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

    source ./kaggle.sh
    source ./nvidia.sh
    source ./domain_ip_update.sh
fi

backup() {
    cp $1 $1.backup
}

cache() {
    file_name=$1
    mv "$1" ~/cache
}

queue() {
    file_name=$1
    cp "$1" ~/doc/queue
}

extract () {
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

djvu2pdf() {
    find . -type f -name "*.ps" -execdir ps2pdf {} \; -execdir rm {} \;
    find . -type f -name "*.djvu" -execdir djvu2pdf {} \; -execdir rm {} \;
}
