set nocompatible            " 关闭 vi 兼容模式

" install bundles
if filereadable(expand("~/.vimrc.bundles"))
    source ~/.vimrc.bundles
endif

" ==================================================================
" Vim 设置
" ==================================================================
filetype on                     " 检测文件类型
filetype plugin on              " 根据文件类型使用不同插件
filetype indent on              " 根据文件类型使用不同缩进方案
syntax on                       " 自动语法高亮
colorscheme molokai             " 配色方案
set encoding=utf-8              " vim内部编码
set fileencodings=utf-8,GB18030,ucs-bom,default,latin1  " vim 尝试编码顺序
set number                      " 显示行号
set nowrap                      " 禁用自动分行
set cursorline                  " 高亮当前行
set cmdheight=1                 " 命令行高度
set laststatus=2                " 始终显示状态栏
set backspace=eol,start,indent  " 退格键策略
set shiftwidth=4                " 设定 << 和 >> 命令移动时的宽度为 4
set softtabstop=4               " 使得按退格键时可以一次删掉 4 个空格
set tabstop=4                   " 设定 tab 长度为 4
set expandtab                   " 使用空格代替tab
set autoindent                  " 自动缩进
set ignorecase smartcase        " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
set incsearch                   " 输入搜索内容时就显示搜索结果
set hlsearch                    " 搜索时高亮显示被找到的文本
set magic                       " 设置正则表达式模式
set foldenable                  " 启用折叠
set foldlevel=99                " 设置默认不折叠
set foldcolumn=0                " 显示折叠
set foldmethod=indent           " 设置根据缩进折叠
set scrolloff=7                 " 移动光标是上下方保留行数

" ==================================================================
" 其他设置
" ==================================================================

" ==================================================================
" 键盘映射
" ==================================================================
" 设置折叠快捷键为空格
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' :'zo')<CR>

" 废弃F1帮助键 使用:help打开帮助
noremap <F1> <Esc>

" F2显示/隐藏行号
noremap <F2> :set number! number?<CR>

" F3 显示可打印字符开关
nnoremap <F3> :set list! list?<CR>

" F4 换行开关
nnoremap <F4> :set wrap! wrap?<CR>

" F5 粘贴开关
nnoremap <F5> :set paste! paste?<CR>

