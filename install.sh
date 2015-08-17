#!/bin/bash
#set -x

# 删除.vim文件夹
echo -e "\033[32m[INFO]\033[0m Deleting old vim files..."
rm -rf ~/.vim
mkdir -p ~/.vim

# 拷贝.vim文件
echo -e "\033[32m[INFO]\033[0m Copying new vim files..."
cp -r vim/* ~/.vim
cp vimrc ~/.vimrc

# 安装插件
# 插件列表

VIMRC_FILE="vimrc"
hostname="https://github.com/"
cat ${VIMRC_FILE} | while read line
do
    plugin_line=$(echo $line | awk -F " " '{print $1}')
    if [ "$plugin_line"x = "Plugin"x ]; then
        plugin=$(echo $line | awk -F " " '{print $2}' | cut -c 2-)
        plugin=${plugin%?}
        url="${hostname}"$(echo ${plugin})".git"

        cd ~/.vim/bundle/
        echo -e "\033[36mPlugin: ${url}\033[0m"
        git clone ${url}
    fi
done

echo -e "\033[32m[INFO]\033[0m Install Compeleted!"
