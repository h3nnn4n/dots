# dots
My dot files

Setup and configuration based on git bare repository from [this](https://harfangk.github.io/2016/09/18/manage-dotfiles-with-a-git-bare-repository.html)

## Copy and paste instalation

```sh
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
git clone --bare https://www.github.com/h3nnn4n/dots $HOME/.dotfiles
dotfiles checkout
dotfiles config --local status.showUntrackedFiles no
dotfiles status
```
