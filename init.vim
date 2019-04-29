""""""""""""""""""""""""
" author: robert
""""""""""""""""""""""""
if has('nvim')
    set termguicolors
endif

call plug#begin('~/.dot/nvim/plugged')
" Plugin tables
" Searcher
Plug 'mhinz/vim-grepper'
"Plug 'rking/ag.vim'
if has('nvim')
    Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'Shougo/deoplete-clangx'
"colortheme
Plug 'joshdick/onedark.vim'
Plug 'iCyMind/NeoSolarized'
Plug 'tomasr/molokai'
Plug 'dracula/vim', {'as': 'dracula'}
"tag & mark
Plug 'majutsushi/tagbar'
Plug 'jrosiek/vim-mark'
Plug 'terryma/vim-multiple-cursors'
" navigator
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tommcdo/vim-fugitive-blame-ext'
Plug 'bling/vim-airline'
" pairs
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'kien/rainbow_parentheses.vim'
"File operator
Plug 'vim-scripts/a.vim'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
call plug#end()

" Identify platform
silent function! OSX()
    return has('macunix')
endfunction
silent function! LINUX()
    return has('unix') && !has('macunix') && !has('win32unix')
    endfunction
silent function! WINDOWS()
    return  (has('win32') || has('win64'))
endfunction


filetype plugin indent on	" Automatically detect file types.
syntax on			" Syntax highlighting
syntax enable
"set mousehide			" Hide the mouse cursor while typing

colorscheme dracula
" Share content with the system's clipborad
set clipboard+=unnamedplus

"set shortmess+=filmnrxoOtT	" Avoiding the 'Hit ENTER to continue' prompts
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set virtualedit=onemore             " Allow for cursor beyond last character
set hidden                          " Allow buffer switching without saving

" The 'iskeyword' option specifies which characters can appear in a word
set iskeyword-=.                    " '.' is an end of word designator
set iskeyword-=#                    " '#' is an end of word designator
set iskeyword-=-                    " '-' is an end of word designator

" Instead of reverting the cursor to the last position in the buffer,
" we set it to the first line when editing a git commit message
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

" Git spell check
autocmd Filetype gitcommit setlocal spell textwidth=72

set backup                  " Backups are nice ...
if has('persistent_undo')
    set undodir=~/.config/nvim/cache_dir/undo_cache
    set undofile                " So is persistent undo ...
    set undolevels=1000         " Maximum number of changes that can be undone
    set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
endif

set backupdir=./.backup,~/.vim/backup,/tmp
set directory=.,./.backup,/tmp

set fileencoding=utf-8
scriptencoding utf-8

set showmode                    " Display the current mode
set colorcolumn=80
set cursorline
"set cursorcolumn
highlight clear SignColumn      " SignColumn should match background
highlight clear LineNr          " Current line number row will have same background color in relative mode

set ruler                   	" Show the ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
set showcmd                 	" Show partial commands in status line and

if has('statusline')
    " Broken down into easily includeable segments
    set statusline=%<%f\                     " Filename
    set statusline+=%w%h%m%r                 " Options
    if !exists('g:override_spf13_bundles')
        set statusline+=%{fugitive#statusline()} " Git Hotness
    endif
    set statusline+=\ [%{&ff}/%Y]            " Filetype
    set statusline+=\ [%{getcwd()}]          " Current dir
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif

set linespace=0                 " No extra spaces between rows, only available for GUI vim
set number                      " Line numbers on
set showmatch                   " Show matching brackets/parenthesis
set winminheight=0              " Windows can be 0 line high
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor
"set foldenable                  " Auto fold code
set list
set listchars=tab:›\ ,trail:•,extends:+,nbsp:. " Highlight problematic whitespace

"set nowrap                      " Do not wrap long lines
set expandtab
set smarttab
set tabstop=4
set shiftwidth=4                " Use indents of 4 spaces
set tabstop=4                   " An indentation every eight columns
set autoindent
set smartindent
set softtabstop=4               " Let backspace delete indent
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current
set ignorecase
set hlsearch
set incsearch

let mapleader=';'

" Allow using the repeat operator with a visual selection (!)
" http://stackoverflow.com/a/8064607/127816
vnoremap . :normal .<CR>

"vim-grepper
" https://github.com/mhinz/vim-grepper/wiki
" using :Grepper or :GrepperAg
nnoremap <Leader>g :Grepper<CR>

" readme for fzf: nvim $(fzf)
" :FZF   find file under current directory
nnoremap <Leader>f :FZF<CR>
" then <enter>:open file in current window; 
" Ctrl+T open file in new tab
" Ctrl+X open file in new horizontal window
" Ctrl+V open file in new vertical window

"deoplete
let g:deoplete#enable_at_startup = 1

" Airline
let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#fnamemod = ':t'


" vim-gitgutter
let g:gitgutter_map_keys = 0
set signcolumn=yes
let g:tagbar_left = 1
let g:tagbar_sort = 1
nnoremap <silent> <F5> :TagbarToggle<CR>

"Ag
"let g:ag_highlight=1
"nmap <C-\>a :Ag <C-R>=expand("<cword>")<CR><CR>

"Fugitive
set diffopt+=vertical

"vim-multiple-cursors
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

autocmd BufReadPost *
            \ if line("'\"")>0&&line("'\"")<=line("$") |
            \   exe "normal g'\"" |
            \ endif

