# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# User configuration
export JAVA_HOME=/usr/local/opt/java11
export PATH="$PATH:/usr/local/bin:$HOME/tools/bin"

export EDITOR=nvim

export TERM_KEEP_DB_PATH=/Users/woodward/Library/CloudStorage/Box-Box/2vault/termkeep/data.db
export TERM_KEEP_HIDE_LOGO="1"

# You may need to manually set your 
# language environment
# export LANG=en_US.UTF-8

alias vim=nvim
alias tk=term_keep

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

fpath=(~/.config/zsh/plugins/zsh-completions/src $fpath)

source ~/.config/zsh/themes/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Plugins
source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/plugins/catppuccin_mocha-zsh-syntax-highlighting.zsh

source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
