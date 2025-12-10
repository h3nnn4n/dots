# Project Instructions

## Git Operations

When working with files in `~/.config/`, always use the `dotfiles` alias instead of `git` commands.

The `dotfiles` alias is defined as:
```bash
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

### Examples:
- `dotfiles status` instead of `git status`
- `dotfiles add <file>` instead of `git add <file>`
- `dotfiles commit -m "message"` instead of `git commit -m "message"`
- `dotfiles push` instead of `git push`

This applies to all files under `~/.config/` including subdirectories like `~/.config/zshrc.d/`.
