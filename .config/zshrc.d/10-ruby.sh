export PATH="$HOME/.rbenv/bin:$PATH"

if (( $+commands[rbenv] ))
then
  eval "$(rbenv init -)"
  source $HOME/.rbenv/completions/rbenv.zsh
fi
