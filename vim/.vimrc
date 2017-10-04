" Powerline
let g:powerline_pycmd = "py3" " Use Python 3
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
set rtp+=/usr/lib/python3.6/site-packages/powerline/bindings/vim
set laststatus=2         " Always show status line
set t_Co=256             " Use 256 colours


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
colorscheme elflord      " Use in-built elflord colourscheme


" Undo & History
set history=1000         " Remember more commands and search history
set undolevels=1000      " MOAR levels of undo
set visualbell           " Don't beep
set noerrorbells         " Don't beep

" Search
set smartcase            " Ignore case if all lower case, else search is case sensitive
set hlsearch             " Highlight searched terms
set incsearch            " Show highlighted terms as you search

" Misc
set novisualbell
set pastetoggle=<F2>     " Paste mode when pressing F2 (disables smart tab do-da's)
