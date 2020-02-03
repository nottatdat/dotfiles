cd $HOME/src/contribute/tools/neovim/

git fetch --all --tags --prune
git checkout tags/nightly

mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$HOME/.local/nvim ..
make
make install

cd ..
make clean
git clean -xdf
git checkout master
