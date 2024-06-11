#!/bin/bash

./aptinstall.sh

sudo apt upgrade -y
source ./.bashrc

# Add my source to bashrc
echo "Ready to rumble..."
echo "Please remember to source '/hamish_dotfiles/.bashrc' from your home directory."
