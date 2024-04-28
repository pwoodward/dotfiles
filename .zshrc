# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# User configuration
export JAVA_HOME=/usr/local/opt/java11
export PATH="$PATH:/usr/local/bin:$HOME/tools/bin"

export EDITOR=nvim

export TERM_KEEP_DB_PATH=/Users/woodward/Library/CloudStorage/Box-Box/2vault/termkeep/data.db
export TERM_KEEP_HIDE_LOGO="1"

set extended_glob

# You may need to manually set your 
# language environment
# export LANG=en_US.UTF-8

alias vim=nvim
alias nv=nvim
alias tk=term_keep
alias ls="eza"
alias ll="eza -l"
alias v="fd --type f --hidden --exclude .git | fzf-tmux -p | xargs nvim"
alias c=bat


[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

fpath=(~/.config/zsh/plugins/zsh-completions/src $fpath)

ZSH=${ZSH:-${ZDOTDIR:-$HOME/.config/zsh}}
ZSH_CUSTOM=${ZSH_CUSTOM:-$ZSH/custom}
# Use antidote.lite - a Zsh micro plugin manager based on zsh_unplugged.
if [[ ! -e $ZSH/lib/antidote.lite.zsh ]]; then
  mkdir -p $ZSH/lib
  curl -fsSL -o $ZSH/lib/antidote.lite.zsh \
    https://raw.githubusercontent.com/mattmc3/zsh_unplugged/main/antidote.lite.zsh
fi

# load any files in your lib directory
for zlib in $ZSH/lib/*.zsh(N); source $zlib
unset zlib

#myprompts=(romkatv/powerlevel10k)

# Plugins
myplugins=( 
  zsh-users/zsh-completions
  jeffreytse/zsh-vi-mode
  zsh-users/zaw
  mattmc3/zephyr/plugins/prompt
  joshskidmore/zsh-fzf-history-search

  zsh-users/zsh-syntax-highlighting
  zsh-users/zsh-history-substring-search
  zsh-users/zsh-autosuggestions
  )
# clone and load
plugin-clone $myplugins #$myprompts 
#plugin-load --kind fpath $myprompts
plugin-load $myplugins

# Load Git completion
zstyle ':completion:*:*:git:*' script ~/.config/zsh/plugins/git/git-completion.bash
fpath=(~/.config/zsh/plugins/git/ $fpath)

autoload -Uz compinit && compinit

# node version management
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(zoxide init zsh)"

# prompt setting
#prompt powerlevel10k

# To customize prompt, run `p10k configure` or edit ~/.zsh/.p10k.zsh.
#[[ ! -f ${ZDOTDIR:-$HOME}/.p10k.zsh ]] || source ${ZDOTDIR:-$HOME}/.p10k.zsh
#typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
# Starship
eval "$(starship init zsh)"
