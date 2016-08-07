" needed to run vundle
set nocompatible

" vundle needs filtype plugins off
" i turn it on later
filetype plugin indent off
syntax off

" set the runtime path for vundle
set rtp+=~/.vim/bundle/Vundle.vim

" start vundle environment
call vundle#begin()

" list of plugins
" let Vundle manage Vundle (this is required)
Plugin 'VundleVim/Vundle.vim'

" to install a plugin add it here and run :PluginInstall.
" to update the plugins run :PluginInstall! or :PluginUpdate
" to delete a plugin remove it here and run :PluginClean
"

" YOUR LIST OF PLUGINS GOES HERE LIKE THIS:
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Valloric/YouCompleteMe'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'tpope/vim-fugitive'
Plugin 'jiangmiao/auto-pairs'
Plugin 'javacomplete'
Plugin 'Yggdroot/indentLine'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'mattn/emmet-vim'
Plugin 'ervandew/supertab'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'othree/html5.vim'

" add plugins before this
call vundle#end()

" now (after vundle finished) it is save to turn filetype plugins on
filetype plugin indent on
syntax on

" To update file automatically
set autoread

" To search while I'm typing
set incsearch

" Breakline indent
set breakindent

" Strip whitespaces on save
let g:strip_whitespace_on_save=1

" JS, SCSS, SASS, CSS and HTML indent with 2 spaces
autocmd Filetype javascript setlocal ts=2 sw=2 sts=0
autocmd Filetype scss setlocal ts=2 sw=2 sts=0
autocmd Filetype sass setlocal ts=2 sw=2 sts=0
autocmd Filetype css setlocal ts=2 sw=2 sts=0
autocmd Filetype html setlocal ts=2 sw=2 sts=0

" Start NERDTree automatically
" autocmd VimEnter * NERDTree

" Set terminal colors to 256 (To Airline Theme works as well)
set t_Co=256

" Airline Configs
set laststatus=2                " Always display statusline
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod=':t'
let g:airline_theme='luna'

" Syntastic configs
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs=1

" Omnifunc
set omnifunc=syntaxcomplete#Complete
if has("autocmd")
    autocmd Filetype java setlocal omnifunc=javacomplete#Complete
endif

" Emmet config
let g:user_emmet_leader_key='<Tab>'

" YCM
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
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

" Vim cpp enhanced syntax bla bla bla
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1
let c_no_curly_error=1

" Essentials
set showcmd
set ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)

" Show line numbers
set nu

" Personal Configs
" Search for selected text
vnoremap // y/<C-R>"<CR>
set hlsearch

" show existing tab with 4 spaces width
set tabstop=4

" when indenting with '>', use 4 spaces width
set shiftwidth=4

" on pressing tab, insert 4 spaces
set expandtab

" Set paste mode on F10 button
set pastetoggle=<F10>

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

" Save on ctrl + s
noremap <silent> <C-s> :w<CR>
inoremap <silent> <C-s> <C-O>:w<CR>

" Exit on ctrl + q
noremap <silent> <C-q> <C-O>:q!<CR>

" Undo on ctrl + z
inoremap <silent> <C-z> <C-O>u

" Redo on ctrl + y
inoremap <silent> <C-y> <C-O><C-r>
