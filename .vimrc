" Source in $HOME/.vimrc via
" :so <path-to-dotfiles>/.vimrc
" Enable filetype detection, plugin loading, and indent formatting.
filetype plugin indent on
" Enable syntax highlighting.
syntax on
" Set right-side boarder line.
set cc=80
" Enable backspace.
set backspace=indent,eol,start
" Disable swap files.
set noswapfile
" Enable row and column display of cursor.
set ruler
" Set tab to four spaces.
set tabstop=4
" Indent corresponds to single tab.
set shiftwidth=4
" Set specific white space characters.
set listchars=trail:·,tab:>-
" Show white spaces.
set list

" Install vim-plug plugin manager.
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Initialize NERDTree plugin.
call plug#begin()
  Plug 'preservim/nerdtree'
call plug#end()

" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Set NERDTree toggle.
nnoremap <C-t> :NERDTreeToggle<CR>

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
