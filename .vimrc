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

"Foldin
Plugin 'tmhedberg/SimpylFold' 

" Identation for Python - PEP8 
Plugin 'vim-scripts/indentpython.vim' 

" Sintaxis for python
Plugin 'vim-syntastic/syntastic' 

"PEP 8 
Plugin 'nvie/vim-flake8' 

"Theme for VIM console
Plugin 'morhetz/gruvbox' 

"Theme for VIM GUI
Plugin 'altercation/vim-colors-solarized' 

"Documents Tree
Plugin 'scrooloose/nerdtree' 

"Tabs for NerdTree
Plugin 'jistr/vim-nerdtree-tabs'

"GIT plugin
Plugin 'tpope/vim-fugitive' 

"Status 
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

"Search file tool
Plugin 'kien/ctrlp.vim' 

"Search file tool
Plugin 'rking/ag.vim' 

"Error Detection
"Plugin 'w0rp/ale'

"Jedi Autocompletion
Plugin 'davidhalter/jedi-vim'

"Tmux - Vim navigation
Plugin 'christoomey/vim-tmux-navigator'

"Ipython interactive console
Plugin 'jpalardy/vim-slime'

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set splitbelow
set splitright

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" Enable Docstrings for folded code
let g:SimpylFold_docstring_preview=1

"PEP 8 Indentation
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

"UTF-8 Support
set encoding=utf-8

"python with virtualenv support
let g:ycm_python_binary_path = 'python'

"Pretty
let python_highlight_all=1
syntax on

"Theme
colorscheme gruvbox
set background=dark

"let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
"NERDTreeToggle Map
map <C-n> : NERDTreeToggle<CR>

"Line numbering 
set nu

"Map F9 to execute python
noremap <F9> :w !python %<CR>
inoremap <F9> <ESC>:w !python %<CR>

"Jedi auto init and tabs
let g:jedi#auto_initialization = 1
let g:jedi#use_tabs_not_buffers = 1

" VIM-Slime to target tmux
let g:slime_target = "tmux"
let g:slime_python_ipython = 1
let g:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}

" Autoload NerTree on startup
autocmd VimEnter * NERDTreeToggle 
