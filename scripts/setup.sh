#!/bin/bash

PACKAGE_MANAGER=""
LIST_COMMAND=""
INSTALL_COMMAND=""

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
    echo "Checking if $1 is installed..."
    if ! $LIST_COMMAND $1 &> /dev/null
    then
        echo "Installing $1..."
        $INSTALL_COMMAND $1 >> /dev/null
        echo "$1 installed!"
    else
        echo "$1 found!"
    fi
}

install_pkg python3
install_pkg node
install_pkg npm
install_pkg yarn
install_pkg go
install_pkg rust
install_pkg docker
install_pkg docker-compose
install_pkg kubectl
install_pkg git
install_pkg curl
install_pkg bat
install_pkg exa
install_pkg fd
install_pkg fzf
install_pkg procs
install_pkg ripgrep
install_pkg tldr
install_pkg htop
install_pkg neovim
install_pkg zellij
install_pkg --cask alacritty
install_pkg zsh
install_pkg zsh-syntax-highlighting

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

ZSHRC_PATH="$HOME/.zshrc"
SCRIPT_ZSHRC=".zshrc"

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
