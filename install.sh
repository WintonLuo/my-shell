#!/bin/bash
#set -x

BASEDIR=$(dirname $0)
cd $BASEDIR
CURRENT_DIR=`pwd`

function log_info() {
    echo -e "\033[32m[INFO]\033[0m $1"
}

function soft_link() {
    if [ -e "$1" ]; then
        ln -sf "$1" "$2"
    fi
}


log_info "backing up current vim config..."
today=`date +%Y%m%d`
for i in $HOME/.vim $HOME/.vimrc $HOME/.gvimrc $HOME/.vimrc.bundles; do [ -e $i ] && [ ! -L $i ] && mv $i $i.$today; done
for i in $HOME/.vim $HOME/.vimrc $HOME/.gvimrc $HOME/.vimrc.bundles; do [ -L $i ] && unlink $i ; done

log_info "setting up symlinks..."
soft_link $CURRENT_DIR/vimrc $HOME/.vimrc
soft_link $CURRENT_DIR/vimrc.bundles $HOME/.vimrc.bundles
soft_link $CURRENT_DIR/vim $HOME/.vim

log_info "installing Vundle..."
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim

log_info "installing plugins using Vundle..."
vim +PluginInstall! +qall

log_info "install compelete successfully!"
