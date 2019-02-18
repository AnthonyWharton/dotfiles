"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Vim Settings
""" ============
""" Stock settings, bindings, macro's etc.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Indentation
set autoindent           " Use auto indentation
set copyindent           " Copy previous indentation when auto indenting
set noexpandtab          " Use soft tabs (expand tab -> spaces)
set tabstop=8            " Use 8 spaces for soft tabs
set shiftwidth=8         " Use 8 spaces for reindenation
set softtabstop=8        " Use 8 spaces in insert mode
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

" Search Options
set ignorecase
set smartcase            " Ignore case if all lower case, else search is case sensitive
set hlsearch             " Highlight searched terms
set incsearch            " Show highlighted terms as you search

" Appearence
set encoding=UTF-8       " Use UTF-8
set t_Co=256             " Use 256 colours
set laststatus=2         " Always show status line
set number               " Line numbers are great
set title                " Change the terminal's title
set wildmenu             " Fancy autocompletion
syntax on                " Use syntax highlighting (assuming terminal has colour support)
syntax spell toplevel
colorscheme adventurous
let &colorcolumn="80,".join(range(100,999),",") " Colour 80 char column and column's >100
set cursorline
set list                 " Show whitespace characters, and configure
set listchars=tab:\|\ ,trail:·,

" Map :W to sudo write
command W w !sudo tee % > /dev/null

" date string option
iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>

" Misc
set novisualbell
set pastetoggle=<F2>     " Paste mode when pressing F2 (disables smart tab do-da's)
set mouse=a              " We like using the mouse (filthy cretin)
set scrolloff=100        " Broken Typewriter mode

" " Hack to allow Alt key usage
" let c='a'
" while c <= 'z'
"     exec "set <A-".c.">=\e".c
"     exec "imap \e".c." <A-".c.">"
"     let c = nr2char(1+char2nr(c))
" endw
" let c='1'
" while c <= '9'
"     exec "set <A-".c.">=\e".c
"     exec "imap \e".c." <A-".c.">"
"     let c = nr2char(1+char2nr(c))
" endw
" set timeout ttimeoutlen=50

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

" Fix for OpenCL files
au BufReadPost *.cl set syntax=c

" Strip trailing whitespace on file save
fun! StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePost * :call StripTrailingWhitespaces()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Plug Plugin Definitions
""" =======================
""" Some are disabled by default assuming that they are not needed on a quick
""" new installation.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/vim-plug-plugins')
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'scrooloose/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-commentary'
    Plug 'lervag/vimtex'
    Plug 'inkarkat/vim-spellcheck'    " Spell Checking
    Plug 'vim-scripts/ingo-library'   " Required for Spell Checking
    " Plug 'Valloric/YouCompleteMe'
    " Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" Airline
let g:airline_theme = "murmur"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" NERDTree
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
autocmd VimEnter * call OpenNERDTree()  " Autostart NERDTree
autocmd VimEnter * wincmd p             " And then focus on file
autocmd BufWinEnter * NERDTreeMirror
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd TabLeave * if bufname('') =~ "Nerd_tree" | wincmd l | endif

" Autostarts NERDTree if the window is wide enough
function OpenNERDTree()
	if winwidth(0) > 120
		NERDTree
	endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" YCM
" Don't ask to load config - maybe insecure
let g:ycm_confirm_extra_conf = 0
" Allow jump to erros using :lne and :lp
let g:ycm_always_populate_location_list = 1
" Allow completion from system preprocessor macros
let g:ycm_collect_identifiers_from_tags_files = 1
" More debug
let g:ycm_log_level = 'debug'
" Set to python3 explicitly
let g:ycm_python_binary_path = '/usr/bin/python3'
let g:ycm_path_to_python_interpreter = '/usr/bin/python3'
" Set to rust explicitly
let g:ycm_path_rust_src_path = '~/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'
" Start completion from the first character
let g:ycm_min_num_of_chars_for_completion = 1
" Don't cache completion items
let g:ycm_cache_omnifunc = 0
" Complete syntax keywords
let g:ycm_seed_identifiers_with_syntax = 1
" Let g:ycm_show_diagnostics_ui = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
" Open goto commands in a new tab
let g:ycm_goto_buffer_command="new-tab"

" hi YcmErrorSign guifg=#F92672 guibg=#232526
" hi YcmWarningSign guifg=#FD971F guibg=#232526

" Lint file on save
autocmd BufWritePost *.c,*.h,*.cpp,*.py call RunCheck()

function RunCheck()
	YcmForceCompileAndDiagnostics
	YcmDiags
	if (youcompleteme#GetErrorCount() == 0 && youcompleteme#GetWarningCount() == 0) | lclose | else | ll | endif
endfunction

let g:ycm_open_loclist_on_ycm_diags=1

function! s:CustomizeYcmLocationWindow()
	wincmd p
endfunction

" autocmd User YcmLocationOpened call s:CustomizeYcmLocationWindow()

" Commands
command! Include     YcmCompleter GoToInclude
command! Declaration YcmCompleter GoToDeclaration
command! Definition  YcmCompleter GoToDefinition
command! References  YcmCompleter GoToReferences
command! Type        YcmCompleter GetType
command! Doc         YcmCompleter GetDoc
command! Fix         YcmCompleter FixIt

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" VimTex
let g:tex_flavor = 'latex'
let g:vimtex_latexmk_continuous = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" GitGutter
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" NERDTree-git
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" Commentary
filetype plugin on
autocmd FileType c setlocal commentstring=//\ %s
autocmd FileType h setlocal commentstring=//\ %s
autocmd FileType cpp setlocal commentstring=//\ %s
autocmd FileType hpp setlocal commentstring=//\ %s
nmap <silent> <C-_> gcc
imap <silent> <C-_> <C-o>gcc
vmap <silent> <C-_> gc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" Peekaboo
let g:peekaboo_window = 'vert bel 50new'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" Markaboo
let g:markaboo_window = 'vert bel 50new'
let g:markaboo_enable_special = 1
let g:markaboo_marks_special = '."'''

" Clears the QuickfixLists
function ClearQuickfixList()
	call setqflist([])
endfunction

command! ClearQuickfixList call ClearQuickfixList()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" Spellcheck
autocmd FileType tex setlocal spell spelllang=en_gb
autocmd FileType txt setlocal spell spelllang=en_gb
autocmd FileType md setlocal spell spelllang=en_gb
autocmd BufWritePost *.txt,*.tex,*.md | call ClearQuickfixList() | SpellCheck! | cw
let g:SpellCheck_DefineAuxiliaryCommands = 0
let g:SpellCheck_DefineQuickfixMappings = 0

" I've now pasted so many of @RcColes' things that I need fixes for the fixes
" set t_RV=
" autocmd VimEnter * redraw!

