set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" " different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
" vim-colors-solarized
Plugin 'altercation/vim-colors-solarized'
" THE NERD TREE
Plugin 'scrooloose/nerdtree'
" Powerline
Plugin 'https://github.com/Lokaltog/vim-powerline.git'
" VIM-JAVASCRIPT
Plugin 'pangloss/vim-javascript'
" emmet
Plugin 'mattn/emmet-vim'
" Auto-Indentation
Plugin 'vim-scripts/indentpython.vim'
" Auto-complete
Plugin 'Valloric/YouCompleteMe'
" Syntax Checking/Highlighting
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
" Super Searching (press Ctrl-P to enable the search)
Plugin 'kien/ctrlp.vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" python {{{
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

" Flagging Unnecessary Whitespace
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

"python with virtualenv support
"py << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"    project_base_dir = os.environ['VIRTUAL_ENV']
"    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"    execfile(activate_this, dict(__file__=activate_this))
"EOF

" make your code look pretty
let python_highlight_all=1
syntax on

" }}}

" Auto-complete {{{
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" }}}

" emmet {{{
let g:user_emmet_leader_key='<C-Z>'
let g:user_emmet_mode='a'    "enable all function in all mode.
" }}}

" Powerline {{{
set encoding=utf-8
set laststatus=2
set t_Co=256
let g:Powerline_symbols= 'unicode'
" }}}

" vim-javascript {{{
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1

" }}}

" Split Layouts {{{
set splitbelow
set splitright
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" }}}

" ---Colors---
" Syntex Color Solarized
syntax enable
set t_Co=256
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

" ---UI Config---
" Set Line Number, No Compatible, Auto Indent
set number
set nocompatible
set binary
set noeol
set scrolloff=3
set autoindent
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
" set cursorcolumn
filetype indent on      " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]

" ---Spaces & Tabs---
" Set tab space, 80 Columns
set tabstop=4
set shiftwidth=4
set colorcolumn=80
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces
set wrap

" ---Searching---
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
" turn off search highlight
nnoremap <leader> <space> :nohlsearch<CR>
set ic

" ---Folding---
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
" space open/closes folds
nnoremap <space> za
set foldmethod=indent   " fold based on indent level
set foldlevel=99

" ---Movement---
nnoremap j gj
nnoremap k gk
" move to beginning/end of line
nnoremap B ^
nnoremap E $
" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>
" highlight last inserted text
nnoremap gV `[v`]

" ---Leader Shortcuts---
let mapleader="\<Space>"       " leader is space
" jk is escape
inoremap jk <esc>

" Other
let g:vim_markdown_folding_disabled=1

" allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Key Mapping
nnoremap <silent> <Tab>	:NERDTreeToggle<CR>
nnoremap <silent> <A-RIGHT>	gt<CR>
nnoremap <silent> <A-LEFT>	gT<CR>
nnoremap <C-N> :tabnew<CR>

" Format
nnoremap <silent> <C-F>	gg=G<CR>

" Copy, Paste, Select All
vnoremap <C-C> y
nnoremap <C-V> P
nnoremap <C-A> ggVG
inoremap <C-A> <Esc>ggVG

" Block Switch
map <S-LEFT> <C-W>h
map <S-RIGHT> <C-W>l
map <S-UP> <C-W>k
map <S-DOWN> <C-W>j

noremap <silent> <Leader>w :call ToggleDisplayMove()<CR>

let ToggleDisplayMove_Mode = 0

function PhysicalLineMove()
    silent! nunmap <buffer> <Up>
    silent! nunmap <buffer> <Down>
    silent! nunmap <buffer> <Home>
    silent! nunmap <buffer> <End>
    silent! iunmap <buffer> <Up>
    silent! iunmap <buffer> <Down>
    silent! iunmap <buffer> <Home>
    silent! iunmap <buffer> <End>
    let g:ToggleDisplayMove_Mode = 0
endfunction

function DisplayedLineMove()
    noremap  <buffer> <silent> <Up>   gk
    noremap  <buffer> <silent> <Down> gj
    noremap  <buffer> <silent> <Home> g<Home>
    noremap  <buffer> <silent> <End>  g<End>
    inoremap <buffer> <silent> <Up>   <C-o>gk
    inoremap <buffer> <silent> <Down> <C-o>gj
    inoremap <buffer> <silent> <Home> <C-o>g<Home>
    inoremap <buffer> <silent> <End>  <C-o>g<End>
    let g:ToggleDisplayMove_Mode = 1
endfunction

function ToggleDisplayMove()
    if g:ToggleDisplayMove_Mode
        call PhysicalLineMove()
        echo "Move cursor now base on PHYSICAL LINE"
    else
        call DisplayedLineMove()
        echo "Move cursor now base on DISPLAYED LINE"
    endif
endfunction

call DisplayedLineMove()