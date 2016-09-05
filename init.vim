call plug#begin('~/.dot/nvim/plugged')

" Plugin tables
Plug 'scrooloose/nerdcommenter'
Plug 'terryma/vim-multiple-cursors'
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'
Plug 'bling/vim-bufferline'
Plug 'rking/ag.vim'
Plug 'tpope/vim-fugitive'
Plug 'tommcdo/vim-fugitive-blame-ext'
Plug 'altercation/vim-colors-solarized'
Plug 'bling/vim-airline'
"Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'ivalkeen/nerdtree-execute'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/gtags.vim'
Plug 'vim-scripts/a.vim'
Plug 'jrosiek/vim-mark'
Plug 'kien/rainbow_parentheses.vim'
Plug 'tomasr/molokai'
"Plug 'bfredl/nvim-ipy', { 'for': 'python' }
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer', 'for': ['c', 'cpp', 'python', 'css', 'html'] }
Plug 'rdnetto/YCM-Generator', { 'branch':'stable' }
"Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
"some new plugins
Plug 'Shougo/unite.vim'
Plug 'Shougo/neoyank.vim'
Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'Shougo/neomru.vim'
Plug 'Shougo/unite-outline'
"Plug 'artur-shaik/vim-javacomplete2'
" Add plugins to &runtimepath
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

" Compatibility for Terminal
"let g:solarized_termtrans=1
"let g:solarized_termcolors=256
"let g:solarized_contrast="normal"
"let g:solarized_visibility="normal"

set background=dark	
set t_Co=256
"colorscheme solarized
colorscheme molokai
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
"set number                      " Line numbers on
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

"Airline
let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#fnamemod = ':t'

"YCM
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
"let g:ycm_global_ycm_extra_conf = '~/.config/nvim/ycm_extra_conf.py'
let g:ycm_global_ycm_extra_conf = 0
let g:ycm_extra_conf_globlist = ['~/.config/nvim/ycm_extra_conf.py']

nnoremap <leader>jr :YcmDiags<CR>
nnoremap <leader>jh :YcmCompleter GoToInclude<cr>
nnoremap <leader>jd :YcmCompleter GoTo<cr>
nnoremap <leader>jl :YcmCompleter GoToDeclaration<cr>
nnoremap <leader>jf :YcmCompleter GoToDefinition<cr>
nnoremap <leader>jx :YcmCompleter FixIt<cr>
nnoremap <leader>jp :YcmCompleter GetParent<cr>
nnoremap <leader>jt :YcmCompleter GetType<cr>
nnoremap <leader>jo :YcmCompleter GetDoc<cr>

let g:ycm_filetype_blacklist = {
          \ 'tagbar' : 1,
          \ 'qf' : 1,
          \ 'notes' : 1,
          \ 'markdown' : 1,
          \ 'unite' : 1,
          \ 'text' : 1,
          \ 'vimwiki' : 1,
          \ 'pandoc' : 1,
          \ 'infolog' : 1,
          \ 'mail' : 1,
          \ 'gitcommit' : 1
          \}


" vim-gitgutter
let g:gitgutter_map_keys = 0
let g:gitgutter_sign_column_always = 1
let g:tagbar_left = 1
let g:tagbar_sort = 1
nnoremap <silent> <F5> :TagbarToggle<CR>

" CtrlP {
	" Setup some default ignores
	"let g:ctrlp_custom_ignore = {
	"			\ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
	"			\ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg|doc|docx|pdf)$',
	"			\}

	" Use the nearest .git directory as the cwd
	" This makes a lot of sense if you are working on a project that is in version
	" control. It also supports works with .svn, .hg, .bzr.
	"let g:ctrlp_working_path_mode = 'r'

	" Use a leader instead of the actual named binding
	"nmap <leader>p :CtrlP<cr>

	" Easy bindings for its various modes
	"nmap <leader>bb :CtrlPBuffer<cr>
	"nmap <leader>bm :CtrlPMixed<cr>
	"nmap <leader>bs :CtrlPMRU<cr>
" }

" Speed Up CtrlP {
"
	"let g:ctrlp_cache_dir = $HOME . '/.config/nvim/cache_dir/ctrlp_cache'
	"if executable('ag')
	"let file_type_to_be_ignored = 'exe|so|dll|class|png|jpg|jpeg|doc|docx|pdf|icon|gif'
	"let g:ctrlp_user_command = 'ag %s -i -l --nocolor --depth 5 -g "" '
	"		\ . '-G "^(.(?!(\.(' . file_type_to_be_ignored . ')$)))*$"'
	"endif
	"let g:ctrlp_clear_cache_on_exit = 1
" }

"Ag
let g:ag_highlight=1
nmap <C-\>a :Ag <C-R>=expand("<cword>")<CR><CR>

"Fugitive
set diffopt+=vertical

"vim-multiple-cursors
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" NERDtree 
map <F3> :NERDTreeToggle<cr>
let NERDTreeWinSize = 33
let NERDTreeShowBookmarks = 1
let NERDTreeIgnore = ['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode = 0
let NERDTreeMouseMode = 2
let NERDTreeShowHidden = 1
let NERDTreeBookmarksFile = expand('$HOME') . '/.config/nvim/NERDTreeBookmarks'


"Gtags, using gtags-cscope instead of cscope
set cscopetag
set cscopeprg='gtags-cscope'
let GtagsCscope_Auto_Load = 1
let CtagsCscope_Auto_Map = 1
let GtagsCscope_Quiet = 1

  " add any database in current directory
if filereadable("GTAGS")
  cs add GTAGS
endif

"gtags-csope
"c: Find functions calling this function
"d: Find functions called by this function
"e: Find this egrep pattern
"f: Find this file
"g: Find this definition
"i: Find files #including this file
"s: Find this C symbol
"t: Find this text string
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>


let g:unite_source_history_yank_enable = 1
nnoremap <space>/ :Unite grep:.<cr>
nnoremap <space>y :Unite history/yank<cr>
nnoremap <space>s :Unite -quick-match buffer<cr>
nnoremap <space>b :Unite buffer<cr>
nnoremap <space>a :UniteBookmarkAdd <cr>
nnoremap <space>c :Unite bookmark<CR>
nnoremap <space>m :Unite file_mru<CR>
nnoremap <space>f :UniteWithBufferDir -buffer-name=files file<CR>

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
    nmap <buffer> <ESC> <Plug>(unite_exit)
    nnoremap <slient> <buffer> <expr> <C-x> unite#do_action('split')
    inoremap <slient> <buffer> <expr> <C-x> unite#do_action('split')
    nnoremap <slient> <buffer> <expr> <C-v> unite#do_action('vsplit')
    inoremap <slient> <buffer> <expr> <C-v> unite#do_action('vsplit')
    nnoremap <slient> <buffer> <expr> <C-o> unite#do_action('open')
    inoremap <slient> <buffer> <expr> <C-o> unite#do_action('open')
endfunction


au BufAdd *.[ch] call FindGtags(expand('<afile>'))

function! FindGtags(f)
     let dir = fnamemodify(a:f, ':p:h')
     while 1
         let tmp = dir . '/GTAGS'
         if filereadable(tmp)
             exe 'cs add ' . tmp . ' ' . dir
             break
         elseif dir == '/'
             break
         endif

         let dir = fnamemodify(dir, ":h")
     endwhile
endfunc

autocmd BufReadPost *
            \ if line("'\"")>0&&line("'\"")<=line("$") |
            \   exe "normal g'\"" |
            \ endif

