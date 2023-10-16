#!/bin/bash
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# local binaries storage
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"

# go
export GOROOT="/usr/local/go"
export GOPATH="$HOME/resources/works/go"
export PATH="$GOROOT/bin:$GOPATH/bin:$PATH"

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# neovim
export EDITOR="/usr/bin/nvim"

# ghcup
[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"
