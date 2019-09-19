# backup
mv $HOME/.zshrc            $HOME/.zshrc.bak
mv $HOME/.scripts          $HOME/.scripts.bak
mv $HOME/.gitconfig        $HOME/.gitconfig.bak
mv $HOME/.gitignore_global $HOME/.gitignore_global.bak
mv $HOME/.keys             $HOME/.keys.bak

# create symbolic links
ln -s "$(pwd)/zshrc"            $HOME/.zshrc
ln -s "$(pwd)/scripts"          $HOME/.scripts
ln -s "$(pwd)/gitconfig"        $HOME/.gitconfig
ln -s "$(pwd)/gitignore_global" $HOME/.gitignore_global
ln -s "$(pwd)/secrets/ssh/"     $HOME/.ssh
ln -s "$(pwd)/secrets/keys/"    $HOME/.keys

gpg --import keys/gpg.key
