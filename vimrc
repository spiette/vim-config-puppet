set softtabstop=4
set shiftwidth=4
set expandtab
set showcmd
set ignorecase
set smartcase
set nohlsearch
set laststatus=2

set splitbelow
set splitright

set wildmenu
set wildmode=longest,list

filetype plugin indent on
set omnifunc=syntaxcomplete#Complete

" with gnupg plugin
map ,e :GPGEditRecipients<CR>

map ,p :r!pwgen -n -c 12<CR>
"
" remove trailing spaces
nnoremap <silent> ,s :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
map ,v :set invpaste paste?<CR>
set pastetoggle=,v

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

call pathogen#infect()

set background=dark
if &term == 'xterm-256color'
    colorscheme solarized
elseif &term == 'xterm'
    set t_Co=16
    colorscheme desert
else
    colorscheme desert
endif
