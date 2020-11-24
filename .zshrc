# oh my zsh settings
ZSH_DISABLE_COMPFIX=true
export ZSH="/Users/renanssilva/.oh-my-zsh"
ZSH_THEME="af-magic"
plugins=(git zsh-autosuggestions history-sync)
source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters


# Add 'local' bin folders to path
export PATH=$HOME/.local/bin:$PATH
export PATH=$PATH:/usr/local/sbin


# cargo
source $HOME/.cargo/env


# Env setup
export EDITOR='nvim'


# Python stuff
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
eval "$(pipenv --completion)"
export PATH="$HOME/.pyenv/shims:$PATH"


# node stuff
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# ruby stuff
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
source $HOME/.rbenv/completions/rbenv.zsh


# Starship prompt
eval "$(starship init zsh)"


# fzf hooks
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# Aliases
alias todo=~/personal-todo/todo.sh
alias berta="time bundle exec ruby -Itest"


# dotfile syncing
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'


# Zsh history sync
ZSH_HISTORY_FILE="${HOME}/.zsh_history"
ZSH_HISTORY_PROJ="${HOME}/.zsh_history_sync"
ZSH_HISTORY_FILE_ENC="${ZSH_HISTORY_PROJ}/zsh_history"
GIT_COMMIT_MSG="latest $(date)"
