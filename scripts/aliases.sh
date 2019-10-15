# directories aliases
alias win="cd $HOME/src/compete/ && cd"
alias con="cd $HOME/src/contribute/ && cd"
alias new="cd $HOME/src/create/ && cd"
alias work="cd $HOME/src/work/ && cd"

alias blog="cd $HOME/src/personal/blog"
alias dot="cd $HOME/src/personal/dotfiles"

# OS
alias hs="history | grep"
alias cdback="cd $OLDPWD"

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    alias pbcopy="xclip -selection clipboard"
    alias pbpaste="xclip -selection clipboard -o"
    alias open="xdg-open"
fi

alias trash="cd $HOME/.Trash && ll"
alias clean_trash="rm -rf $HOME/.Trash/*"

# applications
alias v="nvim"

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

# rust binaries
alias grep="rg"

alias ls="lsd --icon never --color never"
alias l="ls -l"
alias la="ls -a"
alias lla="ls -la"
alias lt="ls --tree"
