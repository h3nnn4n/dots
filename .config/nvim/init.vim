set t_Co=256


" Basic vim settings
set number
set linebreak
set nowrap
set showmatch
set visualbell

set hlsearch
set smartcase
set ignorecase
set incsearch

set autoindent
set expandtab
set shiftwidth=2
set smartindent
set smarttab
set softtabstop=2

set ruler

set undolevels=1000
set backspace=indent,eol,start

set cursorline
set cursorcolumn

"" List chars
set list
set listchars=""                  " Reset the listchars
set listchars+=tab:▸\             " a tab should display as "▸"
set listchars+=trail:.            " show trailing spaces as dots
"set listchars+=space:·            " show leading space as "·"
set listchars+=eol:¬              " show end of line as "¬"
set listchars+=extends:>          " The character to show in the last column when wrap is off and the line goes beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is off and the line goes beyond the left of the screen

set wildmenu

set colorcolumn=80,120

if !has('nvim')
  set mouse=a
  set term=xterm-256color
endif


let mapleader=","
set timeout timeoutlen=1500


" Plug stuff
call plug#begin()
Plug 'ryanoasis/vim-devicons'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'cespare/vim-toml'
Plug 'tikhomirov/vim-glsl'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'fszymanski/deoplete-emoji'
"Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
Plug 'racer-rust/vim-racer'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
Plug 'Shougo/denite.nvim'

Plug 'davidhalter/jedi-vim'
Plug 'a-vrma/black-nvim', {'do': ':UpdateRemotePlugins'}

Plug 'Konfekt/FastFold'
Plug 'tmhedberg/SimpylFold'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tveskag/nvim-blame-line'

Plug 'vim-scripts/django.vim'

Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rbenv', { 'for': 'ruby' }
Plug 'tpope/vim-bundler', { 'for': 'ruby' }
Plug 'stephpy/vim-yaml'

Plug 'machakann/vim-highlightedyank'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-rails'
Plug 'myusuf3/numbers.vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'godlygeek/tabular'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'scrooloose/nerdcommenter'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'neomake/neomake'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'bling/vim-airline'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'kien/rainbow_parentheses.vim'
Plug 'w0rp/ale'
call plug#end()


" Editor settings
let g:loaded_python_provider = 0
"let g:python3_host_prog = '/Users/renanssilva/.pyenv/shims/python3'


" Gir blame settings
nnoremap <silent> <leader>gb :ToggleBlameLine<CR>
let g:blameLineVirtualTextPrefix = ' // '
"autocmd BufEnter * EnableBlameLine


" Theme settings
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark='hard'
syntax on
colorscheme gruvbox
set background=dark
filetype plugin indent on

let $NVIM_TUI_ENABLE_TRUE_COLOR=1


" ALE
let b:ale_fixers = {'javascript': ['prettier', 'eslint'], 'python': ['pylint']}


" Rainbow parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


"" FZF STUFF
" Not sure if the manual path update is required with vim-plug
"set rtp+=/usr/local/opt/fzf " for osx, with homebrew
"set rtp+=~/.fzf  " For linux, with git
"let g:fzf_layout = { 'window': { 'width': 0.95, 'height': 0.7 } }
let g:fzf_layout = {}

if has('nvim') && !exists('g:fzf_layout')
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
endif

"nmap <Leader>f :call fzf#run({'source': 'git ls-files', 'sink': 'e'})<CR>
"nmap <Leader>F :call fzf#run({'sink': 'e'})<CR>

"nmap <Leader>f :call fzf#run({'source': 'git ls-files', 'sink': 'e', 'down': '40%'})<CR>
"nmap <Leader>F :call fzf#run({'sink': 'e', 'down': '40%'})<CR>
"nmap <Leader>l :BLines<CR>
"nmap <Leader>L :Lines<CR>

nnoremap <silent> <Leader>rg :Rg <C-R><C-W><CR>

" fzf.vim is hanging
 nmap <Leader>f :GFiles<CR>
 nmap <Leader>F :Files<CR>
 nmap <Leader>l :BLines<CR>
 nmap <Leader>L :Lines<CR>

nmap <Leader>/ :Rg<Space>


" stop using arrow keys!
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>


"vim-easymotion
let g:EasyMotion_smartcase = 1
map <leader><leader>c <plug>(easymotion-s2)

map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)


" airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1


" UltiSnips
"let g:UltiSnipsExpandTrigger="<leader>q"
"let g:UltiSnipsJumpForwardTrigger="<c-j>"
"let g:UltiSnipsJumpBackwardTrigger="<c-k>"
"let g:UltiSnipsSnippetsDir="/Users/renanssilva/.config/nvim/plugged/vim-snippets/UltiSnips"
"let g:UltiSnipsSnippetDirectories=["UltiSnips", "/Users/renanssilva/.config/nvim/plugged/vim-snippets/"]
"let g:UltiSnipsEditSplit="vertical"
"let g:UltiSnipsListSnippets="<leader>w"


" Uses C-n as shortcut for nerd tree
map <C-n> :NERDTreeToggle<CR>


" Vim-indent
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size  = 1

nmap <Leader>a; :Tabularize /::<CR>
vmap <Leader>a; :Tabularize /::<CR>

nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>

nmap <Leader>a+ :Tabularize /+<CR>
vmap <Leader>a+ :Tabularize /+<CR>

nmap <Leader>a- :Tabularize /-<CR>
vmap <Leader>a- :Tabularize /-<CR>

nmap <Leader>a* :Tabularize /*<CR>
vmap <Leader>a* :Tabularize /*<CR>

nmap <Leader>a/ :Tabularize //<CR>
vmap <Leader>a/ :Tabularize //<CR>


" Jedi 2
" disable autocompletion, because we use deoplete for completion
let g:jedi#completions_enabled = 0

" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"


" RGBDS
au BufRead,BufNewFile *.asm set filetype=rgbasm
au BufRead,BufNewFile *.inc set filetype=rgbasm


" Deoplete
let g:deoplete#enable_at_startup = 1
set completeopt-=preview

imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

let g:neosnippet#enable_snipmate_compatibility = 1
