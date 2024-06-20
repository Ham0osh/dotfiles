#!/bit/bash

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

# Install git
install git
echo "Enter the Global Username for Git:";
read GITUSER;
git config --global user.name "${GITUSER}"
echo "Enter the Global Email for Git:";
read GITEMAIL;
git config --global user.email "${GITEMAIL}"
echo 'Git has been configured!'
git config --list

install tmux
install neofetch
install curl
install net-tools
install nmap
install htop

install bat
install eza