" -----------------------------------------------------> [prepare vundle]
set nocompatible              " be iMproved, required
set t_Co=256
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" -----------------------------------------------------> [plugins]
Plugin 'gmarik/Vundle.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-endwise'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/unite.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'terryma/vim-multiple-cursors'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" -----------------------------------------------------> [multiple cursor]
let g:multi_cursor_use_default_mapping=1

" -----------------------------------------------------> [setup crosshair]
set cursorline
set cursorcolumn
hi CursorLine ctermbg=8 ctermfg=15 cterm=NONE "8 = dark gray, 15 = white
hi CursorColumn ctermbg=8 ctermfg=15 "8 = dark gray, 15 = white
hi Cursor ctermbg=15 ctermfg=8

" -----------------------------------------------------> [Unite.vim]
call unite#filters#matcher_default#use(['matcher_fuzzy'])

call unite#custom#profile('files', 'context.ignorecase', 1)
call unite#custom#profile('files', 'context.smartcase', 0)
call unite#filters#sorter_default#use(['sorter_rank'])

" -- Using ag as recursive command.
let g:unite_source_rec_async_command = 'ag --follow --nocolor --nogroup --hidden -g ""'

" -----------------------------------------------------> [nerdtree]
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" -----------------------------------------------------> [(re)mappings]
" -- Leader needs space
let mapleader = "\<Space>"

" Make unite a fuzzy CTRL-p alternative
nnoremap <leader>f :Unite buffer file_rec/async:! -start-insert<CR>

" -- j/k working on wrapped lines
noremap j gj
noremap k gk
noremap gj j
noremap gk k

" -- Cursor is in the center after search
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" -- Don't move on *
" nnoremap * *<c-o>

" -- Clear search with <leader><space>
nnoremap <leader><space> :noh<cr>

" -- Toggle tree <leader> + t
nnoremap <leader>t :NERDTreeToggle<CR>

" -- Save all with the leader + w
nnoremap <Leader>w :wall<CR>

" -- Quit vim
nnoremap <Leader>q :q<CR>

" -- Copy visual selection to os clipboard
vmap <Leader>y "+y

" -- Toggle paste mode
set pastetoggle=<F10>

" -- Esc
imap jk <Esc>

" -- aka 'Oh, that's the key I have been hitting by accident'
nnoremap Q <nop>

" -----------------------------------------------------> [misc]
" -- No beep anymore
set visualbell

" -- Minimum number of lines above and below the cursor
set scrolloff=5

" -- Do not jump to the start of line while switching the buffers
set nostartofline

" -- Prevent encoding vietnam
set encoding=utf-8

" -- Show line numbers
set number

" -- Wraps and indicates if a line was wrapped
set wrap
set showbreak=↪

" -- General indentation settings
set ts=2 sts=2 sw=2 expandtab

set backspace=2 " make backspace work like most other apps"
syntax on

" -- Let the buffer change without saving the current buffer
set hidden

" -- no swap
set noswapfile
