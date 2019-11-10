# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/frameworks/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/frameworks/miniconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/frameworks/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/frameworks/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
