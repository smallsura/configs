let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1


call plug#begin('~/.local/share/nvim/plugged')
Plug 'morhetz/gruvbox'
Plug 'junegunn/goyo.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'valloric/youcompleteme'
Plug 'majutsushi/tagbar'
Plug 'neomake/neomake'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'raimondi/delimitmate'
Plug 'jceb/vim-orgmode'
Plug 'tpope/vim-speeddating'
Plug 'klen/python-mode', {'branch': 'develop'}
Plug 'henrik/vim-indexed-search'
Plug 'kien/ctrlp.vim'
Plug '907th/vim-auto-save'
Plug 'lervag/vimtex'
nnoremap <silent> <leader>- :Goyo<cr>
call plug#end()

" Clear highlighting, and close extra windows on escape in normal mode
nnoremap <esc> :noh<return>:on<return><esc>
nnoremap <esc>^[ <esc>^[

" zen mode
map <F2> :Goyo <CR>
" things to trigger when goyo starts
function! s:goyo_enter()
  " remap esc to just clear highlights
  nnoremap <esc> :noh<return><esc>
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
  " back to closing windows as well for esc
  nnoremap <esc> :noh<return>:on<return><esc>
  " Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
endfunction

autocmd! User GoyoEnter call <SID>goyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()


" tag bar
nmap <F9> :TagbarOpen fjc<CR>

" switch between buffers
nmap ` :bnext<CR> 

"make clipboard work
set clipboard=unnamed

" Tab etc formatting
:set textwidth=0
:set wrapmargin=0

" Format specific settings

" tex
au BufNewFile,BufRead *.tex
    \ nmap <F9> <localleader>lT<CR> 

" Orgmode
au BufNewFile,BufRead *.org
    \ set textwidth=0 |
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

 "python 
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set formatoptions+=t |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
    \ set colorcolumn=80

" js/html/css
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

" F3 to turn on syntax highlighting
:map <F3> :setlocal spell! spelllang=en_au <bar> hi clear SpellBad <bar> hi SpellBad cterm=underline ctermfg=red <CR>

" linebreak at words
set linebreak

" Theme
colorscheme gruvbox
set background=dark

set updatetime=250

:hi Search ctermfg=166
map <F8> :NERDTreeToggle<CR>

" fix my bad typing for :wq
:command WQ wq
:command Wq wq
:command W w
:command Q q

" python support
let g:python_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'

" youcompleteme
" latex autocompletion
if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme

let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string

" moving throgh windows
"set wmw=0
map <C-J> <C-W>j
map <C-K> <C-W>k
nmap <c-h> <c-w>h
nmap <c-l> <c-w>l


" When reading a buffer (after 1s), and when writing.
call neomake#configure#automake('w', 1000)
let g:neomake_python_enabled_makers = ['flake8']

" comment code shortcut
nnoremap '' :call NERDComment(0,"toggle")<CR>
vnoremap '' :call NERDComment(0,"toggle")<CR>

" python-mode settings
" Load the whole plugin
"let g:pymode = 1
" Load run code plugin
"let g:pymode_run = 1
" Key for run python code
"let g:pymode_run_key = '<leader>r'
" Load pylint code plugin
let g:pymode_lint = 0
"let g:pymode_lint_checker = ['pep8', 'mccabe']

" Check code every save
"let g:pymode_lint_on_write = 1

" Load rope plugin
let g:pymode_rope = 1
" Enable python folding
let g:pymode_folding = 0
" Enable python objects and motion
let g:pymode_motion = 1
" Auto fix vim python paths if virtualenv enabled
let g:pymode_virtualenv = 1
" Set default pymode python options
let g:pymode_options = 1

" Completion
let g:pymode_rope_completion = 1
let g:pymode_rope_complete_on_dot = 1

let g:pep8_map='-leader>8'
let g:pymode_python = 'python3'
" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_print_as_function = 1
let g:pymode_syntax_highlight_equal_operator = g:pymode_syntax_all

" polyglot settings
" we want pymode to handle the highlighting so disable python for polyglot
let g:polyglot_disabled = ['python']
" and vimtex for Latex
let g:polyglot_disabled = ['latex']

au FileType python setlocal formatprg=autopep8\ -

"make < > shifts keep selection
vnoremap < <gv
vnoremap > >gv

" vim airline settings
" make airline show buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_silent = 1  " do not display the auto-save notification
let airline_theme='hybridline'

" mouse settings 
set mouse=a

" compile latex using make
nmap <F12> :!make view<CR>

