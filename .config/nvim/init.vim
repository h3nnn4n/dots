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
"set listchars+=space:·            " show leading space as "·"
"set listchars+=eol:¬              " show end of line as "¬"
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
lua require('plugins')


" -------------------- Providers --------------------
let g:loaded_python_provider = 1
let g:loaded_ruby_provider = 0
let g:loaded_perl_provider = 0


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


" -------------------- Snippets --------------------
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

vmap <F3> :ContextPeek<CR>
nmap <F2> :ContextPeek<CR>
imap <F2> :ContextPeek<CR>
smap <F2> :ContextPeek<CR>
xmap <F2> :ContextPeek<CR>

let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.config/nvim/snippets'

let g:context_enabled = 0


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


" -------------------- LSP / completion / format / lint --------------------
lua require('completion')
lua require('lsp')
lua require('treesitter')
lua require('format')
lua require('lint')
lua require('which-key-setup')
lua require('minuet-setup')
lua require('codecompanion-setup')

" -------------------- Cheatsheets --------------------
silent! helptags ALL
nnoremap <silent> <leader>a? :help ai-cheatsheet<CR>
nnoremap <silent> <leader>?  :help coding-cheatsheet<CR>

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
