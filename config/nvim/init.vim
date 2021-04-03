set exrc " Wont open project .nvimrc without this here

call plug#begin('~\AppData\Local\nvim\plugged')

" Yes, I am a sneaky snek now
Plug 'ambv/black'

Plug 'dense-analysis/ale' " javascript async linter
Plug 'rust-lang/rust.vim'
" Plug 'tweekmonster/gofmt.vim'
Plug 'ap/vim-css-color'
" Plug 'ledger/vim-ledger'
" Plug 'mileszs/ack.vim'
" Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'

Plug 'tpope/vim-telescope'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
	" cs'] 'Hello' [Hello]
	" ysiw] Hello [Hello]
	" yss<p id="machine"> surrounds the line with the p tag
	" yss{ surrounds line with {}
Plug 'tpope/vim-surround'
	" gc, gcc, etc.  autocmd FileType apache setlocal commentstring=#\ %s
Plug 'vim-utils/vim-man'
Plug 'vim-scripts/openvpn'
Plug 'wellle/targets.vim'
Plug 'mbbill/undotree'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'junegunn/fzf.vim'

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

" Cheat Sheet
" Plug 'dbeniamine/cheat.sh-vim'

call plug#end()

colorscheme gruvbox

let g:python_recommended_style = 0
let g:vim_be_good_log_file = 1
let g:vim_apm_log = 1

if executable('rg')
	let g:rg_derive_root='true'
endif

" Select and use first in coc autocomplete list
inoremap <silent><expr> <C-space> pumvisible() ? coc#_select_confirm()
			\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" n is always forward, N is always back
nnoremap <expr> n 'Nn'[v:searchforward]
nnoremap <expr> N 'nN'[v:searchforward]

" All baseline remaps and abbrevs and sets
source ~/.vimrc
