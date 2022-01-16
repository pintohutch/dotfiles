# Source in $HOME/.zshrc via
# source <path-to-dotfiles>/.zshrc
# Stop skipping of words at forward slashes.
WORDCHARS=${WORDCHARS/\/}
WORDCHARS=${WORDCHARS/-}
# Aliases
alias k=kubectl
alias ls='ls -G'
