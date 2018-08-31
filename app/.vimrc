" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on "语法高亮
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif
"aaa
" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif
set nu! "显示行号
set smartindent
set autoindent
" Highlight current line
" au WinLeave * set nocursorline nocursorcolumn
" au WinEnter * set cursorline cursorcolumn
" set cursorline cursorcolumn
" vim profiles
au FileType php call AddPHPFuncList()
set nocompatible              " 去除VI一致性,必须
set backspace=indent,eol,start
filetype off                  " 必须

" 设置包括vundle和初始化相关的runtime path
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" 另一种选择, 指定一个vundle安装插件的路径
"call vundle#begin('~/some/path/here')

" 让vundle管理插件版本,必须
Plugin 'ervandew/supertab'
Plugin 'VundleVim/Vundle.vim'
Plugin 'gmarik/vundle'
Plugin 'Shougo/neocomplete.vim'
"树形结构目录插件
Plugin 'scrooloose/nerdtree'
"强大的自动补全插件
Plugin 'Valloric/YouCompleteMe'
"代码注释插件
Plugin 'scrooloose/nerdcommenter'
"Plugin 'AuthorInfo'
"代码块生成插件
Plugin 'SirVer/ultisnips'
"markdown语法高亮插件
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
"markdown实时预览插件，需要nodejs插件instant-markdown-d支持
Plugin 'suan/vim-instant-markdown'
"json格式化文件 --下载太慢,需要翻墙
"Plugin 'axiaoxin/vim-json-line-format'
"状态栏插件
Plugin 'Lokaltog/vim-powerline'
"全局搜索窗口
Plugin 'vim-scripts/ctrlp.vim'
"撤销记录
Plugin 'mbbill/undotree'
"代码模板插件
"Plugin 'aperezdc/vim-template'
Plugin 'mileszs/ack.vim'
let g:ackprg = 'ag --nogroup --nocolor --column'
"Plugin 'cSyntaxAfter'

"powerline{ 插件对应的配置信息
"set guifont=PowerlineSymbols for Powerline
"set guifont='Monospace\ Regular'
set nocompatible
set t_Co=256
let g:Powerline_symbols = "fancy"
"}

" 以下范例用来支持不同格式的插件安装.
" 请将安装插件的命令放在vundle#begin和vundle#end之间.
"
" Github上的插件
" 格式为 Plugin '用户名/插件仓库名'
" Plugin 'tpope/vim-fugitive'
"
" 来自 http://vim-scripts.org/vim/scripts.html 的插件
" Plugin '插件名称' 实际上是 Plugin 'vim-scripts/插件仓库名' 只是此处的用户名可以省略
" Plugin 'L9'
"
" 由Git支持但不再github上的插件仓库 Plugin 'git clone 后面的地址'
" Plugin 'git://git.wincent.com/command-t.git'
" 本地的Git仓库(例如自己的插件) Plugin 'file:///+本地插件仓库绝对路径'
" Plugin 'file:///home/gmarik/path/to/plugin'
"
" 插件在仓库的子目录中.
" 正确指定路径用以设置runtimepath. 以下范例插件在sparkup/vim目录下
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" 安" 装L9，如果已经安装过这个插件，可利用以下格式避免命名冲突
" Plugi" n 'ascenator/L9', {'name': 'newL9'}
" 
""  你的所有插件需要在下面这行之前
call vundle#end()            " 必须
filetype plugin indent on    " 必须 加载vim自带和插件相应的语法和文件类型相关脚本
" 忽视插件改变缩进,可以使用以下替代:
"filetype plugin on
" "
" 简要帮助文档
" :PluginList       - 列出所有已配置的插件
" :PluginInstall    - 安装插件,追加 `!` 用以更新或使用 :PluginUpdate
" :PluginSearch foo - 搜索 foo ; 追加 `!` 清除本地缓存
" :PluginClean      - 清除未使用插件,需要确认; 追加 `!` 自动批准移除未使用插件
"
" 查阅 :h vundle 获取更多细节和wiki以及FAQ
" 将你自己对非插件片段放在这行之后

function AddPHPFuncList()
set dictionary-=/home/feng/Documents/php/phpFunctionList.txt dictionary+=/home/feng/Documents/php/phpFunctionList.txt
       set complete-=k complete+=k
endfunction

"设置自动生成的文本信息
let g:vimrc_author='chemf' 
let g:vimrc_email='chemf01@163.com' 
let g:vimrc_homepage='' 
nmap <F4> :AuthorInfoDetect<cr>


"taglist插件的配置
let Tlist_Show_One_File=1  "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow=1 "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist窗口
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR> 
nmap <C-L> :TlistToggle<cr> "设置在通用模式下用Ctrl+l打开标签页
" 在 vim 启动的时候默认开启 taglist（autocmd 可以缩写为 au）
"autocmd VimEnter *  TlistOpen
"autocmd VimEnter * wincmd p
"<C-F12>设置在vim下按ctrl+F12直接生成tags文件

set clipboard =unnamed

"autocmd VimEnter * UndotreeToggle
nmap <C-U>  :UndotreeToggle<cr> "设置在通用模式下用Ctrl+t打开文件目录树

" 在 vim 启动的时候默认开启 NERDTree（autocmd 可以缩写为 au）
" 当vim启动时自动切换当前目录到vim打开文件的目录
autocmd VimEnter * cd %:p:h
"autocmd VimEnter * NERDTreeToggle
"autocmd VimEnter * wincmd p
nmap <C-T>  :NERDTreeToggle<cr> "设置在通用模式下用Ctrl+t打开文件目录树
"autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif

"设置黑色背景和solarized主题
set background=dark
"colorscheme solarized
"设置文件编码
set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp936
"设置tab键为四个空格
" 编辑时一个TAB字符占多少个空格的位置。
set ts=4
" 使用每层缩进的空格数。
set sw=4
" 设置tab键为空格,制表符为noexpandtab
set expandtab

" 主动调用补全
let g:ycm_key_invoke_completion = '<C-a>'

map <F5> :w<CR>:!python %<cr>
nmap <F6> :w<CR>:!php -f %<cr>
nmap <F2> :set paste<cr>
map <F3> :%!python -m json.tool<cr>



"使用语法高亮定义代码折叠
set foldmethod=syntax
""打开文件是默认不折叠代码
set foldlevelstart=99

"让ycm支持Python的语义
let g:ycm_python_binary_path = 'python'

set clipboard=unnamedplus

"switch syntax highlighting on, when the terminal has colors
"if (t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  "syntax on
"endif

" Javascript syntax hightlight
syntax enable

" " Set syntax highlighting for specific file types
autocmd BufRead,BufNewFile Appraisals set filetype=ruby
autocmd BufRead,BufNewFile *.md set filetype=markdown
"autocmd Syntax javascript set syntax=jquery

" YouCompleteMe 配置文件
" 设置跳转的快捷键
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
"设置全局配置文件的路径  
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'  
"开启基于tag的补全，可以在这之后添加需要的标签路径  
let g:ycm_collect_identifiers_from_tags_files = 1  
"开启语义补全  
let g:ycm_seed_identifiers_with_syntax = 1  
"在接受补全后不分裂出一个窗口显示接受的项  
set completeopt-=preview  
"不显示开启vim时检查ycm_extra_conf文件的信息  
let g:ycm_confirm_extra_conf=0  
"每次重新生成匹配项，禁止缓存匹配项  
let g:ycm_cache_omnifunc=0  
"在注释中也可以补全  
let g:ycm_complete_in_comments=1  
"输入第一个字符就开始补全  
let g:ycm_min_num_of_chars_for_completion=1  
"不查询ultisnips提供的代码模板补全，如果需要，设置成1即可  
let g:ycm_use_ultisnips_completer=0  
"主动调用补全

let g:ycm_key_invoke_completion = '<C-a>'

"=============================================================
"=                   私人配置                                =
"=============================================================
nmap za :xa<cr>
nmap zq :qa!<cr>
nmap zp <C-W><C-W>

highlight NonText guibg=#060606
highlight Folded  guibg=#0A0A0A guifg=#9090D0

 "Highlight current line 高亮当前行
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn


" 打开javascript折叠
let b:javascript_fold=1
" 打开javascript对dom、html和css的支持
let javascript_enable_domhtmlcss=1
"工作目录随文件变
"autocmd BufEnter * cd %:p:h

"设置load_template 模板插件的模板目录
let g:template_path = '~/.vim/template/'

""""""""""""""""""""""""""""""""""""""""""""
" 新建文件时，自动根据扩展名加载模板文件
autocmd! BufNewFile * call LoadTemplate()
fun LoadTemplate()
    "获取扩展名或者类型名
    let ext = expand ("%:e")
    let tpl = expand("~/.vim/template/".ext.".tpl")
    if !filereadable(tpl)
        echohl WarningMsg | echo "No template [".tpl."] for .".ext | echohl None
        return
    endif

    "读取模板内容
    silent execute "0r ".tpl
    "指定光标位置
    silent execute "normal G$"
    silent call search("#cursor#", "w")
    silent execute "normal 8x"
    "进入插入模式
    startinsert
endfun
""""""""""""""""""""""""""""""""""""""""""""
"ctrl的配置
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
map <leader>f :CtrlPMRU<CR>
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
        \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
            \ }
            let g:ctrlp_working_path_mode=0
            let g:ctrlp_match_window_bottom=1
            let g:ctrlp_max_height=15
            let g:ctrlp_match_window_reversed=0
            let g:ctrlp_mruf_max=500
            let g:ctrlp_follow_symlinks=1

""""""""""""""""""""""""""""""""""""""""""""
"ack.vim的配置
map <leader>a :Ack<space>


"au BufReadPost,BufNewFile *.java colorscheme monokai
colorscheme desert
