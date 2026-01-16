# Global Claude Code Instructions

## Git Commit Guidelines

### Commit Message Format:
- **NEVER** add commit bodies unless the commit is exceptionally complex (which it usually should not be)
- Keep commit messages as simple one-line summaries
- **NEVER** add Claude as co-author
- **NEVER** add "Generated with Claude Code" footer or similar attribution
- Focus on clear, concise commit messages that describe the change

### Examples:
- Good: `git commit -m "Fix authentication bug in login flow"`
- Good: `git commit -m "Add dark mode toggle to settings"`
- Bad: Adding multi-line commit bodies with explanations unless absolutely necessary
- Bad: Adding co-author tags or attribution footers

## Dotfiles Management

When working with files in `~/.config/` or any dotfiles, always use the `dotfiles` alias instead of regular `git` commands.

The `dotfiles` alias is defined as:
```bash
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

### Usage:
- Use `dotfiles status` instead of `git status`
- Use `dotfiles add <file>` instead of `git add <file>`
- Use `dotfiles commit -m "message"` instead of `git commit -m "message"`
- Use `dotfiles push` instead of `git push`
- Use `dotfiles diff` instead of `git diff`
- Use `dotfiles log` instead of `git log`

This applies to all files under `~/.config/` and any other dotfiles in the home directory that are tracked by the dotfiles repository.
