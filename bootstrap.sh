#!/bin/bash

mkdir -p ~/.vim/autoload
curl -Sso ~/.vim/autoload/pathogen.vim \
    https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
cd ~/.vim
if [ ! -d .git ]; then
    git init
fi
if [ ! -f .gitignore ]; then
    cat <<- EOF > .gitignore
	.sw?
	.netrwhist
EOF
git add .gitignore
git commit -m 'gitignore' .gitignore
fi
set -e
cat << EOF | while read path url
powerline https://github.com/Lokaltog/vim-powerline.git
syntastic https://github.com/scrooloose/syntastic.git
gnupg https://github.com/jamessan/vim-gnupg.git
rsnapshot https://git.gitorious.org/spiette/vim-rsnapshot.git
tabular https://github.com/godlygeek/tabular.git
puppet https://github.com/rodjek/vim-puppet
EOF
do
    echo path: url
    git submodule add $url bundle/$path
    git commit -m $path
done

if [ ! -f ~/.vim/vimrc ] ; then
	cat > ~/.vim/vimrc <<- EOF
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
	syntax on

	filetype plugin indent on

	map ,e :GPGEditRecipients<CR>
	map ,p :r!pwgen -n -c 12<CR>
	"
	" remove trailing spaces
	nnoremap <silent> ,s :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
	map ,v :set invpaste paste?<CR>
	set pastetoggle=,v

	autocmd BufRead,BufNewFile *.md setf markdown
	autocmd BufRead,BufNewFile *.rb setlocal sw=2

	call pathogen#infect()
	EOF
fi
