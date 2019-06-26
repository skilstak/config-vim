" designed for vim 8+. for more info and faq see:
"    https://gitlab.com/skilstak/config/vim

let skip_defaults_vim=1

" standard stuff

set number
set relativenumber
set nocompatible
set ruler
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smartindent
set smarttab
set autoindent
set formatoptions=qrn1
set cursorline
set nobackup
set noswapfile
set nowritebackup
set laststatus=0
set icon
set nohlsearch
set noincsearch
set noshowmatch
set linebreak

" fixes 'Press ENTER or type command to continue'
set shortmess=a
set cmdheight=2

syntax enable
filetype plugin on

" memory management

set hidden
set history=100

" plugins

call plug#begin('~/.vim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
call plug#end()

" solarized

set background=dark
let g:solarized_visibility="high"
let g:solarized_contrast="high"
let g:solarized_termcolors=16
let g:solarized_termtrans=1
colorscheme solarized

" markdown.pandoc

let g:pandoc#modules#disabled = ["folding"]
"let g:pandoc#syntax#conceal#use = 0
let g:pandoc#syntax#conceal#urls = 1
let g:pandoc#syntax#conceal#blacklist = ["atx","codeblock_start","codeblock_delim"]
au syntax * hi link pandocAtxStart Type 
au syntax * hi link pandocAtxHeader Type
au syntax * hi Default cterm=none term=none
au syntax * hi pandocEmphasis cterm=none term=none ctermfg=Magenta 
au syntax * hi pandocStrong cterm=bold term=bold ctermfg=Magenta 
au syntax * hi pandocStrongEmphasis cterm=none term=none ctermfg=Red
au syntax * hi link pandocDelimitedCodeBlock pandocNoFormatted
au syntax * hi SpellBad ctermfg=White ctermbg=Red cterm=none

" syntax helpers

au bufnewfile,bufRead *.crontab set ft=crontab
au bufnewfile,bufRead *ssh/config set filetype=sshconfig
au bufnewfile,bufRead *gitconfig set filetype=gitconfig
au bufnewfile,bufread /tmp/psql.edit.* set syntax=sql

" displays all the syntax rules for current position

function! <SID>SynStack()
	if !exists("*synstack")
		return
	endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc  

" start at last place you were editing

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" pane switching

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" functions keys

map <F1> :set number!<CR>
nmap <F2> :call <SID>SynStack()<CR>
set pastetoggle=<F3>
map <F4> :set list!<CR>
map <F5> :set cursorline!<CR>
map <F7> :set spell!<CR>

" ween yourself off arrow keys
" (comment for scoll support later)

noremap <up> :echoerr "Umm, use k instead"<CR>
noremap <down> :echoerr "Umm, use j instead"<CR>
noremap <left> :echoerr "Umm, use h instead"<CR>
noremap <right> :echoerr "Umm, use l instead"<CR>
inoremap <up> <NOP>
inoremap <down> <NOP>
inoremap <left> <NOP>
inoremap <right> <NOP>

" go stuff
" (I don't care for fatih/vim-go)

autocmd vimleavepre *.go !gofmt -w %

