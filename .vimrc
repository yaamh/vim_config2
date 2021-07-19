set nocompatible	"vim比vi支持更多功能，如showcmd，避免冲突和副作用
let mapleader = ","
filetype off


call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-startify'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'voldikss/vim-translator'
Plug 'rking/ag.vim'
Plug 'ycm-core/YouCompleteMe'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/tagbar'
Plug 'lfv89/vim-interestingwords'
Plug 'preservim/nerdcommenter'
Plug 'Yggdroot/indentLine'
Plug 'voldikss/vim-translator'
Plug 'terryma/vim-multiple-cursors'



"translator
nnoremap T :TranslateW<cr>
vnoremap T :TranslateW<cr>

function! SearchWord()
    let expl=system('sdcv --utf8-output -n ' .
                \  expand("<cword>"))
    windo if
                \ expand("%")=="diCt-tmp" |
                \ q!|endif
    40vsp diCt-tmp
    setlocal buftype=nofile bufhidden=hide noswapfile
    1s/^/\=expl/
    1
endfunction
nmap <leader>w :call SearchWord()<CR>

"vim-interestingwords
",k 设置感兴趣单词
nnoremap <silent> n :call WordNavigation(1)<cr>
nnoremap <silent> N :call WordNavigation(0)<cr>

"tagbar
nmap <f3> :TagbarToggle<cr>
let g:tagbar_left=1

"easymotion
nmap ss <Plug>(easymotion-s2)

"airline配置
set t_Co=256
set lazyredraw
set laststatus=2  "永远显示状态栏
let g:airline_powerline_fonts = 1  " 支持 powerline 字体
let g:airline#extensions#tabline#enabled = 1 " 显示窗口tab和buffer


" NerdTree才插件的配置信息
"将F2设置为开关NERDTree的快捷键
noremap <f2> :NERDTreeToggle<cr>
"通过打开文件快速定位目录
noremap <leader>v :NERDTreeFind<cr> 
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
"窗口是否显示行号
let g:NERDTreeShowLineNumbers=1
let g:NERDTreeWinPos='right'

"fzf
map <leader>f  :Files<cr>
map <leader>t  :Tags<cr>
map <leader>b  :Buffers<cr>


call plug#end()
"安装插件，先找到其在github的地址，再将配置信息加入.vimrc中的call
":PluginInstall 便可自动安装
"要卸载插件，先在.vimrc中注释或删除对应插件配置信息，然后在vim中执行
":PluginClean便可卸载对应插件
"批量更新，只需执行:PluginUpdate


set number    "显示行号 
set ignorecase "忽略大小写 
set hlsearch  "收索高亮
set autoread  "文件改变时自动载入
syntax on     "语法高亮
set cursorline "突出显示当前行
"set mouse=a    "启用鼠标
"set selection=exclusive
"set selectmode=mouse,key
set laststatus=2 "显示状态栏
set completeopt=longest,menu  "自动补全
set ruler      "显示光标当前位置
set history=500   "显示当前行
set showmatch    "显示匹配括号
set background=dark
set ts=4        "tab键2格
set expandtab   "tab转空格
set shiftwidth=4 "自动缩进2格
set autoindent  "自动缩进
set backspace=indent,eol,start   "解决无法退格问题
set pastetoggle=<F9> "打开关闭自动缩进
set undofile
set undodir=~/.vim/undodir "撤销持久化

nnoremap <c-b> :bnext<cr>
nnoremap <c-p> :bprev<cr>
nnoremap <c-h>    <c-w>h
nnoremap <c-j>    <c-w>j
nnoremap <c-k>    <c-w>k
nnoremap <c-l>    <c-w>l  
nnoremap cw       :q!<cr>
nnoremap <leader>h   :vertical res -5<cr> 
nnoremap <leader>j   :res +5<cr> 
nnoremap <leader>k   :res -5<cr> 
nnoremap <leader>l   :vertical res +5<cr> 
"快速注释
vnoremap 9     $
nnoremap 9     $
inoremap jj    <esc> 
nnoremap <c-f> :Ag! -w <cword><cr>
vnoremap <c-f> :Ag! -w <c-r>w<cr> 


"gtags
"使用 cscope 作为 tags 命令
set cscopetag 
"使用 gtags-cscope 代替 cscope
set cscopeprg='gtags-cscope' 
let GtagsCscope_Auto_Load = 1
let CtagsCscope_Auto_Map = 1
let GtagsCscope_Quiet = 1
let gtags_file=findfile("GTAGS", ";") "查找 gtags 文件
if !empty(gtags_file)
    exe "cs add" gtags_file
endif
"查找符号，会显示列表出来
nnoremap <leader>gs :cs find s <cword><cr>
"查找定义
nnoremap <leader>gg :cs find g <cword><cr>
"查找调用本函数的函数
nnoremap <leader>gc :cs find c <cword><cr> 
"查找本函数调用的函数
nnoremap <leader>gd :cs find d <cword><cr> 
"查找symbol被赋值的地方
nnoremap <leader>g= :cs find a <cword><cr>



"<c-i>前跳
"<c-o>回跳
",f   查找文件
",v   打开文件所在目录 
"zf 折叠代码
"zo 打开折叠
"zz 将当前行移动到屏幕中央
",ci 快速注释
