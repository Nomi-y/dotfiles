# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
# Not supported in the "fish" shell.
#(cat ~/.cache/wal/sequences &)

# Add Go to path
export PATH=$PATH:$HOME/go/bin

# Editor
export EDITOR=nvim
export VISUAL=nvim

# Prompt
PROMPT="%F{blue}%n%f %F{cyan}%~%f %F{magenta}❯%f "

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
#zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# Add in snippets
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# Keybindings
bindkey -e
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward
bindkey '^[w' kill-region
bindkey '^ ' autosuggest-accept

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no

# Alias
alias du='dust'
alias cat='bat'
alias ip='ip -c'
alias l='lsd -1'
alias ls='lsd --group-directories-first'
alias ll='lsd -l --group-directories-first'
alias la='lsd -la --group-directories-first'
alias nim='nvim'
alias vim='nvim'
alias nvi='nvim'
alias nivm='nvim'
alias nbim='nvim'
alias c='clear'
alias gitl='git log --oneline --graph --all --decorate --color'
alias xc='xclip -selection clipboard'
alias c2c='~/.config/scripts/code2clip.sh'
alias q='exit'
alias :q='exit'

alias fastfetch='fastfetch --config examples/32.jsonc'

# Disable microshit telemetry
export DOTNET_CLI_TELEMETRY_OPTOUT=1

# Zoxide for smart/fuzzy cd
eval "$(zoxide init zsh)"
alias cd="z"
