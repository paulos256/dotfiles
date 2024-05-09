let g:colemak=0

set guicursor=n-v:block,i-c-ci-ve:ver25,o:hor50,a:blinkoff0-Cursor/lCursor
"  \,r-cr:block-blinkwait100-blinkoff100-blinkon100
set hidden  " ALLOW dirty background buffers
set noerrorbells
set timeoutlen=700
set visualbell
set nowrap
set formatoptions+=1qjro

set clipboard=

set tabstop=3 softtabstop=0 shiftwidth=0
set shiftround                   " Shift to certain columns, not just n spaces
set noexpandtab                  " Use tabs
set autoindent smartindent
set backspace=indent,eol,start   " Allow backspace beyond insertion point
set cindent                      " Automatic program indenting
set copyindent                   " Make autoindent use the same chars as prev line
set cinkeys-=0#                  " Comments don't fiddle with indenting
set linebreak                    " Break long lines by word, not char
set nostartofline

set nu
set relativenumber
set hlsearch

set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

set inccommand=nosplit
set incsearch
set ignorecase
set smartcase
set gdefault                " use the search option 'g' by default
silent! set mouse=nvc       " Use the mouse, but not in insert mode
set termguicolors
set scrolloff=8
set list
set listchars=tab:\|\ ,extends:~,precedes:\^,trail:-
set signcolumn=yes
set isfname+=@-@
set encoding=utf8           " UTF-8 by default

" Autocomplete stuff
set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

set foldcolumn=1
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=100

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
set spelllang=en_us

set colorcolumn=   " this is set to toggle with insert mode

if !g:actual_neovim
	let mapleader = " "
	let maplocalleader = " "
endif

" Marks should go to the column, not just the line. Why isn't this the default?
nnoremap ' `

" Don't need the line break at the end
vnoremap $ $<Left>
inoremap <C-BS> <C-w>

nnoremap x "_x
nnoremap X "_X

" Quick search
nnoremap <silent><Leader>/ :let @/='\<<C-r><C-w>\>'<CR>:let @"=@0<CR>:set hlsearch<CR>
if g:actual_neovim
	" Escape slashes and square brackets
	vnoremap <silent><Leader>/ "zy:let @/='\V<C-R>=escape(@z,'/\[]')<CR>'<CR>:let @"=@0<CR>:set hlsearch<CR>
else
	" Take my chances with slashes and square brackets
	vnoremap <Leader>/ "zy:let @/=@z<CR>:set hlsearch<CR>
endif

" Quick replace
nnoremap <silent><Leader>sr :%s/\<<C-r><C-w>\>//I<Left><Left>
if g:actual_neovim
	" Escape slashes and square brackets
	vnoremap <silent><Leader>sr "zy:%s/\V<C-R>=escape(@z,'/\[]')<CR>//I<Left><Left><Space><BS>
else
	" Take my chances with slashes and square brackets
	vnoremap <Leader>sr "zy:let @/=@z:%s///I<Left><Left>
endif

" Tabs
nnoremap <C-Tab> gt
nnoremap <C-S-Tab> gT

nnoremap <Leader>wt :wincmd T<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>QQ :bd!<CR>:q<CR>

" got sick of accidentally hitting these
nnoremap U <Nop>
nnoremap <silent> Q <Nop>
nnoremap <S-r> <nop>
" nnoremap <C-p> <nop>

" Undo-queue breaks
inoremap <Enter> <Enter><C-G>u
inoremap . .<C-G>u
inoremap , ,<C-G>u
inoremap ; ;<C-G>u
" inoremap ! !<C-G>u
" inoremap ) )<C-G>u
" inoremap } }<C-G>u

nnoremap <Leader>cd. <cmd>cd %:p:h<CR>

noremap <C-s> <cmd>w<cr><esc>
noremap <C-S-s> <cmd>wa<cr><esc>
nnoremap <silent> <Esc> :noh<Esc>

if g:colemak
	" f-back and forward
	noremap h ,
	noremap , ;
	noremap gh g;
	noremap g, g,
	" home row movement
	noremap n gj
	noremap e gk
	vnoremap n j
	vnoremap e k
	" dn, Ve
	onoremap n j
	onoremap e k
	noremap m h
	noremap i l
	" bottom (H M L)
	noremap E L
	" end of word
	noremap j e
	" combine lines (stay centered)
	noremap N mzJ`z
	" next/prev match
	noremap k n
	noremap K N
	" onoremap k n
	" onoremap K N
	noremap gk gn
	noremap gK gN
	" new line
	noremap l o
	noremap L O
	" insert and 'inside' motion
	noremap o i
	noremap O I
	" mark
	noremap ; m
else
	noremap j gj
	noremap k gk
	vnoremap j j
	vnoremap k k

	" combine lines (stay centered)
	noremap J mzJ`z

	" more convenient 'inside' motion for yank on a colemak keyboard
	noremap yo yi

	noremap E ge
	noremap ge E
endif

" Move up or down a line at a time
nnoremap <A-Down> <cmd>m .+1<CR>
nnoremap <A-Up> <cmd>m .-2<CR>
inoremap <A-Down> <cmd>m .+1<CR>gi
inoremap <A-Up> <cmd>m .-2<CR>gi
vnoremap <A-Down> <cmd>m '>+1<CR>gv
vnoremap <A-Up> <cmd>m '<-2<CR>gv
" Lazy colemak remaps
if g:colemak
	nnoremap <A-n> <cmd>m .+1<CR>
	nnoremap <A-e> <cmd>m .-2<CR>
	inoremap <A-n> <cmd>m .+1<CR>gi
	inoremap <A-e> <cmd>m .-2<CR>gi
	vnoremap <A-n> <cmd>m '>+1<CR>gv
	vnoremap <A-e> <cmd>m '<-2<CR>gv
else
	nnoremap <A-j> <cmd>m .+1<CR>
	nnoremap <A-k> <cmd>m .-2<CR>
	inoremap <A-j> <cmd>m .+1<CR>gi
	inoremap <A-k> <cmd>m .-2<CR>gi
	vnoremap <A-j> <cmd>m '>+1<CR>gv
	vnoremap <A-k> <cmd>m '<-2<CR>gv
endif

" " Scroll the whole page up or down one line
" noremap <C-Up> <C-e>
" noremap <C-Down> <C-y>

nnoremap <C-Left> <C-w>h
nnoremap <C-Down> <C-w>j
nnoremap <C-Up> <C-w>k
nnoremap <C-Right> <C-w>l
tnoremap <C-Left> <cmd>wincmd h<cr>
tnoremap <C-Down> <cmd>wincmd j<cr>
tnoremap <C-Up> <cmd>wincmd k<cr>
tnoremap <C-Right> <cmd>wincmd l<cr>
" Lazy colemak remaps
if g:colemak
	nnoremap <C-m> <C-w>h
	nnoremap <C-n> <C-w>j
	nnoremap <C-e> <C-w>k
	nnoremap <C-i> <C-w>l
	tnoremap <C-m> <cmd>wincmd h<cr>
	tnoremap <C-n> <cmd>wincmd j<cr>
	tnoremap <C-e> <cmd>wincmd k<cr>
	tnoremap <C-i> <cmd>wincmd l<cr>
else
	nnoremap <C-h> <C-w>h
	nnoremap <C-j> <C-w>j
	nnoremap <C-k> <C-w>k
	nnoremap <C-l> <C-w>l
	tnoremap <C-h> <cmd>wincmd h<cr>
	tnoremap <C-j> <cmd>wincmd j<cr>
	tnoremap <C-k> <cmd>wincmd k<cr>
	tnoremap <C-l> <cmd>wincmd l<cr>
endif

" Resize window using <ctrl + shift + arrow keys
nnoremap <C-S-Up> <cmd>resize +2<CR>
nnoremap <C-S-Down> <cmd>resize -2<CR>
nnoremap <C-S-Left> <cmd>vertical resize -2<CR>
nnoremap <C-S-Right> <cmd>vertical resize +2<CR>

vnoremap < <gv
vnoremap > >gv

nnoremap <Leader>us :setlocal spell!<CR> " Toggle spelling hints
nnoremap <Leader>uw :setlocal wrap!<CR>  " Toggle word wrap

" Greatest remap ever
if g:actual_neovim
	vnoremap p P
	vnoremap P p
else
	vnoremap p "_dP
	vnoremap P p
endif

" Paste from clipboard
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
vnoremap <Leader>p "+p
vnoremap <Leader>P "+P

" Yank to clipboard : asbjornHaland
nnoremap <Leader>d "+d
vnoremap <Leader>d "+d
nnoremap <Leader>y "+y
vnoremap <Leader>y "+y
nnoremap Y y$
nnoremap <Leader>Y "+y$

fun! EditInitVim()
	:tabnew $MYVIMRC
	:new ~/.vimrc
endfunction

fun! ClearRegisters()
	let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
	for r in regs
		call setreg(r, [])
	endfor
endfun

fun! TrimWhitespace()
	let l:save = winsaveview()
	keeppatterns %s/\s\+$//e
	call winrestview(l:save)
endfun

" Close all buffers except this one
command! BufCloseOthers %bd|e#

" by xolox @ https://stackoverflow.com/a/6271254
fun! s:get_visual_selection()
	" Why is this not a built-in Vim script function?!
	let [line_start, column_start] = getpos("'<")[1:2]
	let [line_end, column_end] = getpos("'>")[1:2]
	let lines = getline(line_start, line_end)
	if len(lines) == 0
		return ''
	endif
	let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
	let lines[0] = lines[0][column_start - 1:]
	return join(lines, "\n")
endfunction

" Custom mode for distraction-free editing
function! ProseMode()
	call goyo#execute(0, [])
	set spell noci nosi noai nolist noshowmode noshowcmd
	set complete+=s
endfunction

" ES
command! W w

" More space with NERDTree
let g:NERDTreeMinimalUI = 1
let g:NERDTreeMarkBookmarks = 0
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeStatusLine = -1

" Tell ack.vim to use ripgrep instead
let g:ackprg = 'rg --vimgrep --no-heading'

augroup mm_buf_cmds
	autocmd!
	" Color Column (only on insert)
	autocmd!
	if exists ("&colorcolumn")
		autocmd InsertEnter * set colorcolumn=81
		autocmd InsertLeave * set colorcolumn=""
	endif

" 	" Sets the current directory to the opened file
" 	autocmd BufEnter * silent! lcd %:p:h
augroup END


" VsVim can't do expressions, so set g:actual_neovim before calling "source .vimrc" from within init.lua
if g:actual_neovim
	if g:colemak
		nnoremap <expr> k 'Nn'[v:searchforward].'zzzv'
		onoremap <expr> k 'Nn'[v:searchforward]
		xnoremap <expr> k 'Nn'[v:searchforward]
		nnoremap <expr> K 'nN'[v:searchforward].'zzzv'
		onoremap <expr> K 'nN'[v:searchforward]
		xnoremap <expr> K 'nN'[v:searchforward]
	else
		nnoremap <expr> n 'Nn'[v:searchforward].'zzzv'
		onoremap <expr> n 'Nn'[v:searchforward]
		xnoremap <expr> n 'Nn'[v:searchforward]
		nnoremap <expr> N 'nN'[v:searchforward].'zzzv'
		onoremap <expr> N 'nN'[v:searchforward]
		xnoremap <expr> N 'nN'[v:searchforward]
	endif

	" " Consistent navigation with word wrap
	" nnoremap <Up> g<Up>
	" nnoremap <Down> g<Down>
	" vnoremap <Down> <Down>
	" vnoremap <Up> <Up>

	" Temporarily disable arrow keys to get used to non-colemak navigation
	noremap <Up> <nop>
	noremap <Down> <nop>
	noremap <Left> <nop>
	noremap <Right> <nop>

	" Arrow keys exit insert mode
	inoremap <Up> <ESC><Up>
	inoremap <Down> <ESC><Down>
	inoremap <Left> <ESC><Left>
	inoremap <Right> <ESC><Right>

	" Nice menu when typing `:find *.py`
	set wildmode=longest,list,full
	set wildmenu
	" Ignore files
	set wildignore+=*.pyc
	set wildignore+=*_build/*
	set wildignore+=**/coverage/*
	set wildignore+=**/node_modules/*
	set wildignore+=**/android/*
	set wildignore+=**/ios/*
	set wildignore+=**/.git/*

	cd ~
else
	" VsVim
	set notimeout

	nnoremap s /
	nnoremap S /

	" These are super handy in mini.ai, so add them to VsVim
	vnoremap ie iw
	onoremap ie iw

	augroup vimrc_filetypes
		autocmd!

		au BufNewFile,BufRead *.cson    set ft=coffee
		au BufNewFile,BufRead *.glsl    setf glsl
		au BufNewFile,BufRead *.gyp     set ft=python
		au BufNewFile,BufRead *.html    setlocal nocindent smartindent
		au BufNewFile,BufRead *.i7x     setf inform7
		au BufNewFile,BufRead *.ini     setf conf
		au BufNewFile,BufRead *.journal setlocal tw=0 ts=4 sw=4 et
		au BufNewFile,BufRead *.json    set ft=json tw=0
		au BufNewFile,BufRead *.less    setlocal ft=less nocindent smartindent
		au BufNewFile,BufRead *.lkml    setf yaml
		au BufNewFile,BufRead *.md      setlocal ft=markdown nolist spell
		au BufNewFile,BufRead *.md,*.markdown setlocal foldlevel=999 tw=0 nocin
		au BufNewFile,BufRead *.ni,*.i7x      setlocal ft=inform7 fdm=manual nolist ts=2 sw=2 noet spell
		au BufNewFile,BufRead *.plist   setf xml
		au BufNewFile,BufRead *.rb      setlocal noai
		au BufNewFile,BufRead *.rxml    setf ruby
		au BufNewFile,BufRead *.sass    setf sass
		au BufNewFile,BufRead *.ttml    setf xml
		au BufNewFile,BufRead *.vert,*.frag set ft=glsl
		au BufNewFile,BufRead *.xml     setlocal ft=xml ts=2 sw=2 et
		au BufNewFile,BufRead *.zone    setlocal nolist ts=4 sw=4 noet
		au BufNewFile,BufRead *.zsh     setf zsh
		au BufNewFile,BufRead *.ovpn    setf openvpn
		au BufNewFile,BufRead *templates/*.html setf htmldjango
		au BufNewFile,BufRead .conkyrc set ft=lua
		au BufNewFile,BufRead .git/config setlocal ft=gitconfig nolist ts=4 sw=4 noet
		au BufNewFile,BufRead .gitconfig* setlocal ft=gitconfig nolist ts=4 sw=4 noet
		au BufNewFile,BufRead .vimlocal,.gvimlocal setf vim
		au BufNewFile,BufRead .zshlocal setf zsh
		au BufNewFile,BufRead /tmp/crontab* setf crontab
		au BufNewFile,BufRead COMMIT_EDITMSG setlocal nolist nonumber
		au BufNewFile,BufRead Makefile setlocal nolist

		autocmd FileType netrw setl bufhidden=delete " automatically kill phantom buffers created by netrw - https://github.com/tpope/vim-vinegar/issues/13
		au FileType gitcommit setlocal nolist ts=4 sts=4 sw=4 noet
		au FileType inform7 setlocal nolist tw=0 ts=4 sw=4 noet foldlevel=999
		au FileType json setlocal conceallevel=0 foldmethod=syntax foldlevel=999
		au FileType make setlocal nolist ts=4 sts=4 sw=4 noet
		au FileType markdown syn sync fromstart
		au FileType markdown setlocal wrap
		au Filetype gitcommit setlocal tw=80
		au Filetype csv setlocal nocursorline
	augroup END

	" cd ~
endif
