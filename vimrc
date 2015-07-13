" tabs {{{
set softtabstop=4
set shiftwidth=4
set expandtab
" }}}
" search {{{
set ignorecase
set smartcase
set nohlsearch
" }}}
" status {{{
set laststatus=2
set showcmd
filetype plugin indent on
" }}}
" mappings {{{
set omnifunc=syntaxcomplete#Complete

" with gnupg plugin
map <Leader>e :GPGEditRecipients<CR>

map <Leader>p :r!pwgen -n -c 12<CR>
map <Leader>pq :r!pwqgen<CR>
"
" remove trailing spaces
nnoremap <silent> ,s :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
map ,v :set invpaste paste?<CR>
set pastetoggle=,v
" }}}
" listchars {{{
nnoremap <silent> <Leader>s :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
map <Leader>v :set invpaste paste?<CR>
set pastetoggle=<Leader>v

let g:fulllistchars = 0
set listchars=tab:▸\ ,trail:·
set list

nnoremap <Leader>l :call ListcharsToggle()<CR>
function! ListcharsToggle()
    if g:fulllistchars
        let g:fulllistchars = 0
        setlocal listchars=tab:▸\ ,trail:·
    else
        let g:fulllistchars = 1
        setlocal listchars=tab:▸·,trail:·,eol:¶,extends:>,precedes:<
    endif
endfunction
" }}}
" colors {{{
" set background=dark

call pathogen#infect()

if &term == 'xterm-256color'
    "colorscheme solarized
    "colorscheme zenburn
    "colorscheme earendel
    "colorscheme proton
    colorscheme desert256
elseif &term == 'xterm'
    set t_Co=16
    colorscheme desert
else
    colorscheme desert
endif
syntax on
" }}}
" folding {{{
setlocal modeline
" vim:foldmethod=marker:foldlevel=0
" }}}
