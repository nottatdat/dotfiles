### directories aliases
cdwrap() {
    if [ "$#" -eq 2 ]; then
        cd $1/$2
    elif [ "$#" -eq 1 ]; then
        cd $1
    elif [ "$#" -eq 0 ]; then
        cd $HOME
    fi
}

alias win="cdwrap $HOME/src/compete/"
alias new="cdwrap $HOME/src/create/"
alias work="cdwrap $HOME/src/work/"

# personal directories aliases
alias dat="cdwrap $HOME/src/personal/"
alias blog="dat blog"
alias dot="dat dotfiles"
alias note="dat notes"

# training directories aliases
alias gym="cdwrap $HOME/src/train"
alias leet="gym leetcode"
alias euler="gym euler"

# opensource contribute directories aliases
alias con="cdwrap $HOME/src/contribute/"
alias ml="con machine-learning"
alias lang="con languages"
alias tool="con tools"
alias dist="con distributed-systems"

### OS
alias hs="history | grep"
alias cdback="cd $OLDPWD"

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    alias pbcopy="xclip -selection clipboard"
    alias pbpaste="xclip -selection clipboard -o"
    alias open="xdg-open"
fi

### applications
alias v="nvim"

alias tat="tmux a -t"
alias tns="tmux new -s"

# git
alias gl="git log --graph --abbrev-commit --color --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
alias ga="git add"
alias gaa="git add -A"
alias gc="git commit -m"
alias gca="git commit -am"
alias gpo="git push origin"
alias gcb="git checkout -b"
alias gs="git stash"
alias gnew="git clean -n -d"
alias gold="git clean -f -d"

alias grep="rg"

# ls alternative
alias ls="lsd"
alias l="ls -l"
alias la="ls -a"
alias lla="ls -la"
alias lt="ls --tree"

