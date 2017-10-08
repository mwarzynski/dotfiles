#!/bin/bash

# Install dependencies
sudo apt -y install wget curl

# Install zsh and set zsh as default shell.
sudo apt -y install zsh
chsh -s /bin/zsh

# Install zgen.
git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"

# Clone dotfiles.
git clone git@github.com:mwarzynski/dotfiles.git

# Copy dotfiles to home directory.
cp dotfiles/.* ~/
rm -rf dotfiles

# Create TODO file.
touch ~/.todo

# Prompt for relogin.
echo "Please, relogin."

