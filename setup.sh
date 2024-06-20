#!/bin/bash

sudo apt update

# Install core utils
bash ./aptinstall.sh

# Install each silly thing
while true; do
  read -p "Would you like to install pipes? (y/n) " yn
  case $yn in
    [yY] )  echo "Installing pipes.sh...";
            bash ./soft_install/pipes_install.sh 
            break;;
    [nN] ) echo 'Skipping...';
           break;;
    * ) echo 'Invalid response';;
  esac
done

sudo apt upgrade -y
source ./.bashrc
# ln -sf ./nvim/ ~/.config/nvim

# Add my source to bashrc
echo "Please remember to source '$PWD/hamish_dotfiles/.bashrc' from your home directory."
