" Insert mode keymap in dein
call denite#custom#map('normal', '<C-N>', '<denite:move_to_next_line>')
call denite#custom#map('normal', '<C-P>', '<denite:move_to_previous_line>')
call denite#custom#map('insert', '<C-N>', '<denite:move_to_next_line>')
call denite#custom#map('insert', '<C-P>', '<denite:move_to_previous_line>')
call denite#custom#map('insert', '<C-F>', '<denite:assign_next_line>')
call denite#custom#map('insert', '<C-B>', '<denite:assign_previous_line>')
call denite#custom#map('insert', '<C-S>', '<denite:do_action:split>')
call denite#custom#map('insert', '<C-V>', '<denite:do_action:vsplit>')
call denite#custom#map('insert', '<C-T>', '<denite:do_action:tabopen>')

call denite#custom#source(
\   'file_rec',
\   'matchers',
\   ['matcher_fuzzy', 'matcher_project_files', 'matcher_ignore_globs'],
\ )

call denite#custom#filter(
\   'matcher_ignore_globs',
\   'ignore_globs',
\   ['.git', '.ropeproject', '__pycache__', 'venv/', 'images/', '*.min.*', 'img/', 'fonts/', 'vendor/'],
\ )

" pt and ag command on grep source
if executable('pt')
  call denite#custom#var(
  \   'file_rec',
  \   'command',
  \   ['pt', '--follow', '--nocolor', '--nogroup', '--hidden', '-g', ''],
  \ )
  call denite#custom#var(
  \   'grep',
  \   'command',
  \   ['pt', '--nogroup', '--nocolor', '--smart-case', '--hidden'],
  \ )
  call denite#custom#var('grep', 'default_opts', [])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'separator', [])
elseif executable('ag')
  call denite#custom#var(
  \   'file_rec',
  \   'command',
  \   ['ag', '--follow', '--nocolor', '--nogroup', '--hidden', '-g', ''],
  \ )
  call denite#custom#var(
  \   'grep',
  \   'command',
  \   ['ag', '--nogroup', '--nocolor', '--smart-case', '--hidden'],
  \ )
  call denite#custom#var('grep', 'default_opts', [])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'separator', [])
endif

" Outline source variable
call denite#custom#var('outline', 'ignore_type', ['v'])