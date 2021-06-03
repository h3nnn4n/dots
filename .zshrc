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
# pyenv virtualenvwrapper_lazy
# This has a tendency to make the shell explode, somehow
# source $(which virtualenvwrapper.sh)


# node stuff
export NVM_DIR="$HOME/.nvm"
export N_PREFIX="$HOME/.n"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# ruby stuff
#export PATH="$HOME/.rbenv/bin:$PATH"
#if (( $+commands[rbenv] ))
#then
  #eval "$(rbenv init -)"
  #source $HOME/.rbenv/completions/rbenv.zsh
#fi


# Starship prompt
eval "$(starship init zsh)"


# fzf hooks
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# Aliases
alias todo=~/personal-todo/todo.sh
alias berta="time bundle exec ruby -Itest"
alias pytest="pytest --pdbcls=IPython.core.debugger:Pdb -s"

alias tls="tmux list-sessions"
alias ta="tmux attach -t"
alias tns="tmux new -s"
alias t="tmux"

alias gc="git commit"
alias gd="git diff"
alias gdc="git diff --cached"
alias gap="git add --patch"
alias gcan="git commit --amend --no-edit"

# dotfile syncing
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'


# Zsh history sync
ZSH_HISTORY_FILE="${HOME}/.zsh_history"
ZSH_HISTORY_PROJ="${HOME}/.zsh_history_sync"
ZSH_HISTORY_FILE_ENC="${ZSH_HISTORY_PROJ}/zsh_history"
GIT_COMMIT_MSG="latest $(date)"

GPG_TTY=$(tty)
export GPG_TTY
gpgconf --launch gpg-agent
gpgconf --kill gpg-agent


unalias gb


function is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

function gf() {
  is_in_git_repo &&
    git -c color.status=always status --short |
    fzf --height 40% -m --ansi --nth 2..,.. | awk '{print $2}'
}

function gbb() {
  is_in_git_repo &&
    git branch -a -vv --color=always | grep -v '/HEAD\s' |
    fzf --height 40% --ansi --multi --tac | sed 's/^..//' | awk '{print $1}' |
    sed 's#^remotes/[^/]*/##'
}

function gb() {
  gbb | xargs git checkout
}

function gt() {
  is_in_git_repo &&
    git tag --sort -version:refname |
    fzf --height 40% --multi
}

function gl() {
  is_in_git_repo &&
    git log --date=short --format="%C(green)%C(bold)%cd %C(auto)%h%d %s (%an)" --graph |
    fzf --height 40% --ansi --no-sort --reverse --multi | grep -o '[a-f0-9]\{7,\}'
}

function gr() {
  is_in_git_repo &&
    git remote -v | awk '{print $1 " " $2}' | uniq |
    fzf --height 40% --tac | awk '{print $1}'
}
