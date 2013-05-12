call pathogen#infect()
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
" with gnupg plugin
map ,e :GPGEditRecipients<CR>

map ,p :r!pwgen -n -c 12<CR>
"
" remove trailing spaces
nnoremap <silent> ,s :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
map ,v :set invpaste paste?<CR>
set pastetoggle=,v
" }}}
" listchars {{{
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
set background=dark
if &term == 'xterm-256color'
    colorscheme solarized
elseif &term == 'xterm'
    set t_Co=16
    colorscheme desert
else
    colorscheme desert
endif
" }}}
" folding {{{
" vim:foldmethod=marker:foldlevel=0
" }}}
