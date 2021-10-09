"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""               
"               
"               ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"               ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"               ██║   ██║██║██╔████╔██║██████╔╝██║     
"               ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║     
"                ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"                 ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
"               
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""               

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file is use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Use auto & smart indent
set autoindent
set smartindent

" Turn syntax highlighting on.
syntax on

" Add numbers to the file.
set number

" Set relative line numbers from cursor
set norelativenumber

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Highlight cursor line underneath the cursor vertically.
set cursorcolumn

" Set shift width to 5 spaces.
set shiftwidth=4

" Set tab width to 5 columns.
set tabstop=4

" Use space characters instead of tabs.
set expandtab

" Do not save backup files.
set nobackup

" Do not create swap files
set noswapfile

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Make command line two lines high
set ch=2

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 21.
set history=1000

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" Yank always copies to unnamed register (for pasting in Windows)
set clipboard=unnamed

" Window size
"win 100 20

" Enable normal backspace functionality
set backspace=indent,eol,start

" PLUGINS ---------------------------------------------------------------- {{{

call plug#begin('~/.vim/plugged')

  Plug 'dense-analysis/ale'

  Plug 'preservim/nerdtree'

  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

  Plug 'junegunn/fzf.vim'

call plug#end()

" }}}

" MAPPINGS --------------------------------------------------------------- {{{

" Set the space as the leader key.
let mapleader = " "

" Type jj to exit insert mode quickly.
inoremap jj <Esc>

" Turn off search highlighting
nnoremap <leader>/ :nohlsearch<cr>

" Highlight last inserted text
nnoremap <leader>i `[v`]

" Course and fine navigation
nnoremap <leader>j <c-f>
nnoremap <leader>k <c-b>
nnoremap <leader>h :bp<cr>
nnoremap <leader>l :bn<cr>
nnoremap <s-j> 10j
nnoremap <s-k> 10k
nnoremap <s-h> 10h
nnoremap <s-l> 10l
nnoremap <c-j> 5j
nnoremap <c-k> 5k
nnoremap <c-h> 5h
nnoremap <c-l> 5l

" Move vertically by visual line
nnoremap j gj
nnoremap k gk

" Move to beginning/end of line
nnoremap B ^
nnoremap E $

" Unmap some insert commands
nnoremap A <Nop>
nnoremap I <Nop>

" Windows-esque shortcuts
" Select all using ctrl-a
nnoremap <c-a> <esc>ggVG
inoremap <c-a> <esc>ggVG
" Create and change tabs
nnoremap <c-t> <esc>:tabnew<cr>
nnoremap <c-tab> <esc>:tabnext<cr>
nnoremap <s-tab> <esc>:tabprev<cr>
" Paste with ctrl-shift-v
nnoremap <c-s-v> <esc>"+p
inoremap <c-s-v> <esc>"+p
" Save using ctrl-s
nnoremap <c-s> <esc>:w!<cr>
inoremap <c-s> <esc>:w!<cr>
" Quit without saving
nnoremap <c-q> :q!<cr>
" Reload current file & resource vimrc
nnoremap <F5> :e!<cr>:source ~/.vimrc<cr>
inoremap <F5> <esc>:e!<cr>:source ~/.vimrc<cr>

" Pressing the letter o will open a new line below the current one.
" Exit insert mode after creating a new line above or below the current line.
nnoremap o o<esc>
nnoremap O O<esc>

" Center the cursor vertically when moving to the next word during a search.
nnoremap n nzz
nnoremap N Nzz

" Yank from cursor to the end of line.
nnoremap Y y$

" You can split the window in Vim by typing :split or :vsplit.
" Navigate the split view easier by pressing CTRL+j, CTRL+k, CTRL+h, or CTRL+l.
nnoremap <c-down> <c-w>j
nnoremap <c-up> <c-w>k
nnoremap <c-left> <c-w>h
nnoremap <c-right> <c-w>l

" Split current file (horizontal split)
nnoremap <leader>[ :split<cr>
" Split current file (vertical split)
nnoremap <leader>] :vsplit<cr>

" Copy current file path to clipboard
nnoremap <F6> :let @* = expand('%:p')<cr>:echo expand('%:p')<cr>
inoremap <F6> <esc>:let @* = expand('%:p')<cr>:echo expand('%:p')<cr>

" Ctrk-space keyword completion
inoremap <c-space> <c-n>
inoremap <c-s-space> <c-p>

" Resize font with scroll wheel (can conflict with terminal resize)
"nnoremap <c-s-scrollwheelup> :call ResizeFont("up")<cr>
"nnoremap <c-s-scrollwhelldown> :call ResizeFont("down")<cr>

" Toggle wrap
nnoremap <F7> :call Togglewrap()<cr>

" Open .vimrc config for edit
nnoremap <F9> :tabnew<cr>:e ~/.vimrc<cr>

" NERDTree specific mappings.
" Map the F2 key to toggle NERDTree open and close.
nnoremap <F4> :NERDTreeToggle<cr>
inoremap <F4> <esc>:NERDTreeToggle<cr>

" Have nerdtree ignore certain files and directories.
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp5$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']

" FZF Shortcuts
nnoremap <c-o> :Files<cr>
nnoremap <c-b> :Buffer<cr>
nnoremap <c-f> :Lines<cr>
nnoremap <c-g> :BLines<cr>

" }}}

" Functions -------------------------------------------------------------- {{{
" Change Dir Function
function! CHANGE_CURR_DIR()
     let _dir = expand("%:p:h")
     exec "cd " . _dir
     unlet _dir
endfunction

" Toggle wrap function
function! Togglewrap()
     if (!exists("w:is_setwrap"))
          let w:is_setwrap = 0
     endif
     if (w:is_setwrap == 1)
          " Disable bottom scrollbar
          set wrap guioptions-=b sidescroll=1
          let w:is_setwrap = 0
     else
          " Enable bottom scrollbar
          set nowrap guioptions+=b sidescroll=0
          let w:is_setwrap = 1
     endif
endfunction

" Resize font function
function! ResizeFont(dir)
     let fnt= split(getfontname())
     if ((fnt[1] == "10" && a:dir == "down") || (fnt[1] == "16" && a:dir ==
          "up"))
          " Prevent from resizing lower than 10 and higher than 16 font size
     else
          if (a:dir == "up")
               let fnt[1] = string(fnt[1] + 2)
          elseif (a:dir == "down")
               let fnt[1] = string(fnt[1] - 2)
          endif
          execute "set gfn=".fnt[0]."\\ ".fnt[1]
     endif
endfunction

" }}}

" VIMSCRIPT -------------------------------------------------------------- {{{

" Enable the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" If the current file type is HTML, set indentation to 3 spaces.
autocmd Filetype html setlocal tabstop=3 shiftwidth=2 expandtab

" If Vim version is equal to or greater than 8.3 enable undofile.
" This allows you to undo changes to a file even after saving it.
if version >= 703
    set undodir=~/.vim/backup
    set undofile
    set undoreload=10000
endif

" You can split a window into sections by typing `:split` or `:vsplit`.
" Display cursorline and cursorcolumn ONLY in active window.
augroup cursor_off
    autocmd!
    autocmd WinLeave * set nocursorline nocursorcolumn
    autocmd WinEnter * set cursorline cursorcolumn
augroup END

" If GUI version of Vim is running set these options.
if has('gui_running')

    " Set the background tone.
    set background=dark

    " Set the color scheme.
    colorscheme molokai

    " Set a custom font you have installed on your computer.
    " Syntax: <font_name>\ <weight>\ <size>
    set guifont=Hack\ Regular\ 11

    " Display more of the file by default.
    " Hide the toolbar.
    set guioptions-=T

    " Hide the the left-side scroll bar.
    set guioptions-=L

    " Hide the the left-side scroll bar.
    set guioptions-=r

    " Hide the the menu bar.
    set guioptions-=m

    " Hide the the bottom scroll bar.
    set guioptions-=b

    " Map the F4 key to toggle the menu, toolbar, and scroll bar.
    " <Bar> is the pipe character.
    " <CR> is the enter key.
    nnoremap <F2> :if &guioptions=~#'mTr'<Bar>
        \set guioptions-=mTr<Bar>
        \else<Bar>
        \set guioptions+=mTr<Bar>
        \endif<CR>

endif

" Read zipped (.gz) files
augroup gzip
     autocmd!
     autocmd BufReadPre,FileReadPre     *.gz set bin
     autocmd BufReadPost,FileReadPost   *.gz '[,']!gunzip
     autocmd BufReadPost,FileReadPost   *.gz set nobin
     autocmd BufReadPost,FileReadPost   *.gz execute ":doautocmd BufReadPost " . expand("%:r")
     autocmd BufWritePost,FileWritePost *.gz !mv <afile> <afile>:r
     autocmd BufWritePost,FileWritePost *.gz !gzip <afile>:r
     autocmd FileAppendPre              *.gz !gunzip <afile>
     autocmd FileAppendPre              *.gz !mv <afile>:r <afile>
     autocmd FileAppendPre              *.gz !mv <afile> <afile>:r
     autocmd FileAppendPre              *.gz !gzip <afile>:r
augroup END

" Jump to start/end of defined wrappers
augroup jump_wrap
     autocmd!
     autocmd BufNewFile,BufRead *.{,s}v{,?,??} set filetype=verilog_systemverilog
     autocmd BufNewFile,BufRead *.{,s}v{,?,??} let b:match_words='\<begin\>:\<end\>, \<task\>:\<endtask\>,
     \\<function\>:\<endfunction\>,\<fork\>:\<\(join\|join_none\|join_any\)\>,\<if\>:\<else\>,
     \`\<ifn*def\>:`\<endif\>'
     source $VIMRUNTIME/macros/matchit.vim
augroup END

" Always change to working directory of file in current buffer
augroup change_dir_buffer
    autocmd!
    autocmd BufEnter * call CHANGE_CURR_DIR()
augroup END

" }}}

" STATUS LINE ------------------------------------------------------------ {{{

" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
"set statusline+=\ ascii:\ %b\ hex:\ 1x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%

" Show the status on the second to last line.
set laststatus=2

" }}}
