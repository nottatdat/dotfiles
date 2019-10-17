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

# personal directories aliases
alias dat="cdwrap $HOME/src/personal"
alias blog="dat blog"
alias dot="dat dotfiles"
alias note="dat notes"

# training directories aliases
alias gym="cdwrap $HOME/src/train"
alias leet="gym leetcode"
alias euler="gym euler"

# opensource contribute directories aliases
alias con="cdwrap $HOME/src/contribute"
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
alias grep="rg"

# tmux
alias tls="tmux ls"
alias tat="tmux attach -t"
alias tns="tmux new -s"

# git
alias gl="git log --graph --abbrev-commit --color --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
alias ga="git add"
alias gaa="git add -A"
alias gc="git commit -m"
alias gca="git commit -am"
alias gpo="git push origin"
alias gcb="git checkout -b"
alias gcm="git checkout master"
alias gsa="git stash"
alias gsp="git stash pop"
alias gnew="git clean -n -d"
alias gclean="git clean -f -d"
alias gpurge="git clean -x -d -f"

# use lsd as ls alternative
alias ls="lsd"
alias l="ls -l"
alias la="l -a"
alias lt="ls --tree"

