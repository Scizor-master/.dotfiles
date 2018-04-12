if &compatible
  set compatible
endif

""""""""""""""""
" Reset augroup
augroup MyAutoCmd
  autocmd!
augroup END

""""""""""""""""
" Environment
let $CACHE = empty($XDG_CACHE_HOME) ? expand('$HOME/.cache') : $XDG_CACHE_HOME

if !isdirectory(expand($CACHE))
  call mkdir(expand($CACHE), 'p')
endif

""""""""""""""""
" Load Python
" let g:python_host_prog = '/usr/bin'
" let g:python3_host_prog = '/usr/local/bin'


""""""""""""""""
" Load Dein
let s:dein_dir = expand('$CACHE/dein')
if &runtimepath !~# '/dein.vim'
  let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif

  execute 'set runtimepath^=' . s:dein_repo_dir
endif

" Load toml files
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#load_toml('$HOME/.vim/toml/dein.toml', {'lazy': 0})
  call dein#load_toml('$HOME/.vim/toml/dein_lazy.toml', {'lazy': 1})
  call dein#load_toml('$HOME/.vim/toml/dein_python.toml', {'lazy': 1})
  call dein#load_toml('$HOME/.vim/toml/dein_frontend.toml', {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if has('vim_starting') && dein#check_install()
  call dein#install()
endif

""""""""""""""""
" Read rc files
function! s:source_rc(rc_file)
  let s:rc_path = expand('$HOME/.vim/rc/' . a:rc_file)

  if filereadable(s:rc_path)
    execute 'source' fnameescape(s:rc_path)
  endif
endfunction

call s:source_rc('mappings.rc.vim')
call s:source_rc('options.rc.vim')
call s:source_rc('filetype.rc.vim')

""""""""""""""""
" Colors
set background=dark
syntax on
filetype plugin indent on
colorscheme iceberg
set termguicolors
