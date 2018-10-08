" Powerline
let g:powerline_pycmd = "py3" " Use Python 3
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
set rtp+=/usr/lib/python3.6/site-packages/powerline/bindings/vim
set laststatus=2         " Always show status line
set t_Co=256             " Use 256 colours
set encoding=UTF-8

" Hack to allow Alt key usage
let c='a'
while c <= 'z'
    exec "set <A-".c.">=\e".c
    exec "imap \e".c." <A-".c.">"
    let c = nr2char(1+char2nr(c))
endw
let c='1'
while c <= '9'
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
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'airblade/vim-gitgutter'
    Plug 'junegunn/vim-peekaboo'
    Plug 'rccoles/vim-markaboo'
call plug#end()

" Tree
let NERDTreeMinimalUI  = 1
let NERDTreeDirArrows  = 1
let NERDTreeShowHidden = 1
let g:NERDTreeWinSize  = 36
nmap <silent> <A-Up>    :wincmd k<CR>
nmap <silent> <A-Down>  :wincmd j<CR>
nmap <silent> <A-Left>  :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
nmap <silent> <A-k>     :wincmd k<CR>
nmap <silent> <A-j>     :wincmd j<CR>
nmap <silent> <A-h>     :wincmd h<CR>
nmap <silent> <A-l>     :wincmd l<CR>
map  <C-\>              :NERDTreeToggle<CR>
autocmd VimEnter * NERDTree  " Autostart NERDTree
autocmd VimEnter * wincmd p  " And then focus on file
autocmd BufWinEnter * NERDTreeMirror
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Quicker Tab Shortcuts
nmap <A-1> 1gt
nmap <A-2> 2gt
nmap <A-3> 3gt
nmap <A-4> 4gt
nmap <A-5> 5gt
nmap <A-6> 6gt
nmap <A-7> 7gt
nmap <A-8> 8gt
nmap <A-9> 9gt

" YCM Autocompletion
" Don't ask to load config - maybe insecure
let g:ycm_confirm_extra_conf = 0
" Allow jump to erros using :lne and :lp
let g:ycm_always_populate_location_list = 1
" Allow completion from system preprocessor macros
let g:ycm_collect_identifiers_from_tags_files = 1
" More debug
let g:ycm_log_level = 'debug'
" Set to python3 explicitly
let g:ycm_path_to_python_interpreter = '/usr/bin/python3'
" Start completion from the first character
let g:ycm_min_num_of_chars_for_completion = 1
" Don't cache completion items
let g:ycm_cache_omnifunc = 0
" Complete syntax keywords
let g:ycm_seed_identifiers_with_syntax = 1
" Let g:ycm_show_diagnostics_ui = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
" Check on save
autocmd BufWritePost * YcmForceCompileAndDiagnostics

command! Declaration YcmCompleter GoToDeclaration
command! Definition  YcmCompleter GoToDefinition
command! Fix         YcmCompleter FixIt

" Fix for OpenCL files
au BufReadPost *.cl set syntax=c

" Latex 
let g:tex_flavor = 'latex'
let g:vimtex_latexmk_continuous = 1

" Git good with the code!
let g:gitgutter_terminal_reports_focus=0
let g:gitgutter_map_keys=0
set updatetime=100
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'
command! Stage GitGutterStageHunk
command! Undo  GitGutterUndoHunk
highlight link GitGutterAdd          Function
highlight link GitGutterChange       Special
highlight link GitGutterDelete       Tag
highlight link GitGutterChangeDelete Special

" Git good in the tree!
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "~",
    \ "Staged"    : "+",
    \ "Untracked" : "■",
    \ "Renamed"   : "⇒",
    \ "Unmerged"  : "≈",
    \ "Deleted"   : "-",
    \ "Dirty"     : "~",
    \ "Clean"     : "✓",
    \ "Ignored"   : "□",
    \ "Unknown"   : "‽"
    \ }

" Commenting
filetype plugin on
autocmd FileType c setlocal commentstring=//\ %s
autocmd FileType h setlocal commentstring=//\ %s
autocmd FileType cpp setlocal commentstring=//\ %s
autocmd FileType hpp setlocal commentstring=//\ %s
nmap <silent> <C-_> gcc
imap <silent> <C-_> <C-o>gcc
vmap <silent> <C-_> gc

" Peekaboo for paste
let g:peekaboo_window = 'vert bel 50new'

" Markaboo
let g:markaboo_window = 'vert bel 50new'
let g:markaboo_enable_special = 1
let g:markaboo_marks_special = '."'''

" I need to stop pasting these damn things @RcColes gives me
fu! DeleteInactiveBufs()
    "From tabpagebuflist() help, get a list of all buffers in all tabs
    let tablist = []
    for i in range(tabpagenr('$'))
        call extend(tablist, tabpagebuflist(i + 1))
    endfor

    "Below originally inspired by Hara Krishna Dara and Keith Roberts
    "http://tech.groups.yahoo.com/group/vim/message/56425
    let nWipeouts = 0
    for i in range(1, bufnr('$'))
        if bufexists(i) && !getbufvar(i,"&mod") && index(tablist, i) == -1
        " bufno exists AND isn't modified AND isn't in the list of buffers open
        " in windows and tabs
            silent exec 'bwipeout' i
            let nWipeouts = nWipeouts + 1
        endif
    endfor
endfunction
autocmd WinEnter * call DeleteInactiveBufs()

" I've now pasted so many of @RcColes' things that I need fixes for the fixes
set t_RV=
autocmd VimEnter * redraw!

" Indentation
set autoindent           " Use auto indentation
set copyindent           " Copy previous indentation when auto indenting
set noexpandtab          " Use soft tabs (expand tab -> spaces)
set tabstop=8            " Use 4 spaces for soft tabs
set shiftwidth=8         " Use 4 spaces for reindenation
set softtabstop=8        " Use 4 spaces in insert mode
set smarttab             " Insert tabs on the start of line according to shiftwidth not tabstop

" Undo & History
set history=1000         " Remember more commands and search history
set undolevels=1000      " MOAR levels of undo
set visualbell           " Don't beep
set noerrorbells         " Don't beep

" Who needs swap files and backups? Not me!
set nobackup
set nowb
set noswapfile

" Search
set ignorecase
set smartcase            " Ignore case if all lower case, else search is case sensitive
set hlsearch             " Highlight searched terms
set incsearch            " Show highlighted terms as you search

" Appearence
set number               " Line numbers are great
set title                " Change the terminal's title
set wildmenu             " Fancy autocompletion
syntax on                " Use syntax highlighting (assuming terminal has colour support)
colorscheme adventurous  " Use in-built elflord colourscheme
" 80 Character ENFORCING
let &colorcolumn=join(range(81,999),",")
set cursorline

" Map :W to sudo write
command W w !sudo tee % > /dev/null

" date string option
iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>

" Misc
set novisualbell
set pastetoggle=<F2>     " Paste mode when pressing F2 (disables smart tab do-da's)
set mouse=a              " We like using the mouse (filthy cretin)
set scrolloff=999        " Broken Typewriter mode
