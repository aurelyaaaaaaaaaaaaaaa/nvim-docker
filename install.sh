#!/bin/bash
# FILE: install.sh
# DESCRIPTION: Master setup script for nvim-docker
# AUTHOR: Thomas Patton

# install directory
INSTALL_DIR="/root/"

echo "Running Docker container setup..."

# Update XDG_CONFIG_HOME
export XDG_CONFIG_HOME="${INSTALL_DIR}.config"
export XDG_DATA_HOME="${INSTALL_DIR}.local/share"
export XDG_STATE_HOME="${INSTALL_DIR}.local/state"
export TERM="xterm-256color"
export DISPLAY=":0"

cd "$INSTALL_DIR"
rm -rf "${INSTALL_DIR}.config"
 apt-get update

# CLANG
 apt-get install -y clang
 ln -s -f .clangd ~/.clangd

# NEOVIM
wget https://github.com/neovim/neovim/releases/download/v0.10.4/nvim-linux-x86_64.tar.gz
tar xzvf nvim-linux-x86_64.tar.gz
 ln -s "${INSTALL_DIR}nvim-linux-x86_64/bin/nvim" /usr/local/bin/nvim
 apt-get install -y python3-venv

# Git Repository (provided as an argument)
git clone "https://github.com/aurelyaaaaaaaaaaaaaaa/kickstart.nvim.git" "~/.config/nvim" 

# exit
cd ~


