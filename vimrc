set nocompatible            " 关闭 vi 兼容模式

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'Lokaltog/vim-powerline'
Plugin 'scrooloose/nerdtree'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'scrooloose/syntastic'

call vundle#end()

filetype plugin on          " 根据文件类型使用不同插件
filetype indent on          " 根据文件类型使用不同缩进方案

set encoding=utf-8          " vim内部编码
set fileencodings=utf-8,GB18030,ucs-bom,default,latin1  " vim 尝试编码顺序

syntax enable               " 自动语法高亮
let loaded_matchparen = 1   " 禁用括号高亮
set number                  " 显示行号
set nowrap                  " 禁用自动分行
set cursorline              " 高亮当前行
set cmdheight=1             " 命令行高度
color winton                " 配色方案

set laststatus=2            " 始终显示状态栏

set backspace=2             " 退格键策略
set shiftwidth=4            " 设定 << 和 >> 命令移动时的宽度为 4
set softtabstop=4           " 使得按退格键时可以一次删掉 4 个空格
set tabstop=4               " 设定 tab 长度为 4
set expandtab               " 使用空格代替tab

set autoindent              " 自动缩进
set cindent                 " c风格缩进

set ignorecase smartcase    " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
set incsearch               " 输入搜索内容时就显示搜索结果
set hlsearch                " 搜索时高亮显示被找到的文本
set magic                   " 设置正则表达式模式

set foldenable              " 启用折叠
set foldmethod=manual       " 设置根据语法折叠
set foldlevel=99            " 设置默认不折叠
set foldcolumn=1            " 显示折叠

" 插件配置

" Lokaltog/vim-powerline
let g:Powerline_symbols='unicode'

" scrooloose/nerdtree
map <F3> :NERDTreeToggle<CR>

" nathanaelkane/vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2

" scrooloose/syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_cpp_checkers = ['cpplint']

