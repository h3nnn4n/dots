# Add 'local' bin folders to path
export PATH=$HOME/.local/bin:$PATH
export PATH=$PATH:/usr/local/sbin
export PATH=$HOME/.poetry/bin:$PATH
export PATH="/opt/homebrew/bin:$PATH"

if [[ "$OSTYPE" == darwin* ]]; then
  export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
fi
