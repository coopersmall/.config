#!/bin/bash

# Install Homebrew
if ! command -v brew &> /dev/null
then
    echo "Homebrew not found. Installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install dependencies
if ! command -v python3 &> /dev/null
then
    echo "Python3 not found. Installing..."
    brew install python3
fi

if ! command -v node &> /dev/null
then
    echo "Node not found. Installing..."
    brew install node
fi

if ! command -v yarn &> /dev/null
then
    echo "Yarn not found. Installing..."
    brew install yarn
fi

if ! command -v go &> /dev/null
then
    echo "Go not found. Installing..."
    brew install go
fi

if ! command -v docker &> /dev/null
then
    echo "Docker not found. Installing..."
    brew install docker
fi

if ! command -v docker-compose &> /dev/null
then
    echo "Docker-compose not found. Installing..."
    brew install docker-compose
fi

if ! command -v kubectl &> /dev/null
then
    echo "Kubectl not found. Installing..."
    brew install kubectl
fi

if ! command -v git &> /dev/null
then
    echo "Git not found. Installing..."
    brew install git
fi

if ! command -v curl &> /dev/null
then
    echo "Curl not found. Installing..."
    brew install curl
fi

if ! command -v bat &> /dev/null
then
    echo "Bat not found. Installing..."
    brew install bat
fi

if ! command -v exa &> /dev/null
then
    echo "Exa not found. Installing..."
    brew install exa
fi

if ! command -v fd &> /dev/null
then
    echo "Fd not found. Installing..."
    brew install fd
fi

if ! command -v fzf &> /dev/null
then
    echo "Fzf not found. Installing..."
    brew install fzf
fi

if ! command -v procs &> /dev/null
then
    echo "Procs not found. Installing..."
    brew install procs
fi

if ! command -v rg &> /dev/null
then
    echo "Ripgrep not found. Installing..."
    brew install ripgrep
fi

if ! command -v tldr &> /dev/null
then
    echo "Tldr not found. Installing..."
    brew install tldr
fi

if ! command -v htop &> /dev/null
then
    echo "Htop not found. Installing..."
    brew install htop
fi

if ! command -v nvim &> /dev/null
then
    echo "Neovim not found. Installing..."
    brew install neovim
fi

echo "All dependencies installed!"
