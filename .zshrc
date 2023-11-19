# Path
export PATH="$GOPATH/bin":$PATH
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$PATH:/opt/homebrew/bin/"
export PATH="/usr/local/opt/go@1.20/bin:$PATH"

# Setup
eval "$(starship init zsh)"

# Navigation
alias repos="cd $HOME/repos"
alias scripts="cd $HOME/scripts"
alias projects="cd $HOME/projects"
alias nv="cd $HOME/.config/nvim"

# Utilities
alias grep="rg"
alias cat="bat"
alias ps="procs"
alias v="nvim"
alias n="xplr"
alias g="git"
alias ls="exa --icons --tree --level=1"
alias z="zellij --layout ~/.config/zellij/config/layouts/default.kdl"
alias s="source .zshrc"

# Quick Stop
alias stop='killport() { lsof -ti :$1 | xargs kill -9; }; killport'

# Quick Edit
alias rc="v $HOME/.zshrc"

# Git Shortcuts
alias ga="git add ."
alias gb="git branch"
alias gc="git commit -m"
alias gd="git diff master"
alias gl="git log --oneline"
alias gp="git push"
alias gr="git rebase -i master"
alias grs="git restore ."
alias gs="git status"
alias gmast="git checkout master"
alias gprev="git checkout -"

# GitHub Shortcuts
alias prc="gh pr create --draft --fill" 
alias prv="gh pr view --web"
alias ghv="gh repo view --web"

# Tmux Shortcuts
alias tn="t new-session"
alias tk="t kill-session"

# Help
alias h="cat ~/.zshrc"
alias readme="cat README.md"

# Plugins
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
