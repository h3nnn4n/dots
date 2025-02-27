set t_Co=256


" -------------------- vim stuff --------------------
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

set clipboard+=unnamedplus

set ruler

set undolevels=1000
set backspace=indent,eol,start

set cursorline
set cursorcolumn

set lazyredraw
set undofile

"" List chars
set list
set listchars=""                  " Reset the listchars
set listchars+=tab:▸\             " a tab should display as "▸"
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=space:·            " show leading space as "·"
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


" -------------------- Plugin setup --------------------
call plug#begin()
Plug 'editorconfig/editorconfig-vim'
Plug 'embear/vim-localvimrc'
Plug 'wellle/context.vim'
"Plug 'nvim-treesitter/nvim-treesitter'
"Plug 'romgrk/nvim-treesitter-context'

Plug 'ryanoasis/vim-devicons'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'cespare/vim-toml'
Plug 'tikhomirov/vim-glsl'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'racer-rust/vim-racer'
Plug 'Shougo/denite.nvim'
Plug 'chiedo/vim-case-convert'

Plug 'davidhalter/jedi-vim'
Plug 'stsewd/isort.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'a-vrma/black-nvim', {'do': ':UpdateRemotePlugins'}
Plug 'stsewd/isort.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'Konfekt/FastFold'
Plug 'tmhedberg/SimpylFold'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'vim-scripts/django.vim'

Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rbenv', { 'for': 'ruby' }
Plug 'tpope/vim-bundler', { 'for': 'ruby' }
Plug 'stephpy/vim-yaml'

Plug 'mbbill/undotree'

Plug 'vim-scripts/a.vim'
Plug 'rhysd/vim-clang-format'
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

Plug 'neovim/nvim-lspconfig'
Plug 'w0rp/ale'

Plug 'nathangrigg/vim-beancount'

Plug 'hashivim/vim-terraform'
Plug 'vim-syntastic/syntastic'
Plug 'juliosueiras/vim-terraform-completion'

Plug 'github/copilot.vim'

" Required by typescript-tool
Plug 'nvim-lua/plenary.nvim'

Plug 'leafOfTree/vim-svelte-plugin'
Plug 'pmizio/typescript-tools.nvim'
Plug 'Shougo/context_filetype.vim'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
call plug#end()


" -------------------- Providers --------------------
let g:loaded_python_provider = 1
let g:loaded_ruby_provider = 0
let g:loaded_perl_provider = 0


" -------------------- ALE --------------------
let g:ale_linters = { 'python': ['pyright', 'bandit', 'flake8'] }

let g:ale_python_auto_poetry = 1

"let g:ale_python_flake8_executable = 'poetry run flake8'
"let g:ale_python_bandit_executable = 'poetry run bandit'
"let g:ale_python_pyright_executable = 'poetry run pyright'

"let g:ale_python_pyright_auto_poetry = 1
"let g:ale_python_flake8_auto_poetry = 1


" -------------------- Rainbow Parentheses --------------------
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


" -------------------- FZF --------------------
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


" -------------------- EasyMotion --------------------
let g:EasyMotion_smartcase = 1
map <leader><leader>c <plug>(easymotion-s2)

map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)


" -------------------- Theme --------------------
" Theme settings
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark='hard'
syntax on
colorscheme gruvbox
set background=dark
filetype plugin indent on

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1


" -------------------- Vim-indent --------------------
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size  = 1


" -------------------- Tabularize --------------------
nmap <Leader>a: :Tabularize /:<CR>
vmap <Leader>a: :Tabularize /:<CR>

nmap <Leader>a. :Tabularize /.<CR>
vmap <Leader>a. :Tabularize /.<CR>

nmap <Leader>a, :Tabularize /,<CR>
vmap <Leader>a, :Tabularize /,<CR>

nmap <Leader>a; :Tabularize /;<CR>
vmap <Leader>a; :Tabularize /;<CR>

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


" -------------------- Assembly --------------------
au BufRead,BufNewFile *.asm set filetype=rgbasm
au BufRead,BufNewFile *.inc set filetype=rgbasm


" -------------------- Deoplete --------------------
let g:deoplete#enable_at_startup = 1
set completeopt-=preview

imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

vmap <F3> :ContextPeek<CR>
nmap <F2> :ContextPeek<CR>
imap <F2> :ContextPeek<CR>
smap <F2> :ContextPeek<CR>
xmap <F2> :ContextPeek<CR>


" -------------------- Snippets --------------------
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.config/nvim/snippets'

let g:context_enabled = 0


" -------------------- Python Stuff --------------------
" Black
nnoremap <buffer><silent> <leader>q <cmd>call Black()<cr>
inoremap <buffer><silent> <leader>q <cmd>call Black()<cr>


" Isort
nnoremap <buffer><silent> <leader>i :Isort<cr>
inoremap <buffer><silent> <leader>i :Isort<cr>

let g:black#settings = {
    \ 'fast': 1
\}


" Jedi
" disable autocompletion, because we use deoplete for completion
let g:jedi#completions_enabled = 0

" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"


" -------------------- SQL --------------------
" Simple SQL Formatter
autocmd FileType sql call SqlFormatter()

function SqlFormatter()
  set noai
  map <leader>pt  :%!sqlformat --reindent --keywords upper --identifiers lower -<CR>
endfunction


" -------------------- NerdTree --------------------
" Uses C-n as shortcut for nerd tree
map <C-n> :NERDTreeToggle<CR>
set wildignore+=*.pyc,*.o,*.obj,*.svn,*.swp,*.class,*.hg,*.DS_Store,*.min.*
let NERDTreeRespectWildIgnore=1

"" Refresh nerdtree with `<leader>r`
nmap <Leader>r :NERDTreeFocus<cr>R<c-w><c-p>


" -------------------- LSP --------------------
"  Taken from:
"  https://gist.github.com/mengwangk/570a6ceb8cd14e55f4d89ac865850418#file-init-vim-L102
lua require('lsp')

" Completion
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']


" -------------------- Custom Stuff --------------------
"" Make Q repeat the last macro instead of Ex mode
nnoremap Q @@


" stop using arrow keys!
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>


" -------------------- Prettier --------------------
let g:prettier#quickfix_enabled = 0
let g:prettier#autoformat_require_pragma = 0
au BufWritePre *.css,*.svelte,*.pcss,*.html,*.ts,*.js,*.json PrettierAsync


" stuff to handle svelte files which have multiple languages / syntaxes in them
if !exists('g:context_filetype#same_filetypes')
  let g:context_filetype#filetypes = {}
endif

let g:context_filetype#filetypes.svelte =
\ [
\   {'filetype' : 'javascript', 'start' : '<script>', 'end' : '</script>'},
\   {
\     'filetype': 'typescript',
\     'start': '<script\%( [^>]*\)\? \%(ts\|lang="\%(ts\|typescript\)"\)\%( [^>]*\)\?>',
\     'end': '',
\   },
\   {'filetype' : 'css', 'start' : '<style \?.*>', 'end' : '</style>'},
\ ]

let g:ft = ''


" -------------------- NERDCommenter --------------------

let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDCustomDelimiters = { 'html': { 'left': '' } }

" Align comment delimiters to the left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Handle comments for svelte files according to the local context (ie lang)
fu! NERDCommenter_before()
  if (&ft == 'html') || (&ft == 'svelte')
    let g:ft = &ft
    let cfts = context_filetype#get_filetypes()
    if len(cfts) > 0
      if cfts[0] == 'svelte'
        let cft = 'html'
      elseif cfts[0] == 'scss'
        let cft = 'css'
      else
        let cft = cfts[0]
      endif
      exe 'setf ' . cft
    endif
  endif
endfu

fu! NERDCommenter_after()
  if (g:ft == 'html') || (g:ft == 'svelte')
    exec 'setf ' . g:ft
    let g:ft = ''
  endif
endfu
