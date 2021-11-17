set exrc " Wont open project .nvimrc without this here

if has('win32') || has('win64')
  let g:config_home = '~/AppData/Local/nvim'
  nnoremap <silent> <C-f> <Nop>
else
  let g:config_home = '~/.config/nvim'
  nnoremap <silent> <C-f> :silent !tmux neww tmux-sessionizer<CR>
endif

call plug#begin(g:config_home . '/plugged')

" Before LSP
" Plug 'davidhalter/jedi-vim', { 'for': 'python' }
" Plug 'dense-analysis/ale' " javascript async linter
" Plug 'rust-lang/rust.vim', { 'for': 'rust' }
" Plug 'tweekmonster/gofmt.vim'
" Plug 'ledger/vim-ledger'
" Plug 'mileszs/ack.vim'
" Plug 'sheerun/vim-polyglot'
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
" Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" LSP plugins
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
" lspsaga: I think this exposes lsp functions?
Plug 'glepnir/lspsaga.nvim'
" symbols-outline: file outline using LSP
Plug 'simrat39/symbols-outline.nvim'
" " Snippets
" Plug 'mattn/emmet-vim'
" Plug 'L3MON4D3/LuaSnip'
" Plug 'rafamadriz/friendly-snippets'

" " Debugger Plugins
" Plug 'mfussenegger/nvim-dap'
" Plug 'Pocco81/DAPInstall.nvim'
" Plug 'szw/vim-maximizer'

" Formatters
Plug 'rust-lang/rust.vim'
Plug 'darrikonn/vim-gofmt'
Plug 'tpope/vim-projectionist'
Plug 'tomlion/vim-solidity'
Plug 'ap/vim-css-color'
" ambv/black: python formatter
Plug 'ambv/black'

" Neovim Tree sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" popup: Expose popup behavior for other plugins
Plug 'nvim-lua/popup.nvim'
" plenary: Expose common lua functions for other plugins
Plug 'nvim-lua/plenary.nvim'
"  ThePrimeagen/harpoon
Plug 'ThePrimeagen/harpoon'
" telescope: fzf replacement
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
" ripgrep: Rust implementation of grep
Plug 'BurntSushi/ripgrep'
Plug 'kyazdani42/nvim-web-devicons'

" firenvim: nvim in browser
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
au BufEnter github.com_*.txt set filetype=markdown
au BufEnter trello.com_*.txt set filetype=markdown

" vim-fugitive: Git from within vim
Plug 'tpope/vim-fugitive'
" gv: git tree view visualizer
Plug 'junegunn/gv.vim'
" " vim-rhubarb: github navigation
" Plug 'tpope/vim-rhubarb'

" vim-endwise: additional movement targets
Plug 'tpope/vim-endwise'
" vim-eunuch: UNIX commands from vim
Plug 'tpope/vim-eunuch'
	" gc, gcc, etc.  autocmd FileType apache setlocal commentstring=#\ %s
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
	" cs'] 'Hello' [Hello]
	" ysiw] Hello [Hello]
	" yss<p id="machine"> surrounds the line with the p tag
	" yss{ surrounds line with {}
Plug 'tpope/vim-surround'
Plug 'wellle/targets.vim'
Plug 'mbbill/undotree'

Plug 'vim-scripts/openvpn'
Plug 'theprimeagen/vim-be-good'

"  I AM SO SORRY FOR DOING COLOR SCHEMES IN MY VIMRC, BUT I HAVE
"  TOOOOOOOOOOOOO

Plug 'gruvbox-community/gruvbox'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'colepeters/spacemacs-theme.vim'
Plug 'sainnhe/gruvbox-material'
Plug 'phanviet/vim-monokai-pro'
Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'
Plug 'dracula/vim', { 'as': 'dracula' }

" lualine: status line
Plug 'hoob3rt/lualine.nvim'

call plug#end()

colorscheme gruvbox

let g:python_recommended_style = 0
let g:vim_be_good_log_file = 1
let g:vim_apm_log = 1

if executable('rg')
	let g:rg_derive_root='true'
endif

" All baseline remaps and abbrevs and sets
source ~/.vimrc

" " Lua snip stuff
" imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
" inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>
" snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
" snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>
" imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
" smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'

" " Select and use first in coc autocomplete list
" inoremap <silent><expr> <C-space> pumvisible() ? coc#_select_confirm()
" 			\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

command! EditInitVim call EditInitVim()

nmap <leader>gs :G<CR>

" put these in here to keep them out of VsVim
set hlsearch                     " Pair this with the <Esc> :noh<Esc> remap
nnoremap <silent><Leader>/ :let @/='\<<C-r><C-w>\>'<CR>:let @"=@0<CR>:set hlsearch<CR>
vnoremap <silent><Leader>/ "zy:let @/='\V<C-R>=escape(@z,'/\[]')<CR>'<CR>:let @"=@0<CR>:set hlsearch<CR>

" show search results in a different buffer
command! -nargs=? Filter let @z='' | execute 'g/<args>/y Z' | new | setlocal bt=nofile | put! z
nnoremap <silent> <F3> qzq:g//y Z<CR>:new<CR>:put! z<CR>
let g:maximizer_default_mapping_key = '<F12>'

" n is always forward, N is always back
noremap <expr> k 'Nn'[v:searchforward].'zzzv'
noremap <expr> K 'nN'[v:searchforward].'zzzv'
onoremap <expr> k 'Nn'[v:searchforward]
onoremap <expr> K 'nN'[v:searchforward]
