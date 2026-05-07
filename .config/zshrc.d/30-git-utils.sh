#declare gb > /dev/null && unalias gb


function is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

function gf() {
  is_in_git_repo &&
    git -c color.status=always status --short |
    fzf --height 40% -m --ansi --nth 2..,.. | awk '{print $2}'
}

function gbb() {
  is_in_git_repo &&
    git branch -a -vv --color=always | grep -v '/HEAD\s' |
    fzf --height 40% --ansi --multi --tac | sed 's/^..//' | awk '{print $1}' |
    sed 's#^remotes/[^/]*/##'
}

function gb() {
  gbb | xargs git checkout
}

function gt() {
  is_in_git_repo &&
    git tag --sort -version:refname |
    fzf --height 40% --multi
}

function gl() {
  is_in_git_repo &&
    git log --date=short --format="%C(green)%C(bold)%cd %C(auto)%h%d %s (%an)" --graph |
    fzf --height 40% --ansi --no-sort --reverse --multi | grep -o '[a-f0-9]\{7,\}'
}

function gr() {
  is_in_git_repo &&
    git remote -v | awk '{print $1 " " $2}' | uniq |
    fzf --height 40% --tac | awk '{print $1}'
}

# Git update: fetch, pull current branch, merge with origin/master
function gup() {
  is_in_git_repo || return 1
  local current_branch=$(git branch --show-current)
  echo "Fetching from all remotes..."
  git fetch || return 1
  echo "Pulling ${current_branch} from origin..."
  git pull origin "${current_branch}" || return 1
  echo "Merging with origin/master..."
  git merge origin/master --no-edit || return 1
  echo "✓ Update complete"
}

# Git update and push: fetch, pull current branch, merge with origin/master, push to upstream
function gupp() {
  is_in_git_repo || return 1
  local current_branch=$(git branch --show-current)
  echo "Fetching from all remotes..."
  git fetch || return 1
  echo "Pulling ${current_branch} from origin..."
  git pull origin "${current_branch}" || return 1
  echo "Merging with origin/master..."
  git merge origin/master --no-edit || return 1
  echo "Pushing ${current_branch} to upstream..."
  git push origin "${current_branch}" || return 1
  echo "✓ Update and push complete"
}

function gck() {
  git fetch origin "$1" || return 1
  # Create local branch tracking origin if it doesn't exist yet
  git checkout "$1" 2>/dev/null || git checkout -b "$1" --track "origin/$1" || return 1
  git pull origin "$1"
}

gnb () {
  if ! git diff --quiet || ! git diff --cached --quiet; then
    echo "Uncommitted changes detected, aborting."
    return 1
  fi
  git checkout master && git pull && git checkout -b "$1"
}

gcm () {
  if ! git diff --quiet || ! git diff --cached --quiet; then
    echo "Uncommitted changes detected, aborting."
    return 1
  fi
  git checkout master && git pull
}

# Git aliases
unset gs
unset gl

alias gl="git log --pretty=oneline --color | head -n 15"
alias gla="git log --pretty=oneline --color"
alias gs="git status"
alias gc="git commit"
alias gcnn="git commit --no-edit --no-verify"
alias gd="git diff"
alias gdc="git diff --cached"
alias gap="git add --patch"
alias gca="git commit --amend"
alias gcan="git commit --amend --no-edit"
alias gb='git branch --sort=-committerdate --format="%(committerdate:relative)%09%(refname:short)" | head -n 15'
alias gba='git branch --sort=-committerdate --format="%(committerdate:relative)%09%(refname:short)"'
alias gk='git checkout'
alias gru='git remote update'

find_branch() {
  if [[ -z "$1" ]]; then
    echo "Usage: find_branch <pattern>"
    return 1
  fi

  local pattern="$1"
  local sep=$'\x1f'
  local results=""

  for dir in */; do
    [[ -d "$dir" ]] || continue
    local d="${dir%/}"

    git -C "$d" rev-parse --git-dir >/dev/null 2>&1 || continue

    local matches
    matches=$(git -C "$d" branch --sort=-committerdate \
      --format="%(refname:short)${sep}%(objectname:short)${sep}%(committerdate:relative)${sep}%(contents:subject)" \
      | head -n 10 \
      | grep -F -- "$pattern")

    [[ -z "$matches" ]] && continue

    while IFS="$sep" read -r branch sha age subject; do
      results+="${d}${sep}${branch}${sep}${age}${sep}${sha}${sep}${subject}"$'\n'
    done <<< "$matches"
  done

  if [[ -z "$results" ]]; then
    echo "No matching branches found."
    return 1
  fi

  printf '%s' "$results" | column -t -s "$sep"
}
