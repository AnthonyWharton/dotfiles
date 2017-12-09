" Powerline
let g:powerline_pycmd = "py3" " Use Python 3
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
set rtp+=/usr/lib/python3.6/site-packages/powerline/bindings/vim
set laststatus=2         " Always show status line
set t_Co=256             " Use 256 colours

" Hack to allow Alt key usage
let c='a'
while c <= 'z'
    exec "set <A-".c.">=\e".c
    exec "imap \e".c." <A-".c.">"
    let c = nr2char(1+char2nr(c))
endw
set timeout ttimeoutlen=50

call plug#begin('~/.vim/vim-plug-plugins')
    Plug 'scrooloose/nerdtree'
    Plug 'lervag/vimtex'
    Plug 'Valloric/YouCompleteMe'
    Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
    Plug 'tpope/vim-commentary'
call plug#end()

" Tree
let NERDTreeMinimalUI  = 1
let NERDTreeDirArrows  = 1
let NERDTreeShowHidden = 1
let g:NERDTreeWinSize  = 30
nmap <silent> <A-Up>    :wincmd k<CR>
nmap <silent> <A-Down>  :wincmd j<CR>
nmap <silent> <A-Left>  :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
nmap <silent> <A-k>     :wincmd k<CR>
nmap <silent> <A-j>     :wincmd j<CR>
nmap <silent> <A-h>     :wincmd h<CR>
nmap <silent> <A-l>     :wincmd l<CR>
map <C-n> :NERDTreeToggle<CR>
autocmd VimEnter * NERDTree  " Autostart NERDTree
autocmd VimEnter * wincmd p  " And then focus on file
autocmd BufWinEnter * NERDTreeMirror
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Latex 
let g:tex_flavor = 'latex'
let g:vimtex_latexmk_continuous = 1

" Indentation
set autoindent           " Use auto indentation
set copyindent           " Copy previous indentation when auto indenting
set expandtab            " Use soft tabs (expand tab -> spaces)
set tabstop=4            " Use 4 spaces for soft tabs
set shiftwidth=4         " Use 4 spaces for reindenation
set softtabstop=4        " Use 4 spaces in insert mode
set smarttab             " Insert tabs on the start of line according to shiftwidth not tabstop

" Appearence
set number               " Line numbers are great
set title                " Change the terminal's title
set wildmenu             " Fancy autocompletion
syntax on                " Use syntax highlighting (assuming terminal has colour support)
colorscheme adventurous  " Use in-built elflord colourscheme
" 80 Character ENFORCING
let &colorcolumn=join(range(81,999),",")
set cursorline

" Undo & History
set history=1000         " Remember more commands and search history
set undolevels=1000      " MOAR levels of undo
set visualbell           " Don't beep
set noerrorbells         " Don't beep

" Search
set smartcase            " Ignore case if all lower case, else search is case sensitive
set hlsearch             " Highlight searched terms
set incsearch            " Show highlighted terms as you search

"Commenting
filetype plugin on
nmap <silent> <C-_>    gcc
imap <silent> <C-_>    <C-o>gcc
vmap <silent> <C-_>    gc

" Misc
set novisualbell
set pastetoggle=<F2>     " Paste mode when pressing F2 (disables smart tab do-da's)
