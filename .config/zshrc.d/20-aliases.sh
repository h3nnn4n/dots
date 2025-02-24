unset gs
unset gl
unset ll
unset la

alias ll="ls -lhrts"
alias la="ls -lharts"

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
alias gb='git branch --sort=-committerdate --format="%(committerdate:relative)%09%(refname:short)"'
alias gck='git remote update && git checkout'
alias gk='git checkout'

# dotfile syncing
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Tmux stuff
alias tls="tmux list-sessions"
alias ta="tmux attach -t"
alias t="tmux"
alias tks="tmux kill-session"

tns () {
  SessionName=$1
  tmux new-session -d -s "${SessionName}"    && \
  tmux rename-window nvim                    && \
  tmux new-window -d -n ravioli              && \
  tmux new-window -d -n fettuccine           && \
  tmux attach-session -d -t "${SessionName}"
}

# Random utils
unset d
alias d="say 'Done'"

alias s="say"
