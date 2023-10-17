#!/bin/bash
## usual commands
alias cdback="cd $OLDPWD"
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
alias rm='rm -I'

## system statistics
# pass options to free
alias meminfo="free -m -l -t"

# get top process eating memory
alias psmem="ps auxf | sort -nr -k 4"
alias psmem10="ps auxf | sort -nr -k 4 | head -10"

# get top process eating cpu
alias pscpu="ps auxf | sort -nr -k 3"
alias pscpu10="ps auxf | sort -nr -k 3 | head -10"

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
alias gpo="git push downstream"
alias gs="git status"
alias pullo="git pull origin"
alias pullu="git pull downstream"

## ls
alias ls='ls -Fh --color=tty --group-directories-first'
alias l="ls -l"
alias la="l -a"
alias lt="ls --tree"
