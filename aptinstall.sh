#!/bit/bash

sudo apt update

install () {
  # which $1 &> /dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: ${1}..."
    sudo apt install $1 --assume-yes
  else
    echo "${1} already installed!"
  fi
}

# Install CLI tools I use
install vim
install neovim
install git
install tmux
install neofetch
install curl
install net-tools
install nmap
install htop

install bat
install eza


