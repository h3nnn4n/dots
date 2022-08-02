function current_time() {
  # macos date doesn't provide resolution greater than seconds
  # gdate isn't on the path yet when we need this but *almost*
  # assuredly perl is and it loads faster than anything else
  # https://superuser.com/a/713000
  perl -MTime::HiRes -e 'printf("%.0f\n",Time::HiRes::time()*1000)'
}
LOAD_START=$(current_time)

BENCH_RESULTS=$HOME/.zshrc_benchmarks
touch "${BENCH_RESULTS}"
printf "" > "${BENCH_RESULTS}"


ZSH_DISABLE_COMPFIX=true

export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="af-magic"

# Zsh plugins
plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh
# source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters



# Env setup
export EDITOR='nvim'


# Load other settings
# Based of: https://lobste.rs/s/r1tpld/your_bashrc_doesn_t_have_be_mess
export ZSHRC_D=$HOME/.config/zshrc.d
[[ -r ${ZSHRC_D}/bootstrap ]] && . ${ZSHRC_D}/bootstrap


# Starship prompt
eval "$(starship init zsh)"


# Zsh history sync
ZSH_HISTORY_FILE="${HOME}/.zsh_history"
ZSH_HISTORY_PROJ="${HOME}/.zsh_history_sync"
ZSH_HISTORY_FILE_ENC="${ZSH_HISTORY_PROJ}/zsh_history"
GIT_COMMIT_MSG="latest $(date)"


# Store load time
LOAD_END=$(current_time)
((LOAD_TIME=$LOAD_END - $LOAD_START))
export LOAD_TIME
