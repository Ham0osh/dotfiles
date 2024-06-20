#!/bin/bash

sudo apt update

./aptinstall.sh
./prof_install/pipes_install.sh

sudo apt upgrade -y
source ./.bashrc
ln -sf ./nvim/ ~/.config/nvim

# Add my source to bashrc
echo "Please remember to source '$PWD/hamish_dotfiles/.bashrc' from your home directory."
