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
backup_file $HOME/.git-credentials
backup_file $HOME/.config/alacritty/alacritty.yml
backup_file $HOME/.tmux.conf

backup_folder $HOME/.scripts
backup_folder $HOME/.keys
backup_folder $HOME/.ssh
backup_folder $HOME/.config/nvim
backup_folder $HOME/.config/coc

# create symbolic links
symlink zshrc                .zshrc
symlink git/gitconfig        .gitconfig
symlink git/gitignore_global .gitignore_global
symlink git/git-credentials  .git-credentials
symlink tmux.conf            .tmux.conf

symlink scripts      .scripts
symlink secrets/ssh  .ssh
symlink secrets/keys .keys
symlink nvim         .config/
symlink nvim/coc     .config/

if [[ "$OSTYPE" == "linux-gnu" ]]; then

    symlink alacritty/alacritty.linux.yml .config/alacritty/alacritty.yml

    backup_folder $HOME/.config/i3
    mkdir $HOME/.config/i3
    symlink i3/i3_config .config/i3/config

    backup_folder $HOME/.config/i3status
    mkdir $HOME/.config/i3status
    symlink i3/i3status_config .config/i3status/config

    sudo cp xorg.conf /etc/X11/xorg.conf

elif [[ "$OSTYPE" == "darwin" ]]; then

    symlink alacritty/alacritty.yml .config/alacritty/alacritty.yml

fi

gpg --export-secret-key -a $GPG_UID > secrets/gpg/gpg.key
