if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()

Plug 'tpope/vim-fugitive' " :G
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-commentary' " gc to comment selection, gcc to comment line
Plug 'tpope/vim-surround' " cs{current}{new} to change, ds{c}{n} to delete, cst (for tags)
Plug 'tpope/vim-repeat'
Plug 'FooSoft/vim-argwrap' " leader -a to wrap/unwrap args
Plug 'mg979/vim-visual-multi', {'branch': 'master'} " ctrl-n to select, tab to toggle cursor/extended mode

if has("nvim")
  function! InstallLSPDependencies(info)
    " info is a dictionary with 3 fields
    " - name:   name of the plugin
    " - status: 'installed', 'updated', or 'unchanged'
    " - force:  set on PlugInstall! or PlugUpdate!
    if a:info.status == 'installed' || a:info.force
      !npm install -g diagnostic-languageserver
      !npm install -g neovim
      !npm install -g tree-sitter-cli
      !npm install -g typescript
      !npm install -g typescript-language-server
      !gem install neovim
      !gem install solargraph
      !pip install neovim
    endif
  endfunction

  Plug 'hoob3rt/lualine.nvim'
  Plug 'kristijanhusak/defx-git'
  Plug 'kristijanhusak/defx-icons'
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'neovim/nvim-lspconfig'
  Plug 'glepnir/lspsaga.nvim'
  Plug 'folke/lsp-colors.nvim'
  Plug 'nvim-lua/completion-nvim'
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim', { 'do': function('InstallLSPDependencies') }
endif

Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'npxbr/glow.nvim', {'do': ':GlowInstall'}

call plug#end()
