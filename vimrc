command! -nargs=1 Silent
\ | execute ':silent !'.<q-args>
\ | execute ':redraw!'

function! RunFile()
        let l:ext=expand('%:e')
        if l:ext == "rkt"
                Silent racket %
        elseif l:ext == "py"
                Silent python %
        elseif l:ext == "js"
                Silent node %
        elseif l:ext == "rb"
                Silent ruby %
        endif
endfunction

function! LoadREPL()
        let l:ext=expand('%:e')
        if l:ext == "rb"
                Silent irb -I . -r %
        elseif l:ext == "py"
                Silent python -i %
        elseif l:ext == "hs"
                Silent ghci %
        endif
endfunction

filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

"plugins go here in 
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/syntastic'
Plugin 'ervandew/supertab'
Plugin 'alercation/vim-colors-solarized'
Plugin 'wlangstroth/vim-racket'
Plugin 'Rainbow-Parenthesis'
Plugin 'samsaga2/vim-z80'
"Plugin 'tpope/vim-fugitive' "nice git stuff

"plugins before this line
call vundle#end()
filetype plugin indent on
"end stuff for vundle

"set laststatus=2 "makes status line always visible
"stuff for syntasic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasicStatuslineFlag()}
"set statusline+=%*
"set statusline+=%{fugitive#statusline()} "shows git branch

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_chec_on_wq = 0
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-std=c++17'
let g:syntastic_java_javac_config_file_enabled = 1
let g:syntastic_enable_racket_racket_checker = 0
"end stuff for systastic

let g:html_use_css=0
syntax enable
set background=dark
if has('gui_running')
        colorscheme solarized
endif
set mouse=a
set tabstop=8 shiftwidth=8 expandtab

set number relativenumber

augroup numbertoggle
        autocmd!
        autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
        autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
 
map <C-s> :w<CR>
map! <C-S> <ESC>:w<CR>:echo 'saved'<CR>

"retrieved from http://vim.wikia.com/wiki/Using_tab_pages
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>

nnoremap <C-o> :Tex<CR>

nnoremap <f5> :call RunFile()<CR>
nnoremap <F6> :call LoadREPL()<CR>

