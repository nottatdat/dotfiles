export BETTER_EXCEPTIONS=1

bold=$(tput bold)
normal=$(tput sgr0)

red="\033[0;31m"
green="\033[0;32m"
yellow="\033[0;33m"
blue="\033[0;34m"

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

# kitty ssh
alias ssh="kitty +kitten ssh"

# speedtest
alias speedtest="wget --output-document=/dev/null http://speedtest.wdc01.softlayer.com/downloads/test500.zip"

# doc utilities
all2pdf() {
    find . -type f -name "*.ps" -execdir ps2pdf {} \; -execdir rm {} \;
    find . -type f -name "*.djvu" -execdir djvu2pdf {} \; -execdir rm {} \;
}
