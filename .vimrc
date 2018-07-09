set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
"replaced by fzf
"Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
"Plugin 'mindriot101/vim-yapf'
"Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"set autoindent

"map shift tab to untab in insert mode
"inoremap <S-Tab> <C-d>

" nnoremap <leader>y :Yapf<cr>
nnoremap <silent> <leader><space> :Files<CR>
nnoremap <silent> <leader>a :Buffers<CR>
nnoremap <silent> <leader>A :Windows<CR>
nnoremap <silent> <leader>; :BLines<CR>
nnoremap <silent> <leader>o :BTags<CR>
nnoremap <silent> <leader>O :Tags<CR>
nnoremap <silent> <leader>? :History<CR>
nnoremap <silent> <leader>/ :execute 'Ag ' . input('Ag/')<CR>
nnoremap <silent> <leader>. :AgIn
nnoremap <silent> K :call SearchWordWithAg()<CR>

vnoremap <silent> K :call SearchVisualSelectionWithAg()<CR>
nnoremap <silent> <leader>gl :Commits<CR>
nnoremap <silent> <leader>ga :BCommits<CR>
nnoremap <silent> <leader>ft :Filetypes<CR>

imap <C-x><C-f> <plug>(fzf-complete-file-ag)
imap <C-x><C-l> <plug>(fzf-complete-line)

function! SearchWordWithAg()
execute 'Ag' expand('<cword>')
endfunction

function! SearchVisualSelectionWithAg() range
    let old_reg = getreg('"')
    let old_regtype = getregtype('"')
    let old_clipboard = &clipboard
    set clipboard&
    normal! ""gvy
    let selection = getreg('"')
    call setreg('"', old_reg, old_regtype)
    let &clipboard = old_clipboard
    execute 'Ag' selection
endfunction

function! SearchWithAgInDirectory(...)
    call fzf#vim#ag(join(a:000[1:], ' '), extend({'dir': a:1}, g:fzf#vim#default_layout))
endfunction

command! -nargs=+ -complete=dir AgIn call SearchWithAgInDirectory(<f-args>)

set tabstop=4
set shiftwidth=4
set expandtab

set number

silent! nmap <C-n> :NERDTreeToggle<CR>
silent! map <F3> :NERDTreeFind<CR>
silent! nmap <C-p> :CtrlP

let g:NERDTreeMapActivateNode="<F3>"
let g:NERDTreeMapPreview="<F4>"

" surrond selection in parenthesis/brackets/etc.
vnoremap ~1 <esc>`>a)<esc>`<i(<esc>
vnoremap ~2 <esc>`>a]<esc>`<i[<esc>
vnoremap ~3 <esc>`>a}<esc>`<i{<esc>
vnoremap ~$ <esc>`>a"<esc>`<i"<esc>
vnoremap ~q <esc>`>a'<esc>`<i'<esc>
vnoremap ~e <esc>`>a"<esc>`<i"<esc>

" insert parenthesis/brackets/etc.
inoremap ~1 ()<esc>i
inoremap ~2 []<esc>i
inoremap ~3 {}<esc>i
inoremap ~4 {<esc>o}<esc>O
inoremap ~q ''<esc>i
inoremap ~e ""<esc>i
inoremap ~t <><esc>i

" move to beginning and end
nnoremap B ^
nnoremap E $

" Always show statusline
set laststatus=2
" Setting up status line
set statusline=
set statusline+=%2*\ %l
set statusline+=\ %*
set statusline+=%1*\ ‹‹
set statusline+=%1*\ %f\ %*
set statusline+=%1*\ ››
set statusline+=%1*\ %m
set statusline+=%3*\ %F
set statusline+=%=
"set statusline+=%3*\ %{LinterStatus()}
set statusline+=%3*\ ‹‹
"set statusline+=%3*\ %{strftime('%R',getftime(expand('%')))}
set statusline+=%3*\ ::
set statusline+=%3*\ %n
set statusline+=%3*\ ››\ %*
hi User1 ctermbg=Cyan ctermfg=White guibg=green guifg=red
hi User2 ctermbg=Cyan ctermfg=Black  guibg=red   guifg=blue
hi User3 ctermbg=blue  ctermfg=green guibg=blue  guifg=green

"disable change to insert mod with numpad
"noremap <Esc>Oq 1
"noremap <Esc>Or 2
"noremap <Esc>Os 3
"noremap <Esc>Ot 4
"noremap <Esc>Ou 5
"noremap <Esc>Ov 6
"noremap <Esc>Ow 7
"noremap <Esc>Ox 8
"noremap <Esc>Oy 9
"noremap <Esc>Op 0
"noremap <Esc>On .
"noremap <Esc>OR *
"noremap <Esc>OQ /
"noremap <Esc>Ol +
"noremap <Esc>OS -
"noremap <Esc>OM <Enter>

" // search for selected word
vnoremap // y/<C-R>"<CR>

"Enable numpad
"imap <Esc>Oq 1
"imap <Esc>Or 2
"imap <Esc>Os 3
"imap <Esc>Ot 4
"imap <Esc>Ou 5
"imap <Esc>Ov 6
"imap <Esc>Ow 7
"imap <Esc>Ox 8
"imap <Esc>Oy 9
"imap <Esc>Op 0
"imap <Esc>On .
"imap <Esc>OR *
"imap <Esc>OQ /
"imap <Esc>Ol +
"imap <Esc>OS -
"imap <Esc>OM <Enter>

"remove trailing whitespace
nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
"paste with correct indentation
nnoremap p p=`]
"
" " Use 256 colours (Use this setting only if your terminal supports 256
" colours)
set t_Co=256
