#!/bin/bash

# Install dependencies
sudo apt -y install wget curl python

# Install zsh and set zsh as default shell.
sudo apt -y install zsh
chsh -s /bin/zsh

# Install zgen.
git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"

# Get dotfiles.
git clone git@github.com:mwarzynski/dotfiles.git "${HOME}/dotfiles"

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


# Create file for todo notes.
touch ~/.todo

