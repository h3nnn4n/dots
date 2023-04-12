# Utils
alias todo=~/personal-todo/todo.sh
alias berta="time bundle exec ruby -Itest"
alias pytest="pytest --pdbcls=IPython.core.debugger:Pdb -s"

# Git stuff
alias gl="git log --pretty=oneline --color | head -n15"
alias gs="git status"
alias gc="git commit"
alias gd="git diff"
alias gdc="git diff --cached"
alias gap="git add --patch"
alias gcan="git commit --amend --no-edit"

# dotfile syncing
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Tmux stuff
alias tls="tmux list-sessions"
alias ta="tmux attach -t"
alias t="tmux"

tns () {
  SessionName=$1
  tmux new-session -d -s "${SessionName}"    && \
  tmux rename-window nvim                    && \
  tmux new-window -d -n raviolli             && \
  tmux new-window -d -n fettucinni           && \
  tmux attach-session -d -t "${SessionName}"
}

unset d
alias d="say 'Done'"
