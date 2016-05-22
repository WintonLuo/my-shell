# my-shell
这是我个人使用shell配置，主要是为了方便在不同服务器上进行配置
- 包括bash配置和vim的配置

## 使用方法
```bash
$ git clone https://github.com/Heaven1881/my-shell.git
$ cd my-shell
$ ./install.sh
```

## Bash
- 配置PS1
- 一些常用的alias
- extract函数，可以自动判断压缩文件后缀名使用对应的方法解压文件

## Vim
使用molokai配色
### 安装的插件

| 插件                            | 描述             |
|---------------------------------|------------------|
| gmark/Vundle.vim                | 插件管理         |
| Lokaltog/vim-powerline          | 状态栏插件       |
| scrooloose/nerdtree             | 左侧文件列表插件 |
| nathanaelkane/vim-indent-guides | 显示缩进对齐线   |
| pangloss/vim-javascript         | js语法缩进       |
| scrooloose/syntastic            | 语法检查         |

## 其他
- `install.sh`和`vimrc.bundle`的内容主要参考[k-vim](https://github.com/wklken/k-vim)的`install.sh`
