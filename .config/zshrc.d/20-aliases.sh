
# Utils
alias todo=~/personal-todo/todo.sh
alias berta="time bundle exec ruby -Itest"
alias pytest="pytest --pdbcls=IPython.core.debugger:Pdb -s"

# Tmux stuff
alias tls="tmux list-sessions"
alias ta="tmux attach -t"
alias tns="tmux new -s"
alias t="tmux"

# Git stuff
alias gc="git commit"
alias gd="git diff"
alias gdc="git diff --cached"
alias gap="git add --patch"
alias gcan="git commit --amend --no-edit"

# dotfile syncing
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
