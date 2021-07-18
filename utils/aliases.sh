#!/bin/bash

### directories aliases
## src directories alias
alias src="cdwrap $HOME/src"
alias dot="cd $HOME/dotfiles"
alias dotvim="cd $HOME/dotfiles/nvim"

### OS
## usual commands
alias cdback="cd $OLDPWD"
alias chksum="shasum -a 256 "
alias hs="history | grep"
alias now='date +"%T"'
alias nowdate='date +"%d-%m-%Y"'
alias wget="wget -c "

## network related
alias fastping="ping -c 100 -s.2"
alias ping="ping -c 5"
alias ports="netstat -tulanp"
alias speed="speedtest-cli --server 2406 --simple"
alias www="python -m SimpleHTTPServer 8000"

## add safety nets
alias cp='cp -i'
alias ln='ln -i'
alias mv='mv -i'

if [[ "$OSTYPE" == "darwin" ]]; then
    alias rm='rm -i'
elif [[ "$OSTYPE" == "linux-gnu" ]] then
    alias rm='rm -I'
fi

# Parenting changing perms on /, but only available on Linux
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    alias chgrp='chgrp --preserve-root'
    alias chmod='chmod --preserve-root'
    alias chown='chown --preserve-root'
fi

## reboot / halt / poweroff
alias halt='sudo /sbin/halt'
alias poweroff='sudo /sbin/poweroff'
alias reboot='sudo /sbin/reboot'
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
alias playmp3='for i in *.mp3; do mplayer "$i"; done'
alias playogg='for i in *.ogg; do mplayer "$i"; done'
alias playwave='for i in *.wav; do mplayer "$i"; done'

# shuffle mp3/ogg etc by default #
alias music="mplayer --shuffle *"

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    # mock MacOS open, pbcopy, pbpaste commands
    alias open="xdg-open"
    alias pbcopy="xclip -selection clipboard"
    alias pbpaste="xclip -selection clipboard -o"

    # alias for apt-get
    alias aptget="sudo apt-get"
fi

### applications
alias bc="bc -l"
alias grep="rg"

## neovim
alias v="/usr/bin/nvim"

## tmux
alias tat="tmux attach -t"
alias tls="tmux ls"
alias tns="tmux new -s"

## git
alias glog="
    git log --graph --abbrev-commit --color --decorate --date=relative \
    --format=format:'
%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) \
%C(white)%s%C(reset) \
%C(dim white) - %an%C(reset)%C(bold yellow)%d%C(reset) \
    ' \
    --all
"
alias check="git checkout"
alias ga="git add"
alias gaa="git add -A"
alias gc="git commit -m"
alias gca="git commit -am"
alias gclean="git clean -f -d"
alias gd="git diff"
alias gnew="git clean -n -d"
alias gpo="git push origin"
alias gpurge="git clean -x -d -f"
alias gs="git status"
alias pullo="git pull origin"
alias pullu="git pull upstream"

## ls
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    alias ls='ls -Fh --color=tty --group-directories-first'
else
    alias ls='gls -Fh --color=tty --group-directories-first'
fi
alias l="ls -l"
alias la="l -a"
alias lt="ls --tree"
