set exrc " Wont open project .nvimrc without this here

if has('win32') || has('win64')
  let g:config_home = '~/AppData/Local/nvim'
else
  let g:config_home = '~/.config/nvim'
endif
call plug#begin(g:config_home . '/plugged')

" Yes, I am a sneaky snek now
Plug 'ambv/black'

Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'dense-analysis/ale' " javascript async linter
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
" Plug 'tweekmonster/gofmt.vim'
Plug 'ap/vim-css-color'
" Plug 'ledger/vim-ledger'
" Plug 'mileszs/ack.vim'
" Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
	" gc, gcc, etc.  autocmd FileType apache setlocal commentstring=#\ %s
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
	" cs'] 'Hello' [Hello]
	" ysiw] Hello [Hello]
	" yss<p id="machine"> surrounds the line with the p tag
	" yss{ surrounds line with {}
Plug 'tpope/vim-surround'

" Plug 'vim-utils/vim-man'
Plug 'vim-scripts/openvpn'
Plug 'wellle/targets.vim'
Plug 'mbbill/undotree'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

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

Plug 'hoob3rt/lualine.nvim'

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

" All baseline remaps and abbrevs and sets
source ~/.vimrc

" Select and use first in coc autocomplete list
inoremap <silent><expr> <C-space> pumvisible() ? coc#_select_confirm()
			\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
nmap gd <Plug>(coc-definition)
nmap gr <Plug>(coc-references)
nnoremap <C-p> :GFiles<CR>

nmap <leader>gs :G<CR>

" put these in here to keep them out of VsVim
set hlsearch                     " Pair this with the <Esc> :noh<Esc> remap
nnoremap <Leader>/ :let @/='\<<C-r><C-w>\>'<CR>:set hlsearch<CR>
vnoremap <Leader>/ "zy:let @/='\V<C-R>=escape(@z,'/\[]')<CR>'<CR>:set hlsearch<CR>

" show search results in a different buffer
command! -nargs=? Filter let @z='' | execute 'g/<args>/y A' | new | setlocal bt=nofile | put! z
" nnoremap <silent> <F3> :Filter()<CR>
nnoremap <silent> <F3> qzq:g//y Z<CR>:new<CR>:put! z<CR>

" n is always forward, N is always back
nnoremap <expr> k 'Nn'[v:searchforward].'zzzv'
nnoremap <expr> K 'nN'[v:searchforward].'zzzv'
