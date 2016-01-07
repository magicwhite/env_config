set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" plugins
Plugin 'ctrlp.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'tomasr/molokai'
Plugin 'a.vim'
Plugin 'vim-scripts/Mark'
Plugin 'jiangmiao/auto-pairs'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-scripts/gtags.vim'
Plugin 'tpope/vim-fugitive'

call vundle#end()            " required
filetype plugin indent on    " required

" settings
syntax enable
syntax on

let mapleader='\'
let g:molokai_original = 1
let g:rehash256 = 1
set t_Co=256
colorscheme molokai


set termencoding=utf-8
set encoding=utf8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030,big5
"set cul

set laststatus=2
"set number
set noshowmode

set tabstop=4
set shiftwidth=4
set softtabstop=4

set expandtab
set smarttab
set autoindent
set smartindent
set ruler
set ignorecase
set hls
"set foldmethod=syntax
set showcmd

" backup
set nobackup
set nowb
set noswapfile

" search
set hlsearch
set incsearch

" Plugin setting
" airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

"tagbar
let g:tagbar_left = 1
let g:tagbar_sort = 1
nnoremap <silent> <F5> :TagbarToggle<CR>

"nerdtree
map <F3> :NERDTreeToggle<CR>

"Ag
let g:ag_highlight=1
nmap <C-\>a :Ag <C-R>=expand("<cword>")<CR><CR>

"ycm
let g:ycm_global_ycm_extra_conf = '/home/rob/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_echo_current_diagnostic = 0

"Gtags
"using gtags-cscope instead cscope
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


"au BufAdd *.[ch] call FindGtags(expand('<afile>'))

"function! FindGtags(f)
"     let dir = fnamemodify(a:f, ':p:h')
"     while 1
"         let tmp = dir . '/GTAGS'
"         if filereadable(tmp)
"             exe 'cs add ' . tmp . ' ' . dir
"             break
"         elseif dir == '/'
"             break
"         endif
"
"         let dir = fnamemodify(dir, ":h")
"     endwhile
"endfunc

autocmd BufReadPost *
            \ if line("'\"")>0&&line("'\"")<=line("$") |
            \   exe "normal g'\"" |
            \ endif
