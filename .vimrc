"        _
"       (_)
" __   ___ _ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|
"
" Elton's .vimrc file
"


" ----------------------------------------------------------------------------
" VUNDLE PLUGINS
" ----------------------------------------------------------------------------

" needed to run vundle
set nocompatible
filetype plugin indent off
syntax off
" set the runtime path for vundle
set rtp+=~/.vim/bundle/Vundle.vim
" start vundle environment
call vundle#begin()

" PLUGINS LIST
" Let Vundle manage Vundle (required)
Plugin 'VundleVim/Vundle.vim'
" Essentials:
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'w0rp/ale'
Plugin 'scrooloose/nerdtree'
Plugin 'Shougo/vimproc.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'jiangmiao/auto-pairs'
Plugin 'Yggdroot/indentLine'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'ervandew/supertab'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
" Java:
Plugin 'javacomplete'
" C++:
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'Valloric/YouCompleteMe'
" Go:
Plugin 'fatih/vim-go'
" Pug:
Plugin 'digitaltoad/vim-pug'
" PHP:
Plugin 'StanAngeloff/php.vim'
" Python:
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'python-mode/python-mode'
" Ruby:
Plugin 'vim-ruby/vim-ruby'
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-rails'
" Front End:
Plugin 'mattn/emmet-vim'
Plugin 'wavded/vim-stylus'
Plugin 'othree/html5.vim'
Plugin 'cakebaker/scss-syntax.vim'
" JavaScript:
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'marijnh/tern_for_vim'
Plugin 'isRuslan/vim-es6'
Plugin 'Quramy/tsuquyomi'
Plugin 'leafgarland/typescript-vim'
Plugin 'posva/vim-vue'

call vundle#end()
" After vundle finished it's safe to turn filetype plugins on
filetype plugin indent on
syntax on


" ----------------------------------------------------------------------------
" OPTIONS
" ----------------------------------------------------------------------------

set autoindent                  " Carry over indenting from previous line
set autoread                    " Update file automatically
set backspace=indent,eol,start  " Default backspace configs
set breakindent                 " Breakline Indent
set colorcolumn=80              " Highlight column 80
set encoding=utf8               " Use UTF-8 by default
set expandtab                   " On pressing tab, insert 4 spaces
set hlsearch                    " Highlight searching
set incsearch                   " To search while typing
set laststatus=2                " Always display status bar
set nu                          " Show line numbers
set omnifunc=syntaxcomplete#Complete  " Enable Omnifunc
set pastetoggle=<F10>           " Set paste mode on F10 button
set ruler                       " Enable ruler to show row/col and percentage
set shiftwidth=4                " When indenting with '>', use 4 spaces width
set t_Co=256                    " Set terminal colors to 256
set tabstop=4                   " Show existing tab with 4 spaces width
set wildmenu                    " Show possible completions
set wildignore=*.class,*.o,*~,*.pyc,.git,node_modules   " Ignore some files


" ----------------------------------------------------------------------------
" KEY MAPS
" ----------------------------------------------------------------------------

" Use ; as : in normal mode
nnoremap ; :

" Move across windows more easily
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Search for selected text
vnoremap // y/<C-R>"<CR>

" Save on ctrl + s
noremap <silent> <C-s> :w<CR>
inoremap <silent> <C-s> <C-O>:w<CR>

" Exit on ctrl + q
noremap <silent> <C-q> <C-O>:q!<CR>

" Undo on ctrl + z
inoremap <silent> <C-z> <C-O>u

" Redo on ctrl + y
inoremap <silent> <C-y> <C-O><C-r>

" Swap lines with <c-s-up>/<c-s-bottom> (like in Sublime Text)
function! s:swap_lines(n1, n2)
    let line1 = getline(a:n1)
    let line2 = getline(a:n2)
    call setline(a:n1, line2)
    call setline(a:n2, line1)
endfunction
function! s:swap_up()
    let n = line('.')
    if n == 1
        return
    endif
    call s:swap_lines(n, n - 1)
    exec n - 1
endfunction
function! s:swap_down()
    let n = line('.')
    if n == line('$')
        return
    endif
    call s:swap_lines(n, n + 1)
    exec n + 1
endfunction
noremap <silent> <C-s-up> :call <SID>swap_up()<CR>
noremap <silent> <C-s-down> :call <SID>swap_down()<CR>
inoremap <silent> <C-s-up> <C-O>:call <SID>swap_up()<CR>
inoremap <silent> <C-s-down> <C-O>:call <SID>swap_down()<CR>

" I always hit ":W" instead of ":w" because I linger on the shift key...
command! Q q
command! W w


" ----------------------------------------------------------------------------
" FILE TYPE TRIGGERS
" ----------------------------------------------------------------------------

if has("autocmd")
    au BufNewFile,BufRead *.pug set syntax=pug
    au BufRead,BufNewFile *.vue setlocal ts=2 sw=2 filetype=vue.html.javascript.css

    au Filetype javascript setlocal ts=2 sw=2 sts=0
    au Filetype typescript setlocal ts=2 sw=2 sts=0
    au Filetype json setlocal ts=2 sw=2 sts=0
    au Filetype scss setlocal ts=2 sw=2 sts=0
    au Filetype sass setlocal ts=2 sw=2 sts=0
    au Filetype css setlocal ts=2 sw=2 sts=0
    au Filetype html setlocal ts=2 sw=2 sts=0
    au Filetype eruby setlocal ts=2 sw=2 sts=0
    au Filetype jinja2 setlocal ts=2 sw=2 sts=0
    au Filetype ruby setlocal ts=2 sw=2 sts=0
    au Filetype java setlocal omnifunc=javacomplete#Complete
    au Filetype pug setlocal ts=2 sw=2 sts=0
    au FileType vue syntax sync fromstart
endif


" ----------------------------------------------------------------------------
" PLUGIN SETTINGS
" ----------------------------------------------------------------------------

"
" python-mode
"
let g:pymode_rope = 0
" Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1
" Support virtualenv
let g:pymode_virtualenv = 1
" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
" Don't autofold code
let g:pymode_folding = 0


"
" vim-better-whitespace
"
let g:strip_whitespace_on_save=1

"
" vim-vue
"
let g:vue_disable_pre_processors=1

"
" NERDTree
"
let NERDTreeIgnore = ['\.class$', '\.o$', '\~$', '\.pyc$', '\.swp$']

"
" Airline
"
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod=':t'
let g:airline#extensions#ale#enabled = 1
let g:airline_theme='luna'

"
" ALE
"
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let b:ale_cpp_clang_options = ' -std=c++11 -stdlib=libc++ -Wall'

"
" GO settings
"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

"
" YCM
"
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
let g:ycm_extra_conf_globlist=['~/.vim/*']
let g:ycm_always_populate_location_list = 0
let g:ycm_auto_trigger=1
let g:ycm_enable_diagnostic_highlighting=1
let g:ycm_enable_diagnostic_signs=1
let g:ycm_max_diagnostics_to_display=10000
let g:ycm_min_num_identifier_candidate_chars=0
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_open_loclist_on_ycm_diags=1
let g:ycm_show_diagnostics_ui=1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_filetype_blacklist={
    \ 'vim' : 1,
    \ 'tagbar' : 1,
    \ 'qf' : 1,
    \ 'notes' : 1,
    \ 'markdown' : 1,
    \ 'md' : 1,
    \ 'unite' : 1,
    \ 'text' : 1,
    \ 'vimwiki' : 1,
    \ 'pandoc' : 1,
    \ 'infolog' : 1,
    \ 'mail' : 1
    \}

"
" Vim cpp enhanced syntax
"
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1
let c_no_curly_error=1

"
" PHP Syntax Override
"
function! PhpSyntaxOverride()
    hi! def link phpDocTags  phpDefine
    hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
    autocmd!
    autocmd FileType php call PhpSyntaxOverride()
augroup END
