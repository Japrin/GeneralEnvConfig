"
"                                                    o8o                                       
"                                                    `"'                                       
"ooo. .oo.  .oo.   oooo    ooo          oooo    ooo oooo  ooo. .oo.  .oo.   oooo d8b  .ooooo.  
"`888P"Y88bP"Y88b   `88.  .8'            `88.  .8'  `888  `888P"Y88bP"Y88b  `888""8P d88' `"Y8 
" 888   888   888    `88..8'              `88..8'    888   888   888   888   888     888       
" 888   888   888     `888'         .o.    `888'     888   888   888   888   888     888   .o8 
"o888o o888o o888o     .8'          Y8P     `8'     o888o o888o o888o o888o d888b    `Y8bod8P' 
"                  .o..P'                                                                      
"                  `Y8P'                                                                       
"                                                                                              
"
"
" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

filetype off

"  =====================  plugin manager Vundle ===============
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" The bundles you install will be listed here
""""""""""""""""""""""""
" basic
""""""""""""""""""""""""
Plugin 'VundleVim/Vundle.vim'
" gmarik/vundle is the same as VundleVim/Vundle.vim
"Plugin 'gmarik/vundle'
" Lokaltog/powerline is the same as powerline/powerline
"Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim'}
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim'}
""""""""""""""""""""""""
" Git
""""""""""""""""""""""""
" Fugitive is the premier Vim plugin for Git. Or maybe it's the premier Git
" plugin for Vim? Either way, it's 'so awesome, it should be illegal'. That's
" why it's called Fugitive.
Plugin 'tpope/vim-fugitive'
""""""""""""""""""""""""
" REPL
""""""""""""""""""""""""
" type text in a file, send it to a live REPL by Ctrl-C Ctrl-C
Plugin 'jpalardy/vim-slime'
" simulate a split shell in vim using either gnu screen or tmux,
" and to send selections to be evaluated by the program running
" in that shell. (This repository has been archived by the owner on Jun 5,
" 2024. It is now read-only)
Plugin 'ervandew/screen'
""""""""""""""""""""""""
" R plugins & completion
""""""""""""""""""""""""
" This is Nvim-R which improves Vim's support to edit R scripts
" My favorite ^_^
Plugin 'jalvesaq/Nvim-R'
" Yet Another Remote Plugin Framework for Neovim
Plugin 'roxma/nvim-yarp'
" a slim, fast and hackable completion framework for neovim
" require roxma/nvim-yarp
Plugin 'ncm2/ncm2'
" Asynchronous R completion for Neovim and vim 8
" It relies on the great plugin nvim-R to get the
" completion data and extends ncm2 for the completion
Plugin 'gaalcaras/ncm-R'
" UltiSnips is the ultimate solution for snippets in Vim
Plugin 'sirver/UltiSnips'
" UltiSnips integration for ncm2.
Plugin 'ncm2/ncm2-ultisnips'
Plugin 'ervandew/supertab'
Plugin 'vim-scripts/ShowMarks'
""""""""""""""""""""""""
" python plugins
""""""""""""""""""""""""
" python package pylama is required
Plugin 'python-mode/python-mode'
""""""""""""""""""""""""
" LaTex plugins
""""""""""""""""""""""""
" VimTeX is a modern Vim and Neovim filetype and
" syntax plugin for LaTeX files
Plugin 'lervag/vimtex'
""""""""""""""""""""""""
" taglist
""""""""""""""""""""""""
" ctags command (https://github.com/universal-ctags/ctags)
" should be installed
Plugin 'yegappan/taglist'
""""""""""""""""""""""""
" BufExplorer
""""""""""""""""""""""""
" With bufexplorer, you can quickly and easily switch between buffers
Plugin 'jlanzarotta/bufexplorer'
""""""""""""""""""""""""
" NERDTree
""""""""""""""""""""""""
" The NERDTree is a file system explorer for the Vim editor
Plugin 'preservim/nerdtree'
""""""""""""""""""""""""
" winmanager
""""""""""""""""""""""""
" manage the layout of BufExplorer, NERDTree and taglist ?
Plugin 'vim-scripts/winmanager'
""""""""""""""""""""""""
" miscellaneous
""""""""""""""""""""""""
" filetype plugin for CSV files
Plugin 'chrisbra/csv.vim'
call vundle#end()            " required

filetype plugin indent on    " required
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


"  ===============  plugin manager pathogen.vim ===============
"execute pathogen#infect('bundle/pathogen/{}')


"  ============================================================
""""""""""""""""""""""""""""""""""""""""""""""""
" basic
""""""""""""""""""""""""""""""""""""""""""""""""
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set history=50  " keep 50 lines of command line history
set ruler       " show the cursor position all the time
set showcmd     " display incomplete commands
set incsearch   " do incremental searching
" automatically change window's cwd to file's dir
set autochdir
" I'm prefer spaces to tabs
set tabstop=4
set shiftwidth=4
set expandtab
set clipboard=exclude:.*
set foldenable
" the order of 'syntax on' is important
" should before 'colorscheme' ??
syntax on
set hlsearch
"autocmd FileType c,cpp  setl fdm=syntax | setl fen

""""""""""""""""""""""""""""""""""""""""""""""""
" colorscheme
""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme default_my

""""""""""""""""""""""""""""""""""""""""""""""""
" Powerline setup
""""""""""""""""""""""""""""""""""""""""""""""""
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
set laststatus=2
set term=xterm-256color
set t_Co=256
" set termencoding=utf-8
" set guifont=Ubuntu\ Mono\ derivative\ Powerline:10
let g:Powerline_symbols = 'fancy'
set encoding=utf-8

""""""""""""""""""""""""""""""""""""""""""""""""
" R plugins and RMarkdonn
""""""""""""""""""""""""""""""""""""""""""""""""
function! RMakeHTML_2()
  update
  call RSetWD()
  let filename = expand("%:r:t")
  let rcmd = "require('knitrBootstrap');
    \knit_bootstrap(\"" . filename . ".Rmd\")"
"  if g:vimrplugin_openhtml
"    let rcmd = rcmd . '; browseURL("' . filename . '.html")'
"  endif
  call g:SendCmdToR(rcmd)
endfunction
"bind RMakeHTML_2 to leader kk
nnoremap <silent> <Leader>kk :call RMakeHTML_2()<CR>
""" The option R_in_buffer was replaced with R_external_term.
""" let R_in_buffer = 0
let R_applescript = 0
""" The R_source file was from
""" https://github.com/jalvesaq/Nvim-R/blob/master/R/tmux_split.md
let R_source='~/.vim/plugin/tmux_split.vim'
map <LocalLeader>nc :call RAction("colnames")<CR>
map <LocalLeader>n2 :call RAction("names")<CR>
map <LocalLeader>nh :call RAction("head")<CR>
map <LocalLeader>nd :call RAction("dim")<CR>
""""map <LocalLeader>cc :call RAction("class")<CR>
map <LocalLeader>sb :call SendCmdToR("system.time({")<CR>
map <LocalLeader>se :call SendCmdToR("})")<CR>

""""""""""""""""""""""""""""""""""""""""""""""""
" slime
""""""""""""""""""""""""""""""""""""""""""""""""
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "1"}
let g:slime_dont_ask_default = 1

""""""""""""""""""""""""""""""""""""""""""""""""
" screen
""""""""""""""""""""""""""""""""""""""""""""""""
" !!!!! make sure no windows have name as 'screenshell' !!!!!
let g:ScreenImpl = "Tmux"
"autocmd FileType python map <LocalLeader>rf :ScreenShell! ipython3<CR>
"autocmd FileType python map <LocalLeader>rrf :ScreenShell! ipython<CR>
autocmd FileType python map <LocalLeader>rf :ScreenShellVertical ipython3<CR>
autocmd FileType python map <LocalLeader>rrf :ScreenShellVertical ipython<CR>
autocmd FileType python map <LocalLeader>rq :ScreenQuit<CR>
" Send current line to python and move to next line.
autocmd FileType python map <LocalLeader>n V:ScreenSend<CR>j
" Send current line to python
autocmd FileType python map <LocalLeader>l V:ScreenSend<CR>
" Send visual selection to python and move to next line.
autocmd FileType python map <LocalLeader>ss :ScreenSend<CR>`>0j

""""""""""""""""""""""""""""""""""""""""""""""""
" python
""""""""""""""""""""""""""""""""""""""""""""""""
augroup vimrc_autocmds
    au!
    " highlight characters past column 80
    autocmd FileType python highlight OverLength ctermbg=DarkGrey guibg=Black
    autocmd FileType python match OverLength /\%80v.*/
    "autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    "autocmd FileType python match Excess /\%80v.*/
    autocmd FileType python set colorcolumn=""
    "autocmd FileType python set colorcolumn=80
    autocmd FileType python set nowrap
augroup END
""""""""""""""""""""""""
" python-mode
""""""""""""""""""""""""
" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator " modes)
" ]]            Jump on next class or function (normal, visual, operator " modes)
" [M            Jump on previous class or method (normal, visual, operator " modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 0
" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'
"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pep8_ignore="E501,W601"
" Auto check on save
let g:pymode_lint_write = 1
" Support virtualenv
let g:pymode_virtualenv = 1
" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'
" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
" Don't autofold code
let g:pymode_folding = 0


""""""""""""""""""""""""""""""""""""""""""""""""
" Taglist (display problem ?)
""""""""""""""""""""""""""""""""""""""""""""""""
let Tlist_Ctags_Cmd = 'ctags'
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
"let Tlist_Use_Right_Window = 1
"let Tlist_Auto_Open = 1
let Tlist_File_Fold_Auto_Close = 1 
"let Tlist_Close_On_Select = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Process_File_Always = 1
map <silent> <F9> :TlistToggle<cr> 

""""""""""""""""""""""""""""""""""""""""""""""""
" BufExplorer
""""""""""""""""""""""""""""""""""""""""""""""""
" \<Leader\>be normal open
" \<Leader\>bt toggle open / close
" \<Leader\>bs force horizontal split open
" \<Leader\>bv force vertical split open
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.
let g:bufExplorerSplitRight=0        " Split left.
let g:bufExplorerSplitVertical=1     " Split vertically.
let g:bufExplorerSplitVertSize = 30  " Split width
let g:bufExplorerUseCurrentWindow=1  " Open in new window.
autocmd BufWinEnter \[Buf\ List\] setl nonumber 

""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""
map <F2> :NERDTreeToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""
" winManager setting (old ? some bugs ?)
""""""""""""""""""""""""""""""""""""""""""""""""
"let g:winManagerWindowLayout = "BufExplorer,FileExplorer|TagList"
let g:winManagerWindowLayout = 'BufExplorer,NERDTree|TagList'
let g:winManagerWidth = 30
let g:defaultExplorer = 0
nmap <C-W><C-F> :FirstExplorerWindow<cr>
nmap <C-W><C-B> :BottomExplorerWindow<cr>
nmap <silent> <leader>wm :WMToggle<cr> 

""""""""""""""""""""""""""""""""""""""""""""""""
" superTab setting
""""""""""""""""""""""""""""""""""""""""""""""""
let g:SuperTabRetainCompletionType = 1
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
let g:SuperTabClosePreviewOnPopupClose = 1

""""""""""""""""""""""""""""""""""""""""""""""""
" showmarks setting
""""""""""""""""""""""""""""""""""""""""""""""""
" By default the following keymappings are defined:
   \mt : Toggles ShowMarks on and off.
   \mh : Hides an individual mark.
   \ma : Hides all marks in the current buffer.
   \mm : Places the next available mark.
" " Enable ShowMarks
let showmarks_enable = 1
" Show which marks
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
" Ignore help, quickfix, non-modifiable buffers
let showmarks_ignore_type = "hqm"
" Hilight lower & upper marks
let showmarks_hlline_lower = 1
let showmarks_hlline_upper = 0


""""""""""""""""""""""""""""""""""""""""""""""""
" miscellaneous
""""""""""""""""""""""""""""""""""""""""""""""""
"Set mapleader
"let mapleader = ","
""Fast reloading of the .vimrc
map <silent> <leader>ss :source ~/.vimrc<cr>
"Fast editing of .vimrc
map <silent> <leader>ee :e ~/.vimrc<cr>
""When .vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc
" 
set sessionoptions-=curdir
set sessionoptions+=sesdir
" Use <leader>l to toggle display of whitespace
nmap <leader>l :set list!<CR>


""""""""""""""""""""""""""""""""""""""""""""""""
" complex
""""""""""""""""""""""""""""""""""""""""""""""""
" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!
  " For all text files set 'textwidth' to 78 characters.
  "autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
  augroup END
else
  set autoindent		" always set autoindenting on
endif " has("autocmd")

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
"if &t_Co > 2 || has("gui_running")
"  syntax on
"  set hlsearch
"endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langnoremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If unset (default), this may break plugins (but it's backward
  " compatible).
  set langnoremap
endif



"
" [reference]
" vimrc from: Bram Moolenaar <Bram@vim.org> etc.
" website: https://blog.easwy.com/archives/advanced-vim-skills-catalog/
"
