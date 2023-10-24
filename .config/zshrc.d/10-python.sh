# Python stuff

export PYENV_ROOT="$HOME/.pyenv"

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  export PATH="$PYENV_ROOT/bin:$PATH"
  export PATH="$HOME/.pyenv/shims:$PATH"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
fi

eval "$(pyenv init -)"
