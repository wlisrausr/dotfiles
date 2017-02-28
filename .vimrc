" Author  : Wanda Ichsanul Isra <wandaisra@gmail.com>
" Purpose : Make vim superior for me

" Use Vim settings rather than Vi settings
set nocompatible

" Enable custom identation for each file
filetype plugin indent on

" Using vim-plug plugin manager
call plug#begin('~/.vim/plugged')

" Status or tabline <https://github.com/vim-airline/vim-airline>
Plug 'vim-airline/vim-airline'

" Status or tabline themes <https://github.com/vim-airline/vim-airline-themes>
Plug 'vim-airline/vim-airline-themes'

" Make project's tree explorer <https://github.com/scrooloose/nerdtree>
Plug 'scrooloose/nerdtree'

" Make alignment super easier <https://github.com/junegunn/vim-easy-align>
Plug 'junegunn/vim-easy-align'

" Comment stuff out <https://github.com/tpope/vim-commentary>
Plug 'tpope/vim-commentary'

" Enable multiple selection and replace <https://github.com/terryma/vim-multiple-cursors>
Plug 'terryma/vim-multiple-cursors'

" Easy quoting/parenthesizing <https://github.com/tpope/vim-surround>
Plug 'tpope/vim-surround'

" Expanding abbreviations <https://github.com/mattn/emmet-vim>
Plug 'mattn/emmet-vim'

" Motion on speed <https://github.com/easymotion/vim-easymotion>
Plug 'easymotion/vim-easymotion'

" Show git diff in the gutter <https://github.com/airblade/vim-gitgutter>
Plug 'airblade/vim-gitgutter'

" Markdown vim mode <https://github.com/plasticboy/vim-markdown>
Plug 'plasticboy/vim-markdown'

" Distraction mode <https://github.com/junegunn/goyo.vim>
Plug 'junegunn/goyo.vim'

" Focus on paraghraph while writing <https://github.com/junegunn/limelight.vim>
Plug 'junegunn/limelight.vim'

" Auto-completion for special char <https://github.com/Raimondi/delimitMate>
Plug 'Raimondi/delimitMate'

" Blade syntax highlighting <https://github.com/jwalton512/vim-blade>
Plug 'jwalton512/vim-blade'

" Vim insert mode completion <https://github.com/ervandew/supertab>
Plug 'ervandew/supertab'

" Vim python mode <https://github.com/python-mode/python-mode>
Plug 'klen/python-mode'

" Command line fuzzy finder <https://github.com/junegunn/fzf>
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Git wrapper <https://github.com/tpope/vim-fugitive>
Plug 'tpope/vim-fugitive'

" Up-to-date PHP syntax <https://github.com/stanangeloff/php.vim>
Plug 'stanangeloff/php.vim'

call plug#end()

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

filetype on                " Enable file type detection
set number                 " Show line number
set title                  " Show window title
set ruler                  " Show cursor position all the time
set cursorline             " Highlight current cursor line
set cursorcolumn           " Highlight current cursor column
set wildmenu               " Show command line completion with <Tab>
set showcmd                " Display incomplete command
syntax on                  " Show syntax highlighting
set incsearch              " Do incremental searching
set nohlsearch             " Don't highlight search result
set wrap linebreak nolist  " Better word wrap
set smartindent            " Activate auto indenting
set smartcase              " Override ignorecase on uppercase search
set copyindent             " Use same indent
set history=10000          " Set search history numbers
set encoding=utf-8         " Set char encoding to UTF-8
set background=dark        " Set background colors to dark
colorscheme Tomorrow-Night " Set colorscheme

" Set window title for timing app
set titlestring=Vim\ %(\ %{expand(\"%:p:h\")}%)/%(\ %a%)

" Make vim color looks good
hi Normal ctermbg=NONE
hi NonText ctermbg=NONE

" Tab settings
set expandtab             " Expand tabs into spaces
set tabstop=4             " Default to 4 spaces for a hard tab
set softtabstop=4         " Default to 4 spaces for the soft tab

" For when <TAB> is pressed at the beginning of a line
set shiftwidth=4

" Activate filetype plugin
filetype plugin on

" Fold setings
set foldmethod=indent     " Fold based on indent
set foldnestmax=10        " Deepest fold is 10 levels
set nofoldenable          " Don't fold by default

" Change file update time from 4s to 0.25s for gitgutter
set updatetime=250

" Column guide at 80 char (PSR-2 rule) for PHP
autocmd BufNewFile,BufRead *.php set colorcolumn=80
autocmd BufNewFile,BufRead *.php set textwidth=80

" Ignore case on autocomplete command
set ignorecase

" Frontend stuff setup
au BufNewFile,BufRead *.js, *.html, *.css set tabstop=2
au BufNewFile,BufRead *.js, *.html, *.css set softtabstop=2
au BufNewFile,BufRead *.js, *.html, *.css set shiftwidth=2

" Set leader key to comma
let mapleader=","

" Set jk as <esc> in insert mode
inoremap jk <esc>

" Disable <esc> in insert mode
inoremap <esc> <nop>

" Make word uppercase in insert mode
imap <c-u> jkveU

" Edit vimrc shortcut
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Reload vimrc shortcut
nnoremap <leader>er :source $MYVIMRC<cr>

" Force sudo if not root with ':w!!'
cmap w!! w !sudo tee > /dev/null %<CR>

" Auto remove trailing whitespace when write
autocmd BufWritePre <buffer> :%s/\s\+$//e

" Add visual line to block of code by '%' key
noremap % v%

" Plugin config stuff start here
" GitGutter stuff
" Required after having changed the colorscheme
hi clear SignColumn

" Set hunks jump mapping for gitgutter
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk

" Nerdtree Stuff
" Open nerdtree when file not spesified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Only nerdtree open? Close vim!
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Tree explorer mapping
map <leader>n :NERDTreeToggle<CR>

" Airline stuff
set laststatus=2                                  " Always show airline status bar
let g:airline_powerline_fonts=1                   " Enable fancy arrow symbols
let g:airline_detect_paste=1                      " Show paste if in paste mode
let g:airline_theme='jellybeans'                  " Set airline theme
let g:airline#extensions#tabline#enabled=1        " Show airline for tabs too
let g:airline#extensions#tabline#left_sep=' '     " Set left separator
let g:airline#extensions#tabline#left_alt_sep='|' " Set alt separator
let g:airline#extensions#hunks#non_zero_only=1    " In vim-airline, only display 'hunks' if the diff is non-zero

" EasyAlign stuff
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Pymode stuff
let g:pymode_lint_unmodified = 1
let g:pymode_lint_message = 1

" Goyo Stuff
" Auto activate goyo with ligthlime
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Set goyo width
let g:goyo_width=130

" Python-mode stuff
" Set python 3 syntax checking
let g:pymode_python = 'python3'

" PHP vim stuff
" Put at the very end of your .vimrc file.
function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END
