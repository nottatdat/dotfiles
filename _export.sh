#!/bin/bash
backup_file() {
    mv $1 $1.bak
}

backup_folder() {
    rm -rf $1.bak
    mv $1 $1.bak
}

# backup
backup_file $HOME/.zshrc
backup_file $HOME/.gitconfig
backup_file $HOME/.gitignore_global

backup_folder $HOME/.scripts
backup_folder $HOME/.keys
backup_folder $HOME/.ssh
backup_folder $HOME/.config/alacritty
backup_folder $HOME/.config/nvim

# create symbolic links
ln -s "$(pwd)/zshrc"                $HOME/.zshrc
ln -s "$(pwd)/git/gitconfig"        $HOME/.gitconfig
ln -s "$(pwd)/git/gitignore_global" $HOME/.gitignore_global

ln -s "$(pwd)/scripts"              $HOME/.scripts
ln -s "$(pwd)/secrets/ssh"          $HOME/.ssh
ln -s "$(pwd)/secrets/keys"         $HOME/.keys
ln -s "$(pwd)/nvim"                 $HOME/.config/nvim
ln -s "$(pwd)/alacritty"            $HOME/.config/alacritty

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    backup_folder $HOME/.config/i3
    mkdir $HOME/.config/i3
    ln -s "$(pwd)/i3/i3_config"       $HOME/.config/i3/config
    
    backup_folder $HOME/.config/i3status
    mkdir $HOME/.config/i3status
    ln -s "$(pwd)/i3/i3status_config" $HOME/.config/i3status/config
fi

gpg --import secrets/gpg/gpg.key
