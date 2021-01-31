" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#complete_method = 'omnifunc'

" Ultisnips
let g:UltiSnipsSnippetsDir = $HOME.'/.config/nvim/snips'
let g:UltiSnipsSnippetDirectories = ["snips", "priv_snips", "UltiSnips" ]
let g:UltiSnipsEditSplit = "vertical"

" signify (gutter for git)
let g:signify_vcs_list = ['git']
let g:signify_sign_change = '~'
let g:signify_sign_changedelete = '!'
let g:signify_realtime = 1

" Grepper tools preference
let g:grepper = { 'tools': ['rg', 'ag', 'git'] }

" Show those languages with syntax highliting inside Markdown
let g:vim_markdown_folding_level = 2

" neoterm
let g:neoterm_size = '15%'
let g:neoterm_autoinsert = 1

" vim-test
" let g:dispatch_compilers = {'elixir': 'exunit'}
let g:test#strategy = "dispatch"
let g:test#runner_commands = ['RSpec', 'Mix']

" ALE - Asynchronous Linting Engine
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_sign_column_always = 1

let g:ale_sign_error = "◉"
let g:ale_sign_warning = "◉"

highlight ALEErrorSign ctermfg=9 ctermbg=15 guifg=#C30500 guibg=#F5F5F5
highlight ALEWarningSign ctermfg=11 ctermbg=15 guifg=#ED6237 guibg=#F5F5F5

let g:ale_elm_make_use_global = 1
let g:ale_elm_format_use_global = 1

let g:ale_ruby_rubocop_executable = 'bundle'
let g:ale_ruby_rubocop_options = '--safe-auto-correct'

let g:ale_linters = {
      \ 'elixir': ['credo', 'dialyxir','mix'],
      \ 'elm': ['make'],
      \ 'ruby': ['rubocop', 'ruby'],
      \ 'typescript': ['tsserver', 'tslint'],
      \ 'vim': ['vimt'],
      \}

let g:ale_fixers = {
      \ 'elixir': ['mix_format', 'remove_trailing_lines', 'trim_whitespace'],
      \ 'elm': ['format'],
      \ 'ruby': ['rubocop', 'remove_trailing_lines', 'trim_whitespace'],
      \ 'javascript': ['prettier', 'remove_trailing_lines', 'trim_whitespace'],
      \ 'typescript': ['prettier'],
      \ 'json': ['prettier', 'remove_trailing_lines', 'trim_whitespace'],
      \}

" lightline
let g:lightline = {}

let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_infos': 'lightline#ale#infos',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }

let g:lightline.component_type = {
      \     'linter_checking': 'right',
      \     'linter_infos': 'right',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'right',
      \ }

let g:lightline.active = { 'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ]] }

" vim-javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1

" elm-vim
let g:elm_format_autosave = 0

" Disable polyglot in favor of real language packs
" Polyglot is great but it doesn't activate all the functionalities for all
" languages in order to make it load fast.
let g:polyglot_disabled = ['elm', 'elixir', 'markdown']

" localvimrc
let g:localvimrc_debug = 2
let g:localvimrc_persistent = 2
let g:localvimrc_sandbox = 0

" tagbar config for elixir

" vim-jsx
let g:jsx_ext_required = 0


" mix-format
let g:mix_format_on_save = 1
