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
alias tka="tmux kill-server"

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
  Detached=$2
  tmux new-session -d -s "${SessionName}"                && \
  tmux rename-window -t "${SessionName}:0" nvim          && \
  tmux send-keys -t "${SessionName}:0" "nvim" C-m        && \
  tmux new-window -d -t "${SessionName}" -n ravioli      && \
  tmux new-window -d -t "${SessionName}" -n fettuccine   && \
  tmux new-window -d -t "${SessionName}" -n claude       && \
  tmux send-keys -t "${SessionName}:claude" "claude" C-m

  if [[ "$Detached" != "-d" && "$Detached" != "--detached" ]]; then
    tmux attach-session -d -t "${SessionName}"
  fi
}

tnscall () {
  local current_dir="$(pwd)"
  for dir in */; do
    if [ -d "$dir" ]; then
      dirname="${dir%/}"
      echo "Creating tmux session for: $dirname"
      cd "$dirname"
      tnsc "$dirname" -d
      cd "$current_dir"
    fi
  done
  echo "Done! Created sessions for all directories."
  tls
}

# Random utils
unset d
alias d="say 'Done'"

alias s="say"
