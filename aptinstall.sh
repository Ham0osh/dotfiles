#!/bin/bash

install () {
  # which $1 &> /dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: ${1}..."
    sudo apt install $1 --assume-yes
  else
    echo "${1} already installed!"
  fi
}

# Install git
install git
while true; do
  read -p "Would you like to set up Git? (y/n) " yn
  case $yn in
    [yY] )  echo "Enter the Global Username for Git:";
            read GITUSER;
            git config --global user.name "${GITUSER}";
            echo "Enter the Global Email for Git:";
            read GITEMAIL;
            git config --global user.email "${GITEMAIL}";
            echo 'Git has been configured!';
            git config --list;
            break;;
    [nN] ) echo 'Skipping...';
           break;;
    * ) echo 'Invalid response';;
  esac
done

# Install CLI tools I use
install vim
install neovim
install tmux
install neofetch
install curl
install net-tools
install nmap
install htop
install bat

# Install from repos
echo "Installing: gitprompt..."
bash ./soft_install/gitprompt_install.sh
echo "Installing: eza..."
bash ./soft_install/eza_install.sh