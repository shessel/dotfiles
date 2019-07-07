set nocompatible              " be iMproved, required
filetype off                  " required
map <space> <leader>

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
"" The following are examples of different formats supported.
"" Keep Plugin commands between vundle#begin/end.
"" plugin on GitHub repo
"" Plugin 'tpope/vim-fugitive'
"" plugin from http://vim-scripts.org/vim/scripts.html
"" Plugin 'L9'
"" Git plugin not hosted on GitHub
"" Plugin 'git://git.wincent.com/command-t.git'
"" git repos on your local machine (i.e. when working on your own plugin)
"" Plugin 'file:///home/gmarik/path/to/plugin'
"" The sparkup vim script is in a subdirectory of this repo called vim.
"" Pass the path to set the runtimepath properly.
"" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"" Avoid a name conflict with L9
"" Plugin 'user/L9', {'name': 'newL9'}

Plugin 'altercation/vim-colors-solarized'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'octol/vim-cpp-enhanced-highlight'
" LLVM based c++ auto complete
Plugin 'Valloric/YouCompleteMe'
" libclang based highlighting
Plugin 'jeaye/color_coded'

Plugin 'rust-lang/rust.vim'

Plugin 'scrooloose/nerdtree'

Plugin 'vimwiki/vimwiki'

Plugin 'airblade/vim-gitgutter'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"" To ignore plugin indent changes, instead use:
""filetype plugin on
""
"" Brief help
"" :PluginList       - lists configured plugins
"" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
"" :PluginSearch foo - searches for foo; append `!` to refresh local cache
"" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
""
"" see :h vundle for more details or wiki for FAQ
"" Put your non-Plugin stuff after this line
"let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_rust_src_path="/home/Downloads/dev/rust-master/src/"
let g:ycm_python_binary_path = 'python3'
let g:ycm_autoclose_preview_window_after_completion = 1

let g:airline#extensions#tabline#enabled = 1
set laststatus=2

set background=dark
set t_Co=256
syntax enable           " enable syntax processing

let g:color_schemes=["fu", "solarized", "monokai"]
let g:airline_schemes=["dark", "solarized", "dark"]
let g:color_scheme_index=0
function! CycleColorScheme()
    let g:color_scheme_index=(g:color_scheme_index + 1) % 3
    exec ':colorscheme '.g:color_schemes[g:color_scheme_index]
    exec ':AirlineTheme '.g:airline_schemes[g:color_scheme_index]
    hi CursorLine cterm=NONE
endfunction
" let g:solarized_termcolors=256
exec ':colorscheme '.g:color_schemes[g:color_scheme_index]
hi CursorLine cterm=NONE " set highlighted line to not underlined

set tabstop=4           " spaces per tab
set softtabstop=4       " number of spaces in softtab
set shiftwidth=4        " number of spaces for shift and autoindent
set expandtab           " expand tabs to spaces

set hidden              " allow switching buffers without having to save first

" vimwiki configuration
let wiki_0 = {}
let wiki_0.path = '~/vimwiki/'
let wiki_0.syntax = 'markdown'
let wiki_0.ext = '.md'

let g:vimwiki_list = [wiki_0]

set number              " show line numbers
set cursorline          " highlight current line
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when needed
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight search matches
set ignorecase          " case insensetive search
set smartcase           " use case sensitive search if an upper case character is typed

set splitright          " splace splits on the right
set relativenumber

set scrolloff=5         " start scrolling 5 lines from margins

set list listchars=tab:»-,trail:·,nbsp:· " Display extra whitespace

if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " autocmd BufWinEnter * let &foldlevel = max(map(range(1, line('$')), 'foldlevel(v:val)')) - 1
  autocmd BufWinEnter * normal zR

  autocmd filetype cpp nnoremap <F4> :w <bar> exec '!clang++ --std=c++17 '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
  "autocmd filetype s nnoremap <F4> :w <bar> exec '!clang++ --std=c++17 '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
  "swaymsg 'workspace 3; exec qemu-system-x86_64 ~/code/simple-os-from-scratch/ch03-boot-sector/addressing.bin'

  autocmd filetype * setlocal ts=4 sw=4 sts=4 expandtab
  autocmd filetype make setlocal ts=4 sw=4 sts=4 noexpandtab
  autocmd filetype asm setlocal syn=nasm
  autocmd filetype cpp setlocal ts=4 sw=4 sts=4 expandtab
  autocmd filetype vimwiki setlocal ts=2 sw=2 sts=2 expandtab
  autocmd filetype python nnoremap <F4> :w <bar> exec '!python '.shellescape('%')<CR>
  autocmd filetype python nnoremap <F5> :w <bar> exec '!python off.py'<CR><CR>
  autocmd filetype python setlocal ts=4 sw=4 sts=4 expandtab
  autocmd filetype ruby setlocal ts=2 sw=2 sts=2 expandtab
  autocmd filetype javascript setlocal ts=2 sw=2 sts=2 expandtab
  autocmd filetype html setlocal ts=2 sw=2 sts=2
  autocmd filetype rust setlocal ts=4 sw=4 sts=4
endif

nnoremap j gj
nnoremap k gk
nnoremap <C-h> :bp<cr>
nnoremap <C-l> :bn<cr>
nnoremap <leader>c :call CycleColorScheme()<cr>
nnoremap <leader><space> :nohlsearch<cr>
nnoremap <leader>t :NERDTreeToggle<cr>
