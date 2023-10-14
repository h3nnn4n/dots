# Python stuff

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  export PATH="$HOME/.pyenv/shims:$PATH"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  export PYENV_ROOT="$HOME/.pyenv"
  command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
fi


export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"


eval "$(pyenv init -)"
