#!/bin/bash

PACKAGE_MANAGER=""
LIST_COMMAND=""
INSTALL_COMMAND=""

ZSHRC_PATH="$HOME/.zshrc"
SCRIPT_ZSHRC=".zshrc"

echo "Running setup script..."
echo

echo "Setting up environment..."
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "MacOS detected!"

    PACKAGE_MANAGER="brew"
    LIST_COMMAND="$PACKAGE_MANAGER list"
    INSTALL_COMMAND="$PACKAGE_MANAGER install"

    if ! command -v $INSTALL_COMMAND &> /dev/null
    then
        echo "Brew not found. Installing..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else
        echo "Brew found!"
    fi
fi

if [[ $PACKAGE_MANAGER == "" ]]; then
    echo "OS not supported. Exiting..."
    exit 1
fi

echo "Environment setup complete!"

echo
echo "Installing packages..."
echo

install_pkg() {
    if ! $LIST_COMMAND $1 &> /dev/null
    then
        echo "Installing $1..."
        $INSTALL_COMMAND $1 >> /dev/null
        echo "$1 installed!"
    else
        echo "$1 found!"
    fi
}

echo "Checking if python is installed..."
install_pkg python3

echo "Checking if node is installed..."
install_pkg node

echo "Checking if npm is installed..."
install_pkg npm

echo "Checking if yarn is installed..."
install_pkg yarn

echo "Checking if go is installed..."
install_pkg go

echo "Checking if rust is installed..."
install_pkg rust

echo "Checking if docker is installed..."
install_pkg docker

echo "Checking if docker-compose is installed..."
install_pkg docker-compose

echo "Checking if kubectl is installed..."
install_pkg kubectl

echo "Checking if git is installed..."
install_pkg git

echo "Checking if curl is installed..."
install_pkg curl

echo "Checking if bat is installed..."
install_pkg bat

echo "Checking if exa is installed..."
install_pkg exa

echo "Checking if fd is installed..."
install_pkg fd

echo "Checking if fzf is installed..."
install_pkg fzf

echo "Checking if procs is installed..."
install_pkg procs

echo "Checking if ripgrep is installed..."
install_pkg ripgrep

echo "Checking if tldr is installed..."
install_pkg tldr

echo "Checking if htop is installed..."
install_pkg htop

echo "Checking if neovim is installed..."
install_pkg neovim

echo "Checking if zellij is installed..."
install_pkg zellij

echo "Checking if alacritty is installed..."
install_pkg --cask alacritty

echo
echo "Setting up directories..."
echo

create_dir() {
    if [ ! -d "$1" ]
    then
        echo "Creating $1..."
        mkdir "$1"
    fi
}

echo "Checking if scripts directory exists..."
create_dir "$HOME/scripts"

echo "Checking if repos directory exists..."
create_dir "$HOME/repos"

echo "Checking if projects directory exists..."
create_dir "$HOME/projects"

echo
echo "Setting up zsh..."
echo

echo "Checking if zsh is installed..."
install_pkg zsh

echo "Checking if zsh-syntax-highlighting is installed..."
install_pkg zsh-syntax-highlighting


if [[ $SHELL != "/bin/zsh" ]]; then
    echo "Setting zsh as default shell..."
    chsh -s $(which zsh)
fi

echo "Checking if .zshrc exists..."
if [ ! -f "$ZSHRC_PATH" ]; then
    echo "Creating .zshrc..."
    cp "$SCRIPT_ZSHRC" "$ZSHRC_PATH"
fi

echo "Updating .zshrc..."
cat "$SCRIPT_ZSHRC" >> "$ZSHRC_PATH"

echo
echo "All done! Please restart your terminal to apply changes."
exit 0
