#!/bin/bash
#set -x

function error() {
    echo -e "\033[31m[ERROR]\033[0m Deploy failed: $1"
}

function deployClean() {
    # 删除.vim文件夹
    echo -e "\033[32m[INFO]\033[0m Deleting old vim files..."
    rm -rf ~/.vim
}

function deployInstall() {
    # 拷贝.vim文件
    mkdir -p ~/.vim
    echo -e "\033[32m[INFO]\033[0m Copying new vim files..."
    cp -r vim/* ~/.vim
    cp vimrc ~/.vimrc

    # 安装插件
    VIMRC_FILE="vimrc"
    hostname="git://github.com/"
    echo -e "\033[32m[INFO]\033[0m Install vim plugin..."
    mkdir -p ~/.vim/bundle

    cat ${VIMRC_FILE} | while read line
    do
        plugin_line=$(echo $line | awk -F " " '{print $1}')
        if [ "$plugin_line"x = "Plugin"x ]; then
            plugin=$(echo $line | awk -F " " '{print $2}' | cut -c 2-)
            plugin=${plugin%?}
            url="${hostname}"$(echo ${plugin})".git"

            echo -e "\033[36mPlugin: ${url}\033[0m"
            cd ~/.vim/bundle/ && git clone ${url}
            #code=$?
            #if [ "$code"x != "0"x ] && [ "$code"x != "128"x ]; then
            #    error "git error $code"
            #fi
        fi
    done
}

option=$1
if [ "$option"x = "clean"x ]; then
    deployClean
elif [ "$option"x = "install"x ]; then
    deployInstall
else
    echo "Useage: $0 <install|clean>"
    exit 1
fi

echo -e "\033[32m[INFO]\033[0m Compeleted!"
