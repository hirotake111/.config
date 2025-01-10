# Example aliases
alias zshconfig="vim ~/.zshrc"
alias reload="source ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# 2022-06-20 exa
#alias ls="exa --icons"
#alias ls="eza --color=always --long --git --icons=always --tree --level=2"
alias ls="eza --color=always --long --git --icons=always"
alias vimconf="vim ~/.config/nvim/init.lua"

# ---- FZF -----
# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

# 2022-08-04
function __ghq_cd_repository  { 
  repo_path=$(ghq list --full-path | fzf --preview "git --git-dir {}/.git log --date=short --pretty=format:'-%C(yellow)%d%Creset %s %Cgreen(%cd) %C(bold blue)<%an>%Creset' --color")
  cd $repo_path
}

alias goto=__ghq_cd_repository

# 2024/02/16 startship
eval "$(starship init zsh)"
alias l="ls -al"
# zsh autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

alias gs="git status"




test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

alias zshreload="source ~/.zshrc"
 
# -- Use fd instead of fzf --
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

# fzf-git
source ~/fzf-git.sh/fzf-git.sh

# bat
alias cat=bat

# 2024-05-07 lazygit
alias lg=lazygit


# 2024-10-04 tmux session finder
# This fuzzy find tmux session and attaches it
tt() {
 s=$(tmux ls | fzf | sed 's/\:.*//g')
 tmux a -t $s
}

# 2024-10-29 to remove ocaml warning message
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"

# 2024-11-23 Display fastfetch
#fastfetch

# 2024-12-28 Open ghostty config
alias ghosttyconfig="vim ~/.config/ghostty/config"

# 2024-12-29 Experimental neovim configuration
#export NVIM_APPNAME=nvim_scratch
