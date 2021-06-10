" init Vim-Plug
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdcommenter' " comment related inserts plugin

Plug 'qpkorr/vim-bufkill' " bud/bd/bw without closing window plugin

Plug 'pangloss/vim-javascript' " more advanced syntax highlighting for javascript

Plug 'mxw/vim-jsx' " JSX syntax highlighting

Plug 'tpope/vim-unimpaired' " map [q ]q, etc to quickfix related iterations (and more)

Plug 'kchmck/vim-coffee-script' " coffescript syntax highlighting

Plug 'tpope/vim-fugitive' " git wrapper for vim

Plug 'tpope/vim-rhubarb' " fugitive extension for web actions (ie Gbrowse)

Plug 'tpope/vim-surround' " surround selection blocks

Plug 'rizzatti/dash.vim' " Dash API documentation lookup

Plug 'kana/vim-textobj-user' " custom text objecs (required for vim-textobj-rubyblock plugin)

Plug 'nelstrom/vim-textobj-rubyblock' " add ruby block selections (ir/ar)

" TODO: look to use vim-plug (as it supports using local install at `/usr/local/opt/fzf` fzf instead of cloning whole project)
Plug 'junegunn/fzf' " Baseline fzf plugin (still required for vim)

Plug 'junegunn/fzf.vim' " FZF integration plugin

Plug 'tomlion/vim-solidity' " solidity syntax highlighting

Plug 'elixir-editors/vim-elixir' " syntax highlighting for elixir

Plug 'slashmili/alchemist.vim'

" gui focused plugins
Plug 'bling/vim-airline' " airline for visual goodness

Plug 'bling/vim-bufferline' " bufferline for airline

" Initialize plugin system
call plug#end()
