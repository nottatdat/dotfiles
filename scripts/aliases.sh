### directories aliases
alias src="cdwrap $HOME/src"
alias win="src compete"
alias con="src contribute"
alias new="src create"
alias learn="src learn"
alias dat="src personal"
alias toy="src toy"
alias gym="src train"
alias work="src work"

## textbook directories aliases
alias book="cdwrap $HOME/doc/Textbooks"

## personal directories aliases
alias blog="dat blog"
alias note="dat notes"
alias dot="dat dotfiles"
alias dotvim="dot nvim"

## training directories aliases
alias leet="gym leetcode"
alias euler="gym euler"

## open-source contribute directories aliases
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
alias opt="ml optimizations"
alias plat="ml platforms"
alias prob="ml prob-prog"
alias rl="ml rl"

### databases directories
alias db="con databases"
alias pg="db postgres"
alias msql="db mysql-5.6"
alias redis="db redis"
alias noria="db noria"

### programming languages directories
alias lang="con languages"
alias rs="lang rustlang"
alias cpp="lang cpp"
alias py="lang python"
alias hs="lang haskell"
alias jl="lang julia"
alias oml="lang ocaml"

### scientic computing directories
alias sc="con scientific-computing"
alias gpu="sc gpu-computing"
alias grad="sc autograd-engine"
alias jit="sc jit"
alias scsc="sc general"

### OS
## usual commands
alias c="clear"
alias cdback="cd $OLDPWD"
alias chksum="shasum -a 256 "
alias hs="history | grep"
alias now='date +"%T"'
alias nowdate='date +"%d-%m-%Y"'
alias wget="wget -c "

## network related
alias fastping="ping -c 100 -s.2"
alias ip="curl ipinfo.io/ip"
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
alias diff="colordiff"
alias grep="rg"
alias v="nvim"

## tmux
alias tat="tmux attach -t"
alias tls="tmux ls"
alias tns="tmux new -s"

## git
alias gl="git log --graph --abbrev-commit --color --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
alias check="git checkout"
alias ga="git add"
alias gaa="git add -A"
alias gc="git commit -m"
alias gca="git commit -am"
alias gclean="git clean -f -d"
alias gnew="git clean -n -d"
alias gpo="git push origin"
alias gpurge="git clean -x -d -f"
alias gs="git status"
alias pullo="git pull origin"
alias pullu="git pull upstream"

## use lsd as ls alternative
alias ls="lsd"
alias l="ls -l"
alias la="l -a"
alias lt="ls --tree"
