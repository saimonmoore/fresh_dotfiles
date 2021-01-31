set encoding=utf-8 " default character encoding

let mapleader = ","
let maplocalleader = ","

filetype off

let g:python_host_prog = '/usr/local/bin/python'
let g:python2_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'

call plug#begin()
  " Editing
  Plug 'tpope/vim-commentary' " gc to comment selection, gcc to comment line
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-unimpaired'
  Plug 'tpope/vim-repeat'
  Plug 'FooSoft/vim-argwrap'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'michaeljsmith/vim-indent-object' " defines a new text object representing lines of code at the same indent level.
  Plug 'kana/vim-textobj-user' " Support for user defined text object. Dependency of vim-textobj-rubyblock
  Plug 'nelstrom/vim-textobj-rubyblock', { 'for': 'ruby' } " Select ruby blocks: vir/var

  " Async dispatching
  Plug 'tpope/vim-dispatch'
  Plug 'radenling/vim-dispatch-neovim'

  " Linting
  Plug 'w0rp/ale'
  Plug 'maximbaz/lightline-ale'

  " Statusline
  Plug 'itchyny/lightline.vim'

  " Unix
  Plug 'tpope/vim-eunuch' " e.g :Chmod, :Mkdir, :Rename, :SudoWrite, :SudoEdit

  " git
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb' " Setup
  Plug 'mhinz/vim-signify'

  " Terminal
  Plug 'kassio/neoterm'

  " Testing
  Plug 'janko-m/vim-test'

  " TMUX
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'sjl/vitality.vim'

  " Status line
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  let g:airline#extensions#tagbar#enabled = 0
  
  " Undo
  Plug 'sjl/gundo.vim'

  " Shell
  Plug 'jaawerth/nrun.vim'

  " Language Support

  Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh', }  
  Plug 'ElmCast/elm-vim'
  Plug 'elixir-editors/vim-elixir', { 'for': 'elixir' }
  Plug 'andyl/vim-textobj-elixir', { 'for': 'elixir' }
  Plug 'mhinz/vim-mix-format'
  Plug 'slashmili/alchemist.vim'
  Plug 'plasticboy/vim-markdown'
  Plug 'noprompt/vim-yardoc'
  Plug 'jgdavey/vim-blockle' " Ruby block toggling, <Leader>b
  Plug 'sheerun/vim-polyglot'
  Plug 'powerman/vim-plugin-AnsiEsc'
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx', { 'for': 'javascript' }
  Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
  Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
  Plug 'ianks/vim-tsx'

  " Search
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'mhinz/vim-grepper'
  Plug 'ludovicchabant/vim-gutentags'
  Plug 'majutsushi/tagbar'
  Plug 'brooth/far.vim'
 
  " Autocomplete
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'pbogut/deoplete-elm'
  Plug 'fishbullet/deoplete-ruby'
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'ervandew/supertab'
  Plug 'mhartington/nvim-typescript', {'for': ['typescript', 'tsx'], 'do': './install.sh' }
  Plug 'mhartington/deoplete-typescript', { 'do': 'npm install -g typescript', 'for': 'typescript' }

  " Colors
  Plug 'chriskempson/base16-vim'
  Plug 'jnurmine/Zenburn'

  " Vim
  Plug 'embear/vim-localvimrc'

  " Collaboration
  " Plug 'typeintandem/nvim'

  " DB
  Plug 'tpope/vim-dadbod'
  Plug 'kristijanhusak/vim-dadbod-completion'
  Plug 'kristijanhusak/vim-dadbod-ui'
call plug#end()

source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/general.vim
source $HOME/.config/nvim/keys.vim
source $HOME/.config/nvim/statusline.vim
source $HOME/.config/nvim/functions.vim

" Change diff signs
" This has to be after the general.vim loading since loading the colorscheme
" overwrites this... however I can't add it to the plugins.vim file and load
" that after the general.vim because the neomake autocommands for the colors
" need to be defined before loading the colorscheme :D cool, eh?

highlight DiffAdd           cterm=bold ctermbg=none ctermfg=2
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=1
highlight DiffChange        cterm=bold ctermbg=none ctermfg=4

highlight SignifySignAdd    cterm=bold ctermbg=none ctermfg=2
highlight SignifySignDelete cterm=bold ctermbg=none ctermfg=1
highlight SignifySignChange cterm=bold ctermbg=none ctermfg=4



