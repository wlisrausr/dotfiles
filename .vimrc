" Author  : Wanda Ichsanul Isra <wandaisra@gmail.com>
" Purpose : Make vim superior for me

" Unlock the full potential of vim
set nocompatible

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

" Comment stuff out <https://github.com/scrooloose/nerdcommenter>
Plug 'scrooloose/nerdcommenter'

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

" Auto-completion for special char <https://github.com/Raimondi/delimitMate>
Plug 'Raimondi/delimitMate'

" Vim insert mode completion <https://github.com/ervandew/supertab>
Plug 'ervandew/supertab'

" A command line fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Git wrapper <https://github.com/tpope/vim-fugitive>
Plug 'tpope/vim-fugitive'

" Syntax checking hacks <https://github.com/vim-syntastic/syntastic>
Plug 'scrooloose/syntastic'

" Browse tags of current file <https://github.com/majutsushi/tagbar>
Plug 'majutsushi/tagbar'

call plug#end()

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

filetype on                " Enable file type detection
set number                 " Show line number
set title                  " Show window title
set wildmenu               " Show command line completion with <Tab>
set showcmd                " Display incomplete command
syntax on                  " Show syntax highlighting
set incsearch              " Do incremental searching
set nohlsearch             " Don't highlight search result
set nowrap                 " Don't wrap line
set smartindent            " Activate auto indenting
set smartcase              " Override ignorecase on uppercase search
set copyindent             " Use same indent
set history=10000          " Set search history numbers
set encoding=utf-8         " Set char encoding to UTF-8
set background=dark        " Set background colors to dark
set t_Co=256               " Enable 256 colors
set t_ut=                  " Better colorscheme in tmux
set relativenumber         " Set relative line number
set re=1                   " Force old regex engine on newer version
colorscheme jellybeans     " Set colorscheme

" Set window title for timing app
set titlestring=Vim\ %(\ %{expand(\"%:p:h\")}%)/%(\ %a%)

" Tab settings
set expandtab             " Expand tabs into spaces
set tabstop=4             " Default to 4 spaces for a hard tab
set softtabstop=4         " Default to 4 spaces for the soft tab

" For when <TAB> is pressed at the beginning of a line
set shiftwidth=4

" Activate filetype plugin
filetype plugin on

" Fold setings
set nofoldenable          " Don't fold by default

" Change file update time from 4s to 0.25s for gitgutter
set updatetime=250

" Column guide at 80 char (PSR-2 rule) for PHP
autocmd BufNewFile,BufRead *.php set colorcolumn=80
autocmd BufNewFile,BufRead *.php set textwidth=80

" HTML spesific settings
autocmd BufNewFile,BufRead *.html set tabstop=2
autocmd BufNewFile,BufRead *.html set softtabstop=2
autocmd BufNewFile,BufRead *.html set shiftwidth=2

" JS spesific settings
autocmd BufNewFile,BufRead *.js set tabstop=2
autocmd BufNewFile,BufRead *.js set softtabstop=2
autocmd BufNewFile,BufRead *.js set shiftwidth=2

" Ignore case on autocomplete command
set ignorecase

" Set leader key to comma
let mapleader=","

" Make word uppercase in insert mode
imap <c-u> <esc>veU

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
let g:airline#extensions#tabline#fnamemod = ':t'  " Remove full path in tabline

" EasyAlign stuff
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Pymode stuff
let g:pymode_lint_unmodified=1
let g:pymode_lint_message=1

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

" Tagbar stuff
nmap <Leader>t :TagbarToggle<CR>

" The nerd commenter stuff
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims=1

" Vim-javascript stuff
let g:javascript_plugin_jsdoc=1 " Syntax highlighting for JSDocs
let g:javascript_plugin_ngdoc=1 " Syntax highlighting for NGDocs
let g:javascript_plugin_flow=1  " Syntax highlighting for flow

" Javascript libraries support syntax stuff
let g:used_javascript_libs='vue,react,jquery'

" Hybrid colorscheme stuff
let g:hybrid_custom_term_colors=1
let g:hybrid_reduced_contrast=1 " Remove this line if using the default palette.

" DelimiteMate settings
let delimitMate_expand_cr = 1

augroup mydelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

" Syntastic stuff
let g:syntastic_html_checkers=['']

" Easymotion Stuff
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" Vimpager stuff
let g:vimpager = {}
let g:less     = {}

let g:less.enabled = 0 " Use regular vim motion
let g:less.number  = 1 " Turn on line numbers
let g:vimpager.X11 = 0 " Bit faster startup

" FZF stuff
nnoremap <Leader>f :Files<cr>
