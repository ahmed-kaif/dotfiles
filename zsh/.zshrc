EDITOR=nvim
# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx
# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region
bindkey '^xp' pdf
bindkey '^xe' edit

export PATH=$HOME/.local/bin:$PATH

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
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias c='clear'
alias ls='eza --long --icons=always --color=auto --group-directories-first -h'
alias la='ls -a'
alias ll='ls -alh'
alias l='ls'
alias l.="ls -A | egrep '^\.'"
alias listdir="ls -d */ > list"
alias cls="clear"
## NVIM ###
alias vim="NVIM_APPNAME=LazyVim nvim"
alias nv="NVIM_APPNAME=LazyVim nvim"
alias nvim-my="NVIM_APPNAME=MyNvim nvim"
alias nl="NVIM_APPNAME=LazyVim nvim"
alias ff="fastfetch -c ~/.config/fastfetch/presets/12.jsonc"
## Git
alias gs="git status"
alias ga="git add ."
alias gd="git diff"
alias gl="git log"
alias gp="git push"
alias gi="git init"
alias dev="git switch dev"
alias gm="git switch master"
alias ml="source ~/.research/bin/activate"
alias ta="tmux a -t"
alias xampp="ampp.sh"
alias syu="sudo dnf upgrade"
alias i="sudo dnf install"
alias pkg="dnf list --installed | fzf"
### FZF
alias edit='fzf --bind "enter:become(NVIM_APPNAME=LazyVim nvim {})"'
alias pdf='fd -epdf | fzf --bind "enter:become(zathura  {} &)"'
alias hist="history | fzf | awk '{ \$1=\"\"; print}' | wl-copy"
# youtube download
alias yta-aac="yt-dlp --extract-audio --audio-format aac "
alias yta-best="yt-dlp --extract-audio --audio-format best "
alias yta-flac="yt-dlp --extract-audio --audio-format flac "
alias yta-mp3="yt-dlp --extract-audio --audio-format mp3 "
alias ytv-best="yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 "

alias track="~/study_tracker/main.py"

alias y="yazi"
export FZF_DEFAULT_OPTS="
	--color=fg:#908caa,bg:#191724,hl:#ebbcba
	--color=fg+:#e0def4,bg+:#26233a,hl+:#ebbcba
	--color=border:#403d52,header:#31748f,gutter:#191724
	--color=spinner:#f6c177,info:#9ccfd8
	--color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa"

fastfetch -c ~/.config/fastfetch/presets/12.jsonc

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"

fpath+=~/.zfunc; autoload -Uz compinit; compinit
