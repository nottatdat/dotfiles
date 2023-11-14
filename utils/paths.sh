#!/bin/bash
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# local binaries storage
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"

# go
export GOPATH="$HOME/.go"
export PATH="$GOPATH/bin:$PATH"

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# cs
export PATH="$PATH:$HOME/.local/share/coursier/bin"

# emacs
export PATH="$HOME/.config/emacs/bin:$PATH"
