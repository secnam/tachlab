" 
"
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"filetype plugin on

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za

syntax on
set encoding=utf-8
set tabstop=4
set softtabstop=4
set shiftwidth=4
"set textwidth=79
set expandtab
set autoindent
set fileformat=unix
"set smartindent
"set cindent
"
autocmd FileType python set textwidth=79
autocmd FileType sh nnoremap <F5> :!%:p<CR>
autocmd FileType php nnoremap <F5> :!clear & php %:p<CR>
autocmd FileType python nnoremap <F5> :!clear & python3 %:p<CR>
autocmd FileType python nnoremap <F5> :!clear & python3 %:p<CR>
autocmd FileType python nnoremap <F6> :!clear & pudb %:p<CR>
autocmd FileType python map <buffer> <F4> :call Flake8()<CR>
autocmd FileType python imap <F3> <Esc>:YcmCompleter GetDoc<CR>i

set nu
set cursorline

highlight LineNr ctermbg=white ctermfg=black
highlight CursorLineNr ctermbg=darkred ctermfg=black
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

set laststatus=2
hi statusline ctermbg=black ctermfg=grey

let python_highlight_all = 1

if has('gui_running')
    set background=dark
    colorscheme solarized
else
    colorscheme zenburn
endif
