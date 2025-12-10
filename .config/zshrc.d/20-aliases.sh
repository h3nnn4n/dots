unset ll
unset la

alias ll="ls -lhrts"
alias la="ls -lharts"

# Utils
alias todo=~/personal-todo/todo.sh
alias berta="time bundle exec ruby -Itest"
alias pytest="pytest --pdbcls=IPython.core.debugger:Pdb -s"

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

tnsc () {
  SessionName=$1
  tmux new-session -d -s "${SessionName}"    && \
  tmux rename-window nvim                    && \
  tmux send-keys -t "${SessionName}:nvim" "nvim" C-m && \
  tmux new-window -d -n ravioli              && \
  tmux new-window -d -n fettuccine           && \
  tmux new-window -d -n claude               && \
  tmux send-keys -t "${SessionName}:claude" "claude" C-m && \
  tmux attach-session -d -t "${SessionName}"
}

# Random utils
unset d
alias d="say 'Done'"

alias s="say"
