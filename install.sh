#!/bin/bash

# Install dependencies
sudo apt -y install wget curl python

# Install zsh and set zsh as default shell.
sudo apt -y install zsh
chsh -s /bin/zsh

# Install zgen.
git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"

# Get dotfiles to HOME directory.
git clone git@github.com:mwarzynski/dotfiles.git "${HOME}/dotfiles"
shopt -s dotglob nullglob
mv dotfiles/* ~/
rm -rf .git

# Install nvim
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt update
sudo apt -y install neovim

# Install Deoplete
sudo apt -y install python3-pip
pip3 install neovim

# Install plugin manager for nvim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# TODO
# gcc, g++, gdb, peda, pwn tools
