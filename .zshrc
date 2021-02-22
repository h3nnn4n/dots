# oh my zsh settings
ZSH_DISABLE_COMPFIX=true
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="af-magic"
plugins=(git zsh-autosuggestions history-sync)
source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters


# Add 'local' bin folders to path
export PATH=$HOME/.local/bin:$PATH
export PATH=$PATH:/usr/local/sbin


# cargo
if [[ -f $HOME/.cargo/env ]]
then
  source $HOME/.cargo/env
fi


# Env setup
export EDITOR='nvim'


# Python stuff
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
eval "$(pipenv --completion)"
export PATH="$HOME/.pyenv/shims:$PATH"

export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
export WORKON_HOME=$HOME/.virtualenvs
if (( $+commands[virtualenvwrapper_lazy] ))
then
  pyenv virtualenvwrapper_lazy
  # This has a tendency to make the shell explode, somehow
  # source $(which virtualenvwrapper.sh)
fi


# node stuff
export NVM_DIR="$HOME/.nvm"
export N_PREFIX="$HOME/.n"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# ruby stuff
export PATH="$HOME/.rbenv/bin:$PATH"
if (( $+commands[rbenv] ))
then
  eval "$(rbenv init -)"
  source $HOME/.rbenv/completions/rbenv.zsh
fi


# Starship prompt
eval "$(starship init zsh)"


# fzf hooks
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# Aliases
alias todo=~/personal-todo/todo.sh
alias berta="time bundle exec ruby -Itest"
alias pytest="pytest --pdbcls=IPython.core.debugger:Pdb -s"


# dotfile syncing
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'


# Zsh history sync
ZSH_HISTORY_FILE="${HOME}/.zsh_history"
ZSH_HISTORY_PROJ="${HOME}/.zsh_history_sync"
ZSH_HISTORY_FILE_ENC="${ZSH_HISTORY_PROJ}/zsh_history"
GIT_COMMIT_MSG="latest $(date)"

PATH="/Users/renanssilva/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/renanssilva/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/renanssilva/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/renanssilva/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/renanssilva/perl5"; export PERL_MM_OPT;
