# h3nnn4n's Neovim config files

The neovim config file that I use. Nothing fancy here.


## Making it work

- Setup [`vim-plug`](https://github.com/junegunn/vim-plug) using:
```
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

- Make sure python is installed (ideally python 3.10)

- Make sure `pynvim` is available with:
```
pip install pynvim
```

- Install other python goods:
```
pip install black isort jedi flake8 pyright
```

- Install the vim plugins with:
```
:PlugInstall
```

- Install pyright for the python lsp to work:
```
npm install -g pyright
```
