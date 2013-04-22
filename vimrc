set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set wildmenu
set showcmd
set ignorecase
set smartcase
set nohlsearch
set laststatus=2
set splitbelow
set splitright

set listchars=tab:>·,trail:·
set list

syntax on

filetype plugin indent on

" with gnupg plugin
map ,e :GPGEditRecipients<CR>

map ,p :r!pwgen -n -c 12<CR>
"
" remove trailing spaces
nnoremap <silent> ,s :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
map ,v :set invpaste paste?<CR>
set pastetoggle=,v

call pathogen#infect()
