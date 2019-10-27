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

### directories aliases
alias win="cdwrap $HOME/src/compete"
alias new="cdwrap $HOME/src/create"
alias work="cdwrap $HOME/src/work"
alias learn="cdwrap $HOME/src/learn"

## personal directories aliases
alias dat="cdwrap $HOME/src/personal"
alias blog="dat blog"
alias dot="dat dotfiles"
alias note="dat notes"

## training directories aliases
alias gym="cdwrap $HOME/src/train"
alias leet="gym leetcode"
alias euler="gym euler"

## open-source contribute directories aliases
alias con="cdwrap $HOME/src/contribute"
alias tool="con tools"
alias dist="con distributed-systems"

### machine learning directories
alias ml="con machine-learning"
alias audio="ml audio"
alias boost="ml boost"
alias cv="ml cv"
alias dl="ml dl-systems"
alias mlml="ml general"
alias nlp="ml nlp"
alias plat="ml platforms"
alias rl="ml rl"

### databases directories
alias db="con databases"
alias redis="db redis"
alias pg="db postgres"

### programming languages directories
alias lang="con languages"
alias rust="lang rust"
alias py="lang python"
alias hask="lang haskell"

### OS
## usual commands
alias hs="history | grep"
alias cdback="cd $OLDPWD"
alias c="clear"
alias wget="wget -c "
alias chksum="shasum -a 256 "
alias now='date +"%T"'
alias nowdate='date +"%d-%m-%Y"'

## network related
alias www="python -m SimpleHTTPServer 8000"
alias speed="speedtest-cli --server 2406 --simple"
alias ip="curl ipinfo.io/ip"
alias ping="ping -c 5"
alias fastping="ping -c 100 -s.2"
alias ports="netstat -tulanp"

## add safety nets
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'

if [[ "$OSTYPE" == "darwin" ]]; then
    alias rm='rm -i'
elif [[ "$OSTYPE" == "linux-gnu" ]] then
    alias rm='rm -I'
fi

# Parenting changing perms on /, but only available on Linux
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    alias chown='chown --preserve-root'
    alias chmod='chmod --preserve-root'
    alias chgrp='chgrp --preserve-root'
fi

## reboot / halt / poweroff
alias reboot='sudo /sbin/reboot'
alias poweroff='sudo /sbin/poweroff'
alias halt='sudo /sbin/halt'
alias shutdown='sudo /sbin/shutdown'

## system statistics
# pass options to free
alias meminfo="free -m -l -t"

# get top process eating memory
alias psmem="ps auxf | sort -nr -k 4"
alias psmem10="ps auxf | sort -nr -k 4 | head -10"

# get top process eating cpu
alias pscpu="ps auxf | sort -nr -k 3"
alias pscpu10="ps auxf | sort -nr -k 3 | head -10"

## media
# play all video files
alias playavi="mplayer *.avi"

# play all music files from the current directory
alias playwave='for i in *.wav; do mplayer "$i"; done'
alias playogg='for i in *.ogg; do mplayer "$i"; done'
alias playmp3='for i in *.mp3; do mplayer "$i"; done'

# shuffle mp3/ogg etc by default #
alias music="mplayer --shuffle *"

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    alias pbcopy="xclip -selection clipboard"
    alias pbpaste="xclip -selection clipboard -o"
    alias open="xdg-open"

    alias aptget="sudo apt-get"
fi

### applications
alias bc="bc -l"
alias v="nvim"
alias grep="rg"
alias diff="colordiff"

## tmux
alias tls="tmux ls"
alias tat="tmux attach -t"
alias tns="tmux new -s"

tmux_v() {
    tmux new-session -s -d "$1" /usr/local/bin/nvim
    tmux attach -t $1
}

## git
gclone() {
    if (( $# == 1 )); then
        git clone --recursive $1
    elif (( $# == 2 )); then
        git clone --recursive "https://github.com/$1/$2"
    fi
}
gremote() {
    if (( $# == 2 )); then
        git remote add $1 $2
    elif (( $# == 3 )); then
        git remote add $1 "https://github.com/$2/$3"
    fi
}

alias gl="git log --graph --abbrev-commit --color --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"

alias ga="git add"
alias gaa="git add -A"

alias gs="git status"

alias gc="git commit -m"
alias gca="git commit -am"

alias gpo="git push origin"

alias pullo="git pull origin"
alias pullu="git pull upstream"

alias gcb="git checkout -b"
alias gcm="git checkout master"

alias gsa="git stash"
alias gsp="git stash pop"

alias gnew="git clean -n -d"
alias gclean="git clean -f -d"
alias gpurge="git clean -x -d -f"

## use lsd as ls alternative
alias ls="lsd"
alias l="ls -l"
alias la="l -a"
alias lt="ls --tree"

