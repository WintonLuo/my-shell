#!/bin/bash
#set -x

function error() {
    echo -e "\033[31m[ERROR]\033[0m Deploy failed: $1"
}

function deployClean() {
    # 删除.vim文件夹
    echo -e "\033[32m[INFO]\033[0m Deleting old vim files..."
    rm -rf $HOME/.vim
}

function deployInstall() {
    # 拷贝.vim文件
    mkdir -p $HOME/.vim
    echo -e "\033[32m[INFO]\033[0m Copying new vim files..."
    cp -r vim/* $HOME/.vim
    cp vimrc $HOME/.vimrc

    # 安装插件
    VIMRC_FILE="vimrc"
    hostname="git://github.com/"
    echo -e "\033[32m[INFO]\033[0m Install vim plugin..."
    mkdir -p $HOME/.vim/bundle

    cat ${VIMRC_FILE} | while read line
    do
        plugin_line=$(echo $line | awk -F " " '{print $1}')
        if [ "$plugin_line"x = "Plugin"x ]; then
            plugin=$(echo $line | awk -F " " '{print $2}' | cut -c 2-)
            plugin=${plugin%?}
            url="${hostname}"$(echo ${plugin})".git"

            echo -e "\033[36mPlugin: ${url}\033[0m"
            cd $HOME/.vim/bundle/ && git clone ${url}
        fi
    done
}

function deployCheckers() {
    echo -e "\033[32m[INFO]\033[0m Deploy vim syntax checker..."
    bash_profile="$HOME/.bash_profile"
    syntax_check_flag='# SyntaxChecker'

    touch ${bash_profile}
    grep "${syntax_check_flag}" ${bash_profile} >/dev/null
    if [ $? = 1 ]; then
        echo '' >> ${bash_profile}
        echo ${syntax_check_flag} >> ${bash_profile}
        echo 'export PATH="$PATH:$HOME/.vim/checkers"' >> ${bash_profile}
        source ~/.bash_profile
    fi
}

option=$1
if [ "$option"x = "clean"x ]; then
    deployClean
elif [ "$option"x = "install"x ]; then
    deployInstall
    deployCheckers
else
    echo "Useage: $0 <install|clean>"
    exit 1
fi

echo -e "\033[32m[INFO]\033[0m Compeleted!"
