#!/bin/bash

# Install dependencies
sudo apt -y install wget curl python

# Install zsh and set zsh as default shell.
sudo apt -y install zsh
chsh -s /bin/zsh

# Install zgen.
git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"

# Get dotfiles.
git clone git@github.com:mwarzynski/dotfiles.git "${HOME}/"

# Create TODO file.
touch ~/.todo

# Show README
cat README.md

# Prompt for relogin.
echo "Please, relogin."

