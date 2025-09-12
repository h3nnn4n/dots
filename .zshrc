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

# git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Zsh plugins
# For fzf-zsh-plugin: git clone https://github.com/unixorn/fzf-zsh-plugin.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-zsh-plugin
# For zsh-autosuggestions: git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
plugins=(git zsh-autosuggestions fzf-zsh-plugin)


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
