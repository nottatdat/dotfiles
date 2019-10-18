#!/bin/bash
backup_file() {
    mv $1 $1.bak
}

backup_folder() {
    rm -rf $1.bak
    mv $1 $1.bak
}

symlink() {
    ln -s $(pwd)/$1 $HOME/$2
}

# backup
backup_file $HOME/.zshrc
backup_file $HOME/.gitconfig
backup_file $HOME/.gitignore_global
backup_file $HOME/.tmux.conf

backup_folder $HOME/.scripts
backup_folder $HOME/.keys
backup_folder $HOME/.ssh
backup_folder $HOME/.config/nvim
backup_folder $HOME/.config/coc
backup_folder $HOME/.config/alacritty

# create symbolic links
symlink zshrc                .zshrc
symlink git/gitconfig        .gitconfig
symlink git/gitignore_global .gitignore_global
symlink tmux.conf            .tmux.conf

symlink scripts      .
symlink secrets/ssh  .
symlink secrets/keys .
symlink nvim         .config/
symlink nvim/coc     .config/
symlink alacritty    .config/

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    backup_folder $HOME/.config/i3
    mkdir $HOME/.config/i3
    symlink i3/i3_config .config/i3/config

    backup_folder $HOME/.config/i3status
    mkdir $HOME/.config/i3status
    symlink i3/i3status_config .config/i3status/config

    sudo cp xorg.conf /etc/X11/xorg.conf
fi

gpg --import secrets/gpg/gpg.key

