set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'othree/xml.vim'
Plugin 'posva/vim-vue'
Plugin 'othree/yajs.vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'bling/vim-airline'
Plugin 'mattn/emmet-vim'
Plugin 'godlygeek/tabular'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'kien/ctrlp.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-commentary'
Plugin 'jiangmiao/auto-pairs'
Plugin 'dyng/ctrlsf.vim' 
Plugin 'jQuery'
Plugin 'othree/html5.vim'
Plugin 'isRuslan/vim-es6'
Plugin 'Valloric/YouCompleteMe'
Plugin 'fatih/vim-go'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'scrooloose/syntastic'
Plugin 'Chiel92/vim-autoformat'
"Plugin 'ryanoasis/vim-devicons'

 call vundle#end()            " required
 filetype plugin indent on    " required

"For True Color
"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

 " settings
 syntax enable
 syntax on
 set background=dark

 let mapleader=','
 let g:solarized_termcolors=256
 let g:rehash256 = 1
 set t_Co=256
 colorscheme one

 let NERDTreeShowHidden=1
 let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
 let g:ycm_min_num_of_chars_for_completion = 4
 let g:ycm_error_symbol = '🦉'
 let g:ycm_add_preview_to_completeopt = 0
 let g:ycm_autoclose_preview_window_after_completion = 1
 let g:ycm_autoclose_preview_window_after_insertion = 1
 let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

 let g:NERDTreeIndicatorMapCustom = {
     \ "Modified"  : "🙄",
     \ "Staged"    : "✚",
     \ "Untracked" : "✭",
     \ "Renamed"   : "➜",
     \ "Unmerged"  : "🤭",
     \ "Deleted"   : "✖",
     \ "Dirty"     : "✗",
     \ "Clean"     : "✔︎",
     \ "Unknown"   : "?"
     \ }

 set termencoding=utf-8
 set encoding=utf8
 set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030
 "set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
 set cul

 set laststatus=2 
 set number
 set relativenumber
 set noshowmode
 set foldlevelstart=99

 set tabstop=2
 set shiftwidth=2
 set softtabstop=2

 set expandtab
 set smarttab
 set autoindent
 set smartindent
 set ruler
 set ignorecase
 set hls
 set foldmethod=syntax
 set showcmd
 set completeopt=longest,menu

 " backup
 set nobackup
 set nowb
 set noswapfile
" search set hlsearch
 set incsearch

 " backspace
 set backspace=eol,start,indent
 set whichwrap+=<,>,h,l

 " javascript settings
 au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

 " html5 settings
 let g:html5_event_handler_attributes_complete = 0

 " nerdtree settings
 " autocmd vimenter * NERDTree
 autocmd StdinReadPre * let s:std_in=1
 autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
 map <silent> <F2> :NERDTreeToggle<CR>
 autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType")) | q | endif 

 " airline settings
 let g:airline_powerline_fonts = 1
 let g:airline#extensions#tabline#enabled = 1
 let g:airline#extensions#tabline#left_sep = ' '
 let g:airline#extensions#tabline#left_alt_sep = '|'

 " ctags settings
 let Tlist_Ctags_Cmd ='/usr/local/Cellar/ctags/5.8/bin/ctags'
 "这里比较重要了，设置ctags的位置，不是指向MacOS自带的那个，而是我们用homebrew安装的那个，Centos下配置注销这行即可。

 " taglist settings
 let Tlist_Use_Right_Window = 1 "让taglist窗口出现在Vim的右边
 let Tlist_File_Fold_Auto_Close = 1
 "当同时显示多个文件中的tag时，设置为1，可使taglist只显示当前文件tag，其它文件的tag都被折叠起来。
 let Tlist_Show_One_File = 1 "只显示一个文件中的tag，默认为显示多个
 let Tlist_Sort_Type ='name'
 "Tag的排序规则，以名字排序。默认是以在文件中出现的顺序排序
 let Tlist_GainFocus_On_ToggleOpen = 1
 "Taglist窗口打开时，立刻切换为有焦点状态
 let Tlist_Exit_OnlyWindow = 1 "如果taglist窗口是最后一个窗口，则退出vim
 let Tlist_WinWidth = 32 "设置窗体宽度为32，可以根据自己喜好设置
 map <silent> <F9> :TlistToggle <CR>

 " emment settings
 let g:user_emmet_mode='n'    "only enable normal mode functions.
 let g:user_emmet_mode='inv'  "enable all functions, which is equal to
 let g:user_emmet_mode='a'    "enable all function in all mode.
 let g:emmet_html5 = 0

 let g:user_emmet_install_global = 0
 autocmd FileType html,css EmmetInstall
 " let g:user_emmet_leader_key='<C-Z>' 
 " let g:user_emmet_expandabbr_key='<Tab>'

 " neocompletecache settings
 let g:acp_enableAtStartup = 0
 let g:neocomplcache_enable_at_startup = 1
 let g:neocomplcache_enable_smart_case = 1
 let g:neocomplcache_min_syntax_length = 3
 let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

 inoremap <expr><C-g>     neocomplcache#undo_completion()
 inoremap <expr><C-l>     neocomplcache#complete_common_string()

 inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
 inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
 inoremap <expr><C-y>  neocomplcache#close_popup()
 inoremap <expr><C-e>  neocomplcache#cancel_popup()

 autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
 autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
 autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
 autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
 autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

 " ctrlp settings
 let g:ctrlp_map = '<c-p>'
 let g:ctrlp_cmd = 'CtrlP'

 let g:ctrlp_working_path_mode = 'ra'
 set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " Linux/MacOSX

 let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
 let g:syntastic_javascript_checkers = ['eslint']
 let g:syntastic_always_populate_loc_list = 1
