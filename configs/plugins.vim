call plug#begin('~/.config/nvim/plugged')
if has('nvim-0.5')
    Plug 'neovim/nvim-lspconfig'  " collection of configurations for built-in LSP client
    Plug 'hrsh7th/cmp-nvim-lsp'  " LSP source for nvim-cmp
    Plug 'hrsh7th/cmp-buffer'  " nvim-cmp source for buffer words
    Plug 'hrsh7th/nvim-cmp'  " auto-completion plugin
    Plug 'ray-x/lsp_signature.nvim'  " lsp signature hints
    Plug 'nathanmsmith/nvim-ale-diagnostic'  " display nvim-lsp diagnostics in ALE
else
    Plug 'noahfrederick/vim-neovim-defaults'  " nvim defaults for vim
endif
Plug 'scrooloose/nerdtree'  " show file tree explorer
Plug 'Xuyuanp/nerdtree-git-plugin'  " show git status flags with NERDTree
Plug 'preservim/nerdcommenter'  " comment text
Plug 'airblade/vim-gitgutter'  " show git diff markers in the sign column
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }  " fuzzy finder (fzf)
Plug 'junegunn/fzf.vim'  " fzf plugin
Plug 'mileszs/ack.vim'  " ack plugin
Plug 'sheerun/vim-polyglot'  " collection of language packs for Vim
Plug 'dense-analysis/ale'  " asynchronous linting
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }  " markdown preview plugin
Plug 'Yggdroot/indentLine'  " display the indention levels with thin vertical lines
Plug 'majutsushi/tagbar'  " displays tags in a window
Plug 'mbbill/undotree'  " undo history visualizer
Plug 'ryanoasis/vim-devicons'  " filetype icons for Vim plugins
Plug 'christoomey/vim-tmux-navigator'  " navigate between tmux panes and vim splits
Plug 'vim-scripts/restore_view.vim'  " restore previous view (cursor and folds)
Plug 'vim-airline/vim-airline'  " status line
Plug 'jiangmiao/auto-pairs'  " insert or delete brackets, parens, quotes in pair
Plug 'bluz71/vim-nightfly-guicolors'  " nightfly colorscheme
call plug#end()
