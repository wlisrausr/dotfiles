" Author  : Wanda Ichsanul Isra <wandaisra@gmail.com>
" Desc    : My vim configuration
"
" Feel free to share, use, or modify it

" Use Vim settings rather than Vi settings
" Should be first for the best effect
set nocompatible

" Enable custom identation for each file type check .vim/ftplugin
filetype plugin indent on

call plug#begin('~/.vim/plugged') " Plugins (using Plug) {

" Vim airline stuff {
" Status or tabline <https://github.com/vim-airline/vim-airline>
Plug 'vim-airline/vim-airline'

" Status or tabline themes <https://github.com/vim-airline/vim-airline-themes>
Plug 'vim-airline/vim-airline-themes'
" }

" Nerdtree stuff {
" Make project's tree explorer <https://github.com/scrooloose/nerdtree>
Plug 'scrooloose/nerdtree'

" Tree & tabs together <https://github.com/jistr/vim-nerdtree-tabs>
Plug 'jistr/vim-nerdtree-tabs'
" }

" Editor stuff {
" Make alignment super easier <https://github.com/junegunn/vim-easy-align>
Plug 'junegunn/vim-easy-align'

" Comment stuff out <https://github.com/tpope/vim-commentary>
Plug 'tpope/vim-commentary'

" Enable multiple selection and replace
" <https://github.com/terryma/vim-multiple-cursors>
Plug 'terryma/vim-multiple-cursors'

" Easy quoting/parenthesizing <https://github.com/tpope/vim-surround>
Plug 'tpope/vim-surround'

" Expanding abbreviations <https://github.com/mattn/emmet-vim>
Plug 'mattn/emmet-vim'

" Expanding abbreviations <https://github.com/rstacruz/sparkup>
Plug 'rstacruz/sparkup'

" Motion on speed <https://github.com/easymotion/vim-easymotion>
Plug 'easymotion/vim-easymotion'

" Easy buffer management <https://github.com/qpkorr/vim-bufkill>
Plug 'qpkorr/vim-bufkill'

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

" Auto-completion <https://github.com/scrooloose/nerdcommenter>
Plug 'scrooloose/nerdcommenter'

" Blade syntax highlighting <https://github.com/jwalton512/vim-blade>
Plug 'jwalton512/vim-blade'

" Fuzzy finder <https://github.com/ctrlpvim/ctrlp.vim>
Plug 'ctrlpvim/ctrlp.vim'

" Vim insert mode completion <https://github.com/ervandew/supertab>
Plug 'ervandew/supertab'

" Snippet solution <https://github.com/SirVer/ultisnips>
Plug 'SirVer/ultisnips'

" Up-to-date PHP syntax <https://github.com/StanAngeloff/php.vim>
" Plug 'StanAngeloff/php.vim'

" Indentation line level <https://github.com/Yggdroot/indentLine>
" Plug 'Yggdroot/indentLine'

" Vim python mode <https://github.com/python-mode/python-mode>
Plug 'klen/python-mode'
" }

call plug#end() " }

" General settings {
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
" set clipboard=unnamed      " use the system clipboard
" set showmatch
" set vb
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

" Make vim color looks good {
hi Normal ctermbg=NONE
hi NonText ctermbg=NONE
" }

" Tab settings {
set expandtab             " Expand tabs into spaces
set tabstop=4             " Default to 4 spaces for a hard tab
set softtabstop=4         " Default to 4 spaces for the soft tab

" For when <TAB> is pressed at the beginning of a line
set shiftwidth=4

filetype indent plugin on " Activate filetype plugin
" }

" Fold setings {
set foldmethod=indent     " Fold based on indent
set foldnestmax=10        " Deepest fold is 10 levels
set nofoldenable          " Don't fold by default
" }

" Change file update time from 4s to 0.25s for gitgutter
set updatetime=250

" Column guide at 80 char (PSR-2 rule)
autocmd BufNewFile,BufRead *.php set colorcolumn=80
autocmd BufNewFile,BufRead *.php set textwidth=80

" Ignore case on autocomplete command
set ignorecase

" Frontend stuff setup
au BufNewFile,BufRead *.js, *.html, *.css set tabstop=2
au BufNewFile,BufRead *.js, *.html, *.css set softtabstop=2
au BufNewFile,BufRead *.js, *.html, *.css set shiftwidth=2

let mapleader="," " Set leader key to comma

" Disable arrow buttons {
" Disable up
nmap <Up> <nop>

" Disable down
nmap <Down> <nop>

" Disable left
nmap <Left> <nop>

" Disable right
nmap <Right> <nop>
" }

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
" }

" Auto remove trailing whitespace when write
autocmd BufWritePre <buffer> :%s/\s\+$//e

" Add visual line to block of code by '%' key
noremap % v%

" Plugins spesific settings {
" Nerdtree stuff {
" Open nerdtree when file not spesified {
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" }

" Only nerdtree open? Close vim!
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Tree explorer mapping
map <leader>n :NERDTreeToggle<CR>
" }

" Airline stuff {
set laststatus=2 " Always show airline status bar

let g:airline_powerline_fonts=1  " Enable fancy arrow symbols
let g:airline_detect_paste=1     " Show paste if in paste mode
let g:airline_theme='jellybeans' " Set airline theme

let g:airline#extensions#tabline#enabled=1        " Show airline for tabs too
let g:airline#extensions#tabline#left_sep=' '     " Set left separator
let g:airline#extensions#tabline#left_alt_sep='|' " Set alt separator

" In vim-airline, only display 'hunks' if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only=1
" }

" IndentLine stuff {
" JSON VIM - Fix indentLine problem
" let g:indentLine_noConcealCursor="nc"

" Indent
" let g:indentLine_enabled = 0
" nmap <F3> :IndentLinesToggle<CR>
" }

" Easy align stuff {
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }

" Gitgutter stuff {
" Required after having changed the colorscheme
hi clear SignColumn
" }

" Ctrlp stuff {
let g:ctrlp_map = '<leader>f'
" }

" Pymode stuff {
let g:pymode_lint_unmodified = 1
let g:pymode_lint_message = 1
" }

" PHP.vim stuff {
" Put at the very end of your .vimrc file.
" function! PhpSyntaxOverride()
"   hi! def link phpDocTags  phpDefine
"   hi! def link phpDocParam phpType
" endfunction

" augroup phpSyntaxOverride
"   autocmd!
"   autocmd FileType php call PhpSyntaxOverride()
" augroup END
" }
" }
