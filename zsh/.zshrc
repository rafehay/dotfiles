# ─────────────────────────────────────────────
#  HISTORY
# ─────────────────────────────────────────────
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS

# ─────────────────────────────────────────────
#  PLUGINS (OS-abhängig)
# ─────────────────────────────────────────────
if [[ "$OSTYPE" == "darwin"* ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
  source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  source $(brew --prefix)/opt/fzf/shell/key-bindings.zsh
  source $(brew --prefix)/opt/fzf/shell/completion.zsh

elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  source /usr/share/doc/fzf/examples/key-bindings.zsh
  source /usr/share/doc/fzf/examples/completion.zsh
fi

# ─────────────────────────────────────────────
#  FZF
# ─────────────────────────────────────────────
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git"'
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
# Ctrl+R → fuzzy History-Suche
# Ctrl+T → fuzzy Datei-Suche
# Alt+C  → fuzzy Ordner-Wechsel

# ─────────────────────────────────────────────
#  PFADE
# ─────────────────────────────────────────────
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export GOPATH="$HOME/go"
export EDITOR="nvim"
export VISUAL="nvim"

# ─────────────────────────────────────────────
#  ALIASES – Git
# ─────────────────────────────────────────────
alias g="git"
alias gs="git status"
alias ga="git add"
alias gaa="git add ."
alias gc="git commit -m"
alias gp="git push"
alias gpl="git pull"
alias gco="git checkout"
alias gcb="git checkout -b"
alias gb="git branch"
alias gl="git log --oneline --graph --decorate --all"
alias gd="git diff"

# ─────────────────────────────────────────────
#  ALIASES – Docker
# ─────────────────────────────────────────────
alias d="docker"
alias dc="docker compose"
alias dcu="docker compose up -d"
alias dcd="docker compose down"
alias dcl="docker compose logs -f"
alias dps="docker ps"
alias dex="docker exec -it"

# ─────────────────────────────────────────────
#  ALIASES – Node / npm
# ─────────────────────────────────────────────
alias ni="npm install"
alias nr="npm run"
alias nrd="npm run dev"
alias nrb="npm run build"
alias nrt="npm run test"

# ─────────────────────────────────────────────
#  ALIASES – Go
# ─────────────────────────────────────────────
alias gor="go run ."
alias got="go test ./..."
alias gob="go build ./..."
alias gomod="go mod tidy"

# ─────────────────────────────────────────────
#  ALIASES – Allgemein
# ─────────────────────────────────────────────
alias v="nvim"
alias t="tmux"
alias reload="source ~/.zshrc"
alias dotfiles="cd ~/dotfiles"

# eza statt ls
alias ls="eza --icons"
alias ll="eza -la --icons --git"
alias lt="eza --tree --icons --level=2"

# ─────────────────────────────────────────────
#  STARSHIP PROMPT
# ─────────────────────────────────────────────
eval "$(starship init zsh)"

# ─────────────────────────────────────────────
#  LOKALE OVERRIDES (nicht im Repo)
# ─────────────────────────────────────────────
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
