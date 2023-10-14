if [[ "$OSTYPE" == "darwin"* ]]; then
  if ! command -v brew &> /dev/null
  then
    eval "$(${HOME}/homebrew/bin/brew shellenv)"
    export PATH="/Users/horse/homebrew/opt/mysql-client/bin:$PATH"
  fi
fi
