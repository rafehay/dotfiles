# Plugins
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Starship Prompt
eval "$(starship init zsh)"

# Nützliche Aliases
alias v="nvim"
alias t="tmux"
alias ll="ls -la"
alias gs="git status"
alias dotfiles="cd ~/dotfiles"

[ -f ~/.zshrc.local ] && source ~/.zshrc.local
