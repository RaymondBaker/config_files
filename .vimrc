
" Vundle
" {{{
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Required
Plugin 'VundleVim/Vundle.vim'


"Javascript
Plugin 'othree/javascript-libraries-syntax.vim'

Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
"Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
"

Plugin 'ap/vim-buftabline'

Plugin 'vim-perl/vim-perl6'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" }}}


" Javascript libraries
autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 1
autocmd BufReadPre *.js let b:javascript_lib_use_underscore = 1
autocmd BufReadPre *.js let b:javascript_lib_use_backbone = 1
autocmd BufReadPre *.js let b:javascript_lib_use_prelude = 0
autocmd BufReadPre *.js let b:javascript_lib_use_angularjs = 0

" Ignore blank lines for fold
set foldignore=#<CR>za

" Save folds
augroup AutoSaveFolds
    autocmd!
    autocmd BufWinLeave * mkview
    autocmd BufWinEnter * silent loadview
augroup END

" General Setup
" {{{
set nocompatible
set number
set smartindent

"Vim can keep files open without necessarily displaying them on screen
set hidden

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Don't use this in putty
"set mouse=a

" Share clipboard with system
"set clipboard=unnamed
"
set backspace=indent,eol,start

"Use 256 colours (Use this setting only if your terminal supports it)
set t_Co=256

syntax on
" Found in .vim/colors
"colorscheme gruvbox


set foldmethod=indent
set foldlevelstart=99

" }}}


" Tilda Macros
" {{{
" surrond selection in parenthesis/brackets/etc.
vnoremap ~1 <esc>`>a)<esc>`<i(<esc>
vnoremap ~2 <esc>`>a]<esc>`<i[<esc>
vnoremap ~3 <esc>`>a}<esc>`<i{<esc>
vnoremap ~$ <esc>`>a"<esc>`<i"<esc>
vnoremap ~q <esc>`>a'<esc>`<i'<esc>
vnoremap ~Q <esc>`>a"<esc>`<i"<esc>

" insert parenthesis/brackets/etc.
inoremap ~1 ()<esc>i
inoremap ~2 []<esc>i
inoremap ~3 {}<esc>i
inoremap ~4 {<esc>o}<esc>O
inoremap ~q ''<esc>i
inoremap ~Q ""<esc>i
inoremap ~t <><esc>i
"}}}

" Movement
" {{{
nnoremap <silent> <F1> :bprev<CR>
nnoremap <silent> <F2> :bnext<CR>
inoremap <silent> <F1> <ESC>:bprev<CR>
inoremap <silent> <F2> <ESC>:bnext<CR>
" move to beginning and end of line
" }}}

" Misc Macros
" {{{
"


"nnoremap gt m1:

" Align current paragraph
noremap <leader>a =ip
" clone paragraph
noremap yp yap<S-}>p

" Don't overidde clipboard when pasting
"xnoremap p "_dP
xnoremap <silent> p p:let @"=@0<CR>

" // search for highlighed word
vnoremap // y/<C-R>"<CR>

" remove trailing whitespace
nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

" paste with correct indentation
nnoremap p p=`]
" }}}

"map shift tab to untab in insert mode
"inoremap <S-Tab> <C-d>

" Status Line
" {{{
set laststatus=2


set statusline=
set statusline+=%7*\[%n]                                  "buffernr
set statusline+=%1*\ %<%F\                                "File+path
set statusline+=%2*\ %y\                                  "FileType
set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
set statusline+=%4*\ %{&ff}\                              "FileFormat (dos/unix..)
set statusline+=%5*\ %{&spelllang}\%{HighlightSearch()}\  "Spellanguage & Highlight on?
set statusline+=%8*\ %=\ Line:%l/%L\ (%03p%%)\             "Rownumber/total (%)
set statusline+=%9*\ Col:%03c\                            "Colnr
set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.


function! HighlightSearch()
    if &hls
        return 'H'
    else
        return ''
    endif
endfunction

hi User1 ctermfg=Grey ctermbg=DarkBlue guifg=#ffdad8  guibg=#880c0e
hi User2 ctermfg=Grey ctermbg=DarkBlue guifg=#000000  guibg=#F4905C
hi User3 ctermfg=Grey ctermbg=DarkBlue guifg=#292b00  guibg=#f4f597
hi User4 ctermfg=Grey ctermbg=DarkBlue guifg=#112605  guibg=#aefe7B
hi User5 ctermfg=Grey ctermbg=DarkBlue guifg=#051d00  guibg=#7dcc7d
hi User7 ctermfg=Grey ctermbg=DarkBlue guifg=#ffffff  guibg=#880c0e gui=bold
hi User8 ctermfg=Grey ctermbg=DarkBlue guifg=#ffffff  guibg=#5b7fbb
hi User9 ctermfg=Grey ctermbg=DarkBlue guifg=#ffffff  guibg=#810085
hi User0 ctermfg=Grey ctermbg=DarkBlue guifg=#ffffff  guibg=#094afe

" }}}

" Putty Status Line
" {{{
" Always show statusline
"set laststatus=2
" Setting up status line
"set statusline=
"set statusline+=%2*\ %l
"set statusline+=\ %*
"set statusline+=%1*\ ‹‹
"set statusline+=%1*\ %f\ %*
"set statusline+=%1*\ ››
"set statusline+=%1*\ %m
"set statusline+=%3*\ %F
"set statusline+=%=
"set statusline+=%3*\ ‹‹
"set statusline+=%3*\ ::
"set statusline+=%3*\ %n
"set statusline+=%3*\ ››\ %*
"hi User1 ctermbg=Cyan ctermfg=White guibg=green guifg=red
"hi User2 ctermbg=Cyan ctermfg=Black  guibg=red   guifg=blue
"hi User3 ctermbg=blue  ctermfg=green guibg=blue  guifg=green
" }}}



" FZF Bindings
" {{{
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
" }}}

" Quick fix fo issue with putty
" {{{
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
"
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
" }}}


" Notes
" {{{
" gv gets last selection
"
" ctrl o goes back to previous location
"
" ctrl d tabs back in insert mode
"
" }}}
