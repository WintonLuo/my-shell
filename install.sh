#!/bin/bash
#set -x

# 更新submodule
echo 'updating submodule...'
git submodule init
git submodule update

# 删除.vim文件夹
echo 'deleting .vim directory...'
cd
rm -rf .vim
mkdir .vim
cd -

# 拷贝.vim文件
echo 'copying file...'
cp -r vim/* ~/.vim
cp vimrc ~/.vimrc
