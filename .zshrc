ZSH_DISABLE_COMPFIX=true

export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="af-magic"

# Zsh plugins
plugins=(git zsh-autosuggestions history-sync)

source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters



# Env setup
export EDITOR='nvim'


# Load other settings
export ZSHRC_D=$HOME/.config/zshrc.d
[[ -r ${ZSHRC_D}/bootstrap ]] && . ${ZSHRC_D}/bootstrap


# Starship prompt
eval "$(starship init zsh)"


# Zsh history sync
ZSH_HISTORY_FILE="${HOME}/.zsh_history"
ZSH_HISTORY_PROJ="${HOME}/.zsh_history_sync"
ZSH_HISTORY_FILE_ENC="${ZSH_HISTORY_PROJ}/zsh_history"
GIT_COMMIT_MSG="latest $(date)"
