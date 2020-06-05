" source self definition
source ~/.vimrc.local
" ctags
"noremap <c-]> g<c-]>


" no compatible 
set nocompatible

" indent and load plugin according to type
filetype plugin indent on

" vim encoding
set encoding=utf-8

" Wrap line
set wrap

" j and k work as normal in wrap context
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Turn on the Wild menu                                                                                                                                                  
set wildmenu

" show ruler
set ruler

" backspace work as normal
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Tab config
set smarttab
set expandtab
set shiftwidth=4
set tabstop=4
set si
set ai

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Show current mode in command-line.
set showmode
" Show already typed keys when more are expected.
set showcmd

" Faster redrawing.
set ttyfast
" Only redraw when necessary.
set lazyredraw

" map <leader> to ,
let g:mapleader = ","

" complete but not select for you
set completeopt+=noselect
set completeopt+=noinsert

" Pathogen load
filetype off

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
syntax on

" clear highlight
map <leader>c :nohl<cr>

" set ctags auto select 
set tags=./tags;,tags


" use system clipboard
set clipboard=unnamed,autoselect
set guioptions+=a
 
" increment search
 set incsearch

" search result highlight
 set hlsearch

" Always show the status line
set laststatus=2

" ignorecase
set ignorecase

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ DIR:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c\ %{fugitive#statusline()}

" Set number for all file
set nu

" Bash like keys for the command line
cnoremap <C-A>          <Home>
cnoremap <C-E>          <End>
cnoremap <C-K>          <C-U>

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

" Colorscheme
if ! has("gui_running")
    set t_Co=256
endif
set background=dark
colorscheme peaksea

set list                   " Show non-printable characters.
if has('multi_byte') && &encoding ==# 'utf-8'
  let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±'
else
  let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.'
endif

" Put all temporary files under the same directory.
" https://github.com/mhinz/vim-galore#handling-backup-swap-undo-and-viminfo-files
set backup
set backupdir   =$HOME/.vim/files/backup/
set backupext   =-vimbackup
set backupskip  =
set directory   =$HOME/.vim/files/swap/
set updatecount =100
set undofile
set undodir     =$HOME/.vim/files/undo/
set viminfo     ='100,n$HOME/.vim/files/info/viminfo

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>
"au VimEnter *  NERDTree
"let NERDTreeShowBookmarks=1  " 开启Nerdtree时自动显示Bookmarks
"打开vim时如果没有文件自动打开NERDTree
autocmd vimenter * if !argc()|NERDTree|endif
"当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"设置树的显示图标
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'


""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
map <leader>o :BufExplorer<cr>


""""""""""""""""""""""""""""""
" => CTRL-P
""""""""""""""""""""""""""""""
let g:ctrlp_working_path_mode = 0

let g:ctrlp_map = '<C-f>'

let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'

""""""""""""""""""""""""""""""
" => MRU plugin
""""""""""""""""""""""""""""""
let MRU_Max_Entries = 400
map <leader>f :MRU<CR>

""""""""""""""""""""""""""""""
" => TagList
""""""""""""""""""""""""""""""
map <leader>t :TlistToggle<cr>
let Tlist_Use_Right_Window=1
let Tlist_Auto_Open=0
let Tlist_Exit_OnlyWindow=1
let Tlist_Show_One_File=1

" Config edit, and reload after change
map <leader>e :tabe ~/.vimrc<cr>
autocmd! bufwritepost ~/.vimrc source ~/.vimrc

" Restore last open position
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Youcomplete settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" close preview window
set completeopt=menu,menuone
let g:ycm_add_preview_to_completeopt = 0

" disable diangnositic
let g:ycm_show_diagnostics_ui = 0

" auto complete 
let g:ycm_semantic_triggers =  {
            \'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
            \'cs,lua,javascript': ['re!\w{2}'],
            \}


" ctrl+s swith between .cpp and .h
map <leader>s :call CurtineIncSw()<CR>

" leader + u ,leader + l, 字母大小写切换
map <leader>u viwU
map <leader>l viwu

" <leader>tt 打开shell
map <leader>vt :vertical terminal<CR>
map <leader>ht :terminal<CR>


autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
" there are some defaults for image directory and image name, you can change them
let g:mdip_imgdir = 'img'
let g:mdip_imgname = 'image'
