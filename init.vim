" Initialize `GlobalAutoCmd`
augroup GlobalAutoCmd
  autocmd!
augroup END
" augroup filetypedetect
" augroup END

" Python provider
let g:python3_host_prog = $PYENV_ROOT . '/shims/python3'

" Ruby provider
let g:loaded_ruby_provider = 0

" Node.js provider
let g:loaded_node_provider = 0

" Options
" What to do with Unicode chars of ambiguous width
set ambiwidth=single
" Take indent for new line from previous line
set autoindent
" Read file when changed outside of vim
set autoread
" Automatically write file if changed
set autowrite
" Keep backup file after overwriting a file
set backup
" List of directories for the backup file
call misc#mkdir(g:nvim_path.backup)
let &backupdir = g:nvim_path.backup
" Do not ring the bell for these reasons
set belloff=all
" How to do indenting when 'cindent' is set
" set cinoptions+=:0,g0,N-1,m1
" Use the clipboard as the unnamed register
set clipboard=unnamed,unnamedplus
" Number of lines to use for the command-line
set cmdheight=2
" Specify how keyword completion `ins-completion` works
" when `CTRL-P` or `CTRL-N` are used
set complete=.
" Options for Insert mode completion `ins-completion``
set completeopt=menuone,noinsert,noselect
" Columns to highlight
set colorcolumn=79
" List of directory names for the swap file
call misc#mkdir(g:nvim_path.swap)
let &directory = g:nvim_path.swap
" Use spaces when <Tab> is inserted
set expandtab
" Width of the column used to indicate folds
set foldcolumn=0
" Folding type
set foldmethod=indent
" Maximum fold depth
set foldnestmax=1
" How automatic formatting is to be done
set formatoptions+=c " Auto-wrap comments using textwidth
set formatoptions+=j " Delete comment character when joining commented lines
set formatoptions+=l " Do not wrap lines that have been longer when starting insert mode already
set formatoptions+=n " Recognize numbered lists
set formatoptions+=q " Allow formatting of comments with 'gq'
set formatoptions+=r " Insert comment leader after hitting <Enter>
set formatoptions+=t " Auto-wrap text using textwidth
" Preferred help languages
set helplang& helplang=en
" Don't unload buffer when it is abandoned
set hidden
" Highlight matches with last search pattern
set hlsearch
" Number of command-lines that are remembered
set history=10000
" Ignore case in search patterns
set ignorecase
" Highlight match while typing search pattern
set incsearch
" Tells when last window has status lines
set laststatus=2
" Wrap long lines at a blank
set linebreak
" Tenths of a second to show matching paren
set matchtime=0
" Maximum memory (in Kbyte) used for pattern search
set maxmempattern=2000000
" Recognize modelines at start or end of file
set modeline
" Number of lines checked for modelines
set modelines=2
" Enable the use of mouse clicks
set mouse=a
" Print the line number in front of each line
set number
" Maximum height of the popup menu
set pumheight=10
" Default regexp engine to use
set regexpengine=2
" Show cursor line and column in the status line
set ruler
" Minimum number of lines to scroll
set scrolljump=1
" Minimum number of lines above and below cursor
set scrolloff=3
" Round indent to multiple of shiftwidth
set shiftround
" Number of spaces to use for (auto)indent step
set shiftwidth=2
" Show full tag pattern when completing tag
set showfulltag
" Briefly jump to matching bracket if insert one
set showmatch
" Tells when the tab pages line is displayed
set showtabline=2
" Minimum number of columns to left and right of cursor
set sidescrolloff=3
" No ignore case when pattern has uppercase
set smartcase
" Smart autoindenting for C programs
set smartindent
" Number of spaces that <Tab> uses while editing
set softtabstop=2
" New window from split is below the current one
set splitbelow
" New window is put right of the current one
set splitright
" Sets behavior when switching to another buffer
set switchbuf=useopen
" Maximum column to find syntax items
set synmaxcol=0
" Number of spaces that <Tab> in file uses
set tabstop=2
" List of file names used by the tag command
set tags=.tags;/
" Uses 24-bit color
set termguicolors
" Maximum width of text that is being inserted
set textwidth=0
" Time out on mappings and key codes
set timeout
" Time out time in milliseconds
set timeoutlen=500
" Time out on mappings
set ttimeout
" Time out time for key codes in milliseconds
set ttimeoutlen=5
" Where to store undo files
call misc#mkdir(g:nvim_path.undo)
let &undodir = g:nvim_path.undo
" Save undo information in a file
set undofile
" Maximum number of changes that can be undone
set undolevels=10000
" After this many milliseconds flush swap file
set updatetime=500
" Files matching these patterns are not completed
set wildignore+=*.jpg,*.jpeg,*.bmp,*.gif,*.png           " image
set wildignore+=*.manifest                               " gb
set wildignore+=*.o,*.obj,*.exe,*.dll,*.so,*.out,*.class " compiler
set wildignore+=*.swp,*.swo,*.swn                        " vim
set wildignore+=*/.git,*/.hg,*/.svn                      " vcs
set wildignore+=tags,*.tags                              " tags
if misc#isMac()
  set wildignore+=*.DS_Store
endif
" Mode for 'wildchar' command-line expansion
" set wildmode=longest,list:full
" Long lines wrap and continue on the next line
set wrap
" Searches wrap around the end of the file
set wrapscan

" Change directory to the file in the current window
set noautochdir
" Ring the bell for error messages
set noerrorbells
" Set to display all folds open
set nofoldenable
" Two spaces after a period with a join command
set nojoinspaces
" Don't redraw while executing macros
set nolazyredraw
" Show (partial) command in status line
set noshowcmd
" Message on status line to show current mode
set noshowmode
" Commands move cursor to first non-blank in line
set nostartofline
" Whether to use a swap file for a buffer
set noswapfile
" Let Vim set the title of the window
set notitle
" Use visual bell instead of beeping
set novisualbell
" Make a backup before overwriting a file
set nowritebackup

" Dein
let s:dein_path = {
      \ 'cache': expand($XDG_CACHE_HOME . '/dein'),
      \ 'dein': expand($XDG_CACHE_HOME . '/dein/repos/github.com/Shougo/dein.vim'),
      \ 'vimproc': expand($XDG_CACHE_HOME . '/dein/repos/github.com/Shougo/vimproc.vim'),
      \ 'toml': g:nvim_path.nvim . '/dein/dein.toml',
      \ 'lazy_toml': g:nvim_path.nvim . '/dein/dein_lazy.toml',
      \ }

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_path.dein)
    execute '!git clone https://github.com/Shougo/dein.vim ' . s:dein_path.dein
    execute '!git clone https://github.com/Shougo/vimproc.vim ' . s:dein_path.vimproc
    execute '!cd ' . s:dein_path.vimproc ' && make'
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_path.dein, ':p')
endif

if dein#load_state(s:dein_path.cache)
  call dein#begin(s:dein_path.cache)

  call dein#load_toml(s:dein_path.toml, {'lazy': 0})
  call dein#load_toml(s:dein_path.lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if !misc#isStarting() && dein#check_install()
  call dein#install()
endif

" GlobalAutoCmd
" Global
autocmd GlobalAutoCmd BufWinEnter *
      \ if line("'\'") > 1 && line("'\'") <= line("$") && &filetype != 'gitcommit' |
      \ execute "silent! keepjumps normal! g`\"zz"

" Go
autocmd GlobalAutoCmd FileType ia64 let b:caw_oneline_comment = '//' | let b:caw_wrap_oneline_comment = ['/*', '*/']

" Vim
" Gautocmd BufWritePost $MYVIMRC,*.vim nested silent! source $MYVIMRC | setlocal colorcolumn=79

" Neosnippet
autocmd GlobalAutoCmd InsertLeave * NeoSnippetClearMarkers


autocmd GlobalAutoCmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" Key mappings
" Define Leader
noremap <Space> <Nop>
let g:mapleader = "\<Space>"
let g:maplocalleader = "\\"

inoremap <silent>jj <Esc>

nnoremap <silent>k gk
nnoremap <silent>j gj
nnoremap <silent>gk k
nnoremap <silent>gj j

nnoremap <C-]> g<C-]>

nnoremap <silent><Esc> <Esc>:noh<CR> 

cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-a> <Home>
cnoremap <C-d> <Del>

" Plugins
" caw.vim
if dein#tap('caw.vim')
  nmap <Leader>c <Plug>(caw:hatpos:toggle)
  vmap <Leader>c <Plug>(caw:hatpos:toggle)
endif

" defx.vim
if dein#tap("defx.nvim")
  Gautocmdft defx call s:defx_settings()
  function! s:defx_settings()
    nnoremap <silent><buffer><expr> <CR>
          \ defx#do_action('open')
    nnoremap <silent><buffer><expr> c
          \ defx#do_action('copy')
    nnoremap <silent><buffer><expr> m
          \ defx#do_action('move')
    nnoremap <silent><buffer><expr> p
          \ defx#do_action('paste')
    nnoremap <silent><buffer><expr> l
          \ defx#do_action('open')
    nnoremap <silent><buffer><expr> E
          \ defx#do_action('open', 'vsplit')
    nnoremap <silent><buffer><expr> P
          \ defx#do_action('open', 'pedit')
    nnoremap <silent><buffer><expr> o
          \ defx#do_action('open_or_close_tree')
    nnoremap <silent><buffer><expr> K
          \ defx#do_action('new_directory')
    nnoremap <silent><buffer><expr> N
          \ defx#do_action('new_file')
    nnoremap <silent><buffer><expr> M
          \ defx#do_action('new_multiple_files')
    nnoremap <silent><buffer><expr> C
          \ defx#do_action('toggle_columns', 'mark:indent:icon:filename:type:size:time')
    nnoremap <silent><buffer><expr> S
          \ defx#do_action('toggle_sort', 'time')
    nnoremap <silent><buffer><expr> d
          \ defx#do_action('remove')
    nnoremap <silent><buffer><expr> r
          \ defx#do_action('rename')
    nnoremap <silent><buffer><expr> !
          \ defx#do_action('execute_command')
    nnoremap <silent><buffer><expr> x
          \ defx#do_action('execute_system')
    nnoremap <silent><buffer><expr> yy
          \ defx#do_action('yank_path')
    nnoremap <silent><buffer><expr> .
          \ defx#do_action('toggle_ignored_files')
    nnoremap <silent><buffer><expr> ;
          \ defx#do_action('repeat')
    nnoremap <silent><buffer><expr> h
          \ defx#do_action('cd', ['..'])
    nnoremap <silent><buffer><expr> ~
          \ defx#do_action('cd')
    nnoremap <silent><buffer><expr> q
          \ defx#do_action('quit')
    nnoremap <silent><buffer><expr> <Space>
          \ defx#do_action('toggle_select') . 'j'
    nnoremap <silent><buffer><expr> *
          \ defx#do_action('toggle_select_all')
    nnoremap <silent><buffer><expr> j
          \ line('.') == line('$') ? 'gg' : 'j'
    nnoremap <silent><buffer><expr> k
          \ line('.') == 1 ? 'G' : 'k'
    nnoremap <silent><buffer><expr> <C-l>
          \ defx#do_action('redraw')
    nnoremap <silent><buffer><expr> <C-g>
          \ defx#do_action('print')
    nnoremap <silent><buffer><expr> cd
          \ defx#do_action('change_vim_cwd')
  endfunction
endif

" Denite
if dein#tap('denite.nvim')
  nmap [denite] <Nop>
  nmap <Leader>d [denite]
  nmap <silent>[denite]b :<C-u>Denite buffer -highlight-mode-insert=search<CR>
  nmap <silent>[denite]fr :<C-u>Denite file/rec -highlight-mode-insert=search<CR>
  nmap <silent>[denite]l :<C-u>Denite line -highlight-mode-insert=search<CR>
  nmap <silent>[denite]o :<C-u>Denite outline -highlight-mode-insert=search<CR>
  nmap <silent>[denite]r :<C-u>Denite register -highlight-mode-insert=search<CR>
endif

" gina.vim
if dein#tap('gina.vim')
  nmap [gina] <Nop>
  nmap <Leader>g [gina]
  nmap <silent>[gina]c :<C-u>Gina commit<CR>
  nmap <silent>[gina]d :<C-u>Gina diff<CR>
  nmap <silent>[gina]l :<C-u>Gina log<CR>
  nmap <silent>[gina]s :<C-u>Gina status<CR>
endif

" LanguageClient-neovim
if dein#tap('LanguageClient-neovim')
  nnoremap <silent>K :call LanguageClient#textDocument_hover()<CR>
  nnoremap <silent><Leader>ld :call LanguageClient#textDocument_definition()<CR>
  nnoremap <silent><Leader>lf :call LanguageClient#textDocument_formatting()<CR>
  nnoremap <silent><Leader>lr :call LanguageClient#textDocument_rename()<CR>
endif

" NOTO: Must be written at the last
" See :help secure
set secure
