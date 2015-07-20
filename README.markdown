# vim configuration for puppet editing

Those files are meant to get easier puppet files editing. It use the pathogen plugin to configure this list of plugins:
* https://github.com/scrooloose/syntastic.git
* https://github.com/godlygeek/tabular.git
* https://github.com/rodjek/vim-puppet

The plugins will:

* Automatically indent the code as you type it (mostly).
* Align the => 
* Set the proper tabulation configuration (ts=2, sw=2, sts=2, et, etc...)
* Pass your .pp files under puppet-lint and/or puppet parser validate

To use, clone the repository like this (assuming no ~/.vim directory or .vimrc file already exists):

    git clone git@github.com:spiette/vim-config-puppet
    git submodule update --init # will fetch other plugins on github
    cd ~
    ln -s .vim/vimrc .vimrc

To use syntastic with puppet, install puppet and puppet-lint

    gem install puppet
    gem install puppet-lint

Note: when using autoindent, pasting a block that begins with blank first lines will create a staircase effect.
Before pasting, use :set paste , then paste, then do :set nopaste afterward.
