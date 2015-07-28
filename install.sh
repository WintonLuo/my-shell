#!/bin/bash
set -x

cd
rm -rf .vim
mkdir .vim
cd -
cp -r vim/* ~/.vim
cp vimrc ~/.vimrc
