# Python stuff
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
eval "$(pipenv --completion)"
export PATH="$HOME/.pyenv/shims:$PATH"

export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
export WORKON_HOME=$HOME/.virtualenvs

if [[ -a virtualenvwrapper_lazy ]]; then
  pyenv virtualenvwrapper_lazy
fi

# This has a tendency to make the shell explode, somehow
# source $(which virtualenvwrapper.sh)
