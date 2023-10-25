# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# Custom Variables
export EDITOR=nvim
export VISUAL=nvim
export OPENER='rifle'
# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.config/zsh/zsh_history
setopt appendhistory

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)               # Include hidden files.

# Custom ZSH Binds
bindkey '^ ' autosuggest-accept

# Use fzf for Ctrl+R history searching
if [[ -n $ZSH_VERSION ]]; then
  fzf-history-widget() {
    local selected_command
    selected_command=$( \
      fc -l -n 1 | \
      sed 's/ *[0-9]* *//' | \
      fzf --height=20% --tac +s --query "$LBUFFER"
    )
    LBUFFER="$selected_command"
    zle reset-prompt
  }
  zle -N fzf-history-widget
  bindkey '^R' fzf-history-widget
fi

# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/zsh/zsh_alias" ] && source "$HOME/.config/zsh/zsh_alias"

# Load ; should be last.
source $HOME/.config/zsh/src/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.config/zsh/src/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
# source $HOME/.config/zsh/src/plugins/zsh-completions/zsh-completions.plugin.zsh
# source $HOME/.config/zsh/src/plugins/zsh-tab-title/zsh-tab-title.plugin.zsh 2>/dev/null
