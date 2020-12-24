set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" universal set of defaults 
Plugin 'tpope/vim-sensible'
" Buffers in tabs
Plugin 'ap/vim-buftabline'
"Foldin
Plugin 'tmhedberg/SimpylFold'
" Auto Pairs
Plugin 'jiangmiao/auto-pairs'
" Identation for Python - PEP8 
Plugin 'vim-scripts/indentpython.vim' 
" Sintaxis for python
Plugin 'vim-syntastic/syntastic' 
"PEP 8 
Plugin 'nvie/vim-flake8' 
"Themes for VIM console
"Plugin 'morhetz/gruvbox' 
Plugin 'joshdick/onedark.vim'
"Theme for VIM GUI
Plugin 'altercation/vim-colors-solarized' 
"Documents Tree 
Plugin 'scrooloose/nerdtree' 
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Xuyuanp/nerdtree-git-plugin'
" Help tag bar
Plugin 'majutsushi/tagbar'
"GIT plugins
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive' 
"Status Bar 
"Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Search file tool
Plugin 'kien/ctrlp.vim' 
"Search file tool
Plugin 'rking/ag.vim' 
"Error Detection
"Plugin 'w0rp/ale'
Plugin 'dense-analysis/ale'
"Autocomplete
Plugin 'Valloric/YouCompleteMe'
"Tmux - Vim navigation
Plugin 'christoomey/vim-tmux-navigator'
"Ipython interactive console
Plugin 'jpalardy/vim-slime'

" ...
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"mapleader mapping
let mapleader = ','


set splitbelow
set splitright

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" move through buffers
nmap <leader>b :bp!<CR>
nmap <leader>n :bn!<CR>
nmap <leader>x :bd<CR>

" restore place in file from previous session
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" ale
map <C-e> <Plug>(ale_next_wrap)
map <C-r> <Plug>(ale_previous_wrap)

" tags
map <leader>t :TagbarToggle<CR>

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za
" Enable Docstrings for folded code
let g:SimpylFold_docstring_preview=1

"PEP 8 Indentation and encoding
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

" Full stack dev filetypes
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |

"Flagging Unnecessary Whitespace
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
highlight BadWhitespace ctermbg=red guibg=red

" auto-pairs
au FileType python let b:AutoPairs = AutoPairsDefine({"f'" : "'", "r'" : "'", "b'" : "'"})

"UTF-8 Support
set encoding=utf-8
set fileencoding=utf-8

"python with virtualenv support
let g:ycm_python_binary_path = 'python'

"Pretty
let python_highlight_all=1
filetype on
syntax on
set t_Co=256
set t_ut=
set nu
colorscheme onedark
set background=dark
"Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='deus'

" file browser NERDTree
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let NERDTreeMinimalUI = 1
let g:nerdtree_open = 0
map <leader>d :call NERDTreeToggle()<CR>
function NERDTreeToggle()
    NERDTreeTabsToggle
    if g:nerdtree_open == 1
        let g:nerdtree_open = 0
    else
        let g:nerdtree_open = 1
        wincmd p
    endif
endfunction

function! StartUp()
    if 0 == argc()
        NERDTree
    end
endfunction
autocmd VimEnter * call StartUp()

"Map F9 to execute python
noremap <F9> :w !python %<CR>
inoremap <F9> <ESC>:w !python %<CR>

" VIM-Slime to target tmux
let g:slime_target = "tmux"
let g:slime_python_ipython = 1
let g:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}

" Mouse config
set mouse=a
let g:is_mouse_enabled = 1
noremap <silent> <Leader>m :call ToggleMouse()<CR>
function ToggleMouse()
    if g:is_mouse_enabled == 1
        echo "Mouse OFF"
        set mouse=
        let g:is_mouse_enabled = 0
    else
        echo "Mouse ON"
        set mouse=a
        let g:is_mouse_enabled = 1
    endif
endfunction

" wrap toggle
setlocal nowrap
noremap <silent> <Leader>w :call ToggleWrap()<CR>
function ToggleWrap()
    if &wrap
        echo "Wrap OFF"
        setlocal nowrap
        set virtualedit=all
        silent! nunmap <buffer> <Up>
        silent! nunmap <buffer> <Down>
        silent! nunmap <buffer> <Home>
        silent! nunmap <buffer> <End>
        silent! iunmap <buffer> <Up>
        silent! iunmap <buffer> <Down>
        silent! iunmap <buffer> <Home>
        silent! iunmap <buffer> <End>
    else
        echo "Wrap ON"
        setlocal wrap linebreak nolist
        set virtualedit=
        setlocal display+=lastline
        noremap  <buffer> <silent> <Up>   gk
        noremap  <buffer> <silent> <Down> gj
        noremap  <buffer> <silent> <Home> g<Home>
        noremap  <buffer> <silent> <End>  g<End>
        inoremap <buffer> <silent> <Up>   <C-o>gk
        inoremap <buffer> <silent> <Down> <C-o>gj
        inoremap <buffer> <silent> <Home> <C-o>g<Home>
        inoremap <buffer> <silent> <End>  <C-o>g<End>
    endif
endfunction


" disable autoindent when pasting text
" source: https://coderwall.com/p/if9mda/automatically-set-paste-mode-in-vim-when-pasting-in-insert-mode
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

function! XTermPasteBegin()
    set pastetoggle=<Esc>[201~
    set paste
    return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
