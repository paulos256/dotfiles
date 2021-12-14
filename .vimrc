" hello front end masters
set path+=**

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

set guicursor=n-v:block,i-c-ci-ve:ver25,o:hor50,a:blinkoff0-Cursor/lCursor
"  \,r-cr:block-blinkwait100-blinkoff100-blinkon100
set hidden  " allow dirty background buffers
set noerrorbells
set notimeout
set visualbell
set nowrap
set formatoptions+=1qjro

set tabstop=4 softtabstop=4
set shiftwidth=4
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
set nohlsearch

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
set lazyredraw
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

let loaded_matchparen = 1
let mapleader = " "
let maplocalleader = " "

" Marks should go to the column, not just the line. Why isn't this the default?
nnoremap ' `

" Quickly fix spelling errors choosing the first result
nnoremap <Leader>z z=1<CR><CR>

" Fix annoyances in the QuickFix window, like scrolling too much
autocmd FileType qf setlocal number nolist
autocmd Filetype qf wincmd J " Makes sure it's at the bottom of the vim window

let g:using_colemak=1
if g:using_colemak
	" f-back and forward
	noremap h ,
	noremap , ;
	noremap gh g;
	noremap g, g,
	" home row movement
	noremap n gj
	noremap e gk
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
	" insert
	noremap o i
	noremap O I
	" mark
	noremap ; m
else
	noremap j gj
	noremap k gk
	" dn, Ve
	onoremap n j
	onoremap e k
	vnoremap n j
	vnoremap e k
	" yow, cow, dow, etc.
	onoremap o i
	vnoremap o i
	" combine lines (stay centered)
	noremap J mzJ`z
endif

inoremap <C-BS> <C-w>

" Windows
if g:using_colemak
	nnoremap <Leader>m :wincmd h<CR>
	nnoremap <Leader>n :wincmd j<CR>
	nnoremap <Leader>e :wincmd k<CR>
	nnoremap <Leader>i :wincmd l<CR>
endif
nnoremap <Leader><Left> :wincmd h<CR>
nnoremap <Leader><Down> :wincmd j<CR>
nnoremap <Leader><Up> :wincmd k<CR>
nnoremap <Leader><Right> :wincmd l<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>QQ :q!<CR>
nnoremap <Leader>wt :wincmd T<CR>

" Tabs
nnoremap <C-Tab> gt
nnoremap <C-S-Tab> gT

nnoremap <C-S-Left> :bp<CR>
nnoremap <C-S-Right> :bn<CR>

" Scroll the whole page up or down one line
noremap <C-Up> <C-e>
noremap <C-Down> <C-y>

nnoremap <A-S-n> :lnext<CR>
nnoremap <A-S-e> :lprev<CR>
nnoremap <A-n> :cnext<CR>
nnoremap <A-e> :cprev<CR>
nnoremap <Leader>" :call ToggleQFList(0)<CR>
nnoremap <Leader>' :call ToggleQFList(1)<CR>

" Move up or down a line at a time
vnoremap <A-Up> :m '>+1<CR>gv=gv
vnoremap <A-Down> :m '<-2<CR>gv=gv
nnoremap <A-Up> :m .-2<CR>==
nnoremap <A-Down> :m .+1<CR>==

nnoremap <silent> <Esc> :noh<Esc>

nnoremap <C-Left> <<
nnoremap <C-Right> >>
vnoremap <C-Left> <gv
vnoremap <C-Right> >gv
vnoremap < <gv
vnoremap > >gv

" got sick of accidentally hitting these
nnoremap U <Nop>
nnoremap <silent> Q <Nop>
nnoremap <S-r> <nop>
" nnoremap <C-p> <nop>

let g:the_primeagen_qf_g = 0
let g:the_primeagen_qf_l = 0

fun! ToggleQFList(global)
	if a:global
		if g:the_primeagen_qf_g == 1
			let g:the_primeagen_qf_g = 0
			cclose
		else
			let g:the_primeagen_qf_g = 1
			copen
		endif
	else
		if g:the_primeagen_qf_l == 1
			let g:the_primeagen_qf_l = 0
			lclose
		else
			let g:the_primeagen_qf_l = 1
			lopen
		endif
	endif
endfun

" Help and windows and Sex!
let g:netrw_banner = 1
let g:netrw_liststyle = 1
let g:netrw_browse_split = 3
let g:netrw_winsize = 25

" Help and windows
" nnoremap <leader>dir :Sex!<CR>
nnoremap <leader>dir :Telescope file_browser<CR>
nnoremap <Leader>cd :cd %:p:h<CR>
nnoremap <leader>vwh :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <Leader><CR> :so $MYVIMRC<CR>:call ColorMyPencils()<CR>

nnoremap <Leader>- :vertical resize +5<CR>
nnoremap <Leader>_ :vertical resize -5<CR>
nnoremap <Leader>= :resize +2<CR>
nnoremap <Leader>+ :resize -2<CR>
nnoremap <Leader>rp :resize 100<CR>

" greatest remap ever
vnoremap p "_dP

" next greatest remap ever : asbjornHaland
nnoremap <Leader>y "+y
vnoremap <Leader>y "+y
nnoremap <Leader>Y gg"+yG
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
vnoremap <Leader>p "+p
vnoremap <Leader>P "+P

nnoremap Y y$
nnoremap s "_d
nnoremap S "_D
nnoremap x "_x
nnoremap X "_X

nnoremap <Leader>s :%s/\<<C-r><C-w>\>//I<Left><Left>
vnoremap <Leader>s "zy:%s/\V<C-R>=escape(@z,'/\[]')<CR>//I<Left><Left>
nnoremap <Leader>/ :let @/='\<<C-r><C-w>\>'<CR>:let @"=@0<CR>
vnoremap <Leader>/ "zy:let @/='\V<C-R>=escape(@z,'/\[]')<CR>'<CR>:let @"=@0<CR>
nnoremap <Leader>vim :vim // **<Left><Left><Left><Left>

" Toggle spelling hints
nnoremap <Leader>ts :set spell!<CR>
nnoremap <Leader>wrap :setlocal wrap!<CR>

iabbrev teh the
iabbrev adn and
iabbrev wehn when
iabbrev tehn then
iabbrev Pual Paul

" " Undo-queue breaks
" inoremap ! !<C-G>u
" inoremap . .<C-G>u
" inoremap , ,<C-G>u
" inoremap ; ;<C-G>u
" inoremap ) )<C-G>u
" inoremap } }<C-G>u

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

" " Stay on the same line when window switching
" fun! KeepCurrentLine(motion)
"   let theLine = line('.')
"   let theCol = col('.')
"   exec 'wincmd ' . a:motion
"   if &diff
"     call cursor(theLine, theCol)
"   endif
" endfunction
" nnoremap <C-w>m :silent call KeepCurrentLine('m')<CR>
" nnoremap <C-w>i :silent call KeepCurrentLine('l')<CR>

" Commands to send common keystrokes using tmux
let g:tmux_console_pane = '0:0.0'
let g:tmux_server_pane = '0:0.0'
fun! TmuxPaneRepeat()
  write
  silent execute ':!tmux send-keys -t' g:tmux_console_pane 'C-p' 'C-j'
  redraw!
endfunction
fun! TmuxPaneClear()
  silent execute ':!tmux send-keys -t' g:tmux_server_pane 'C-j' 'C-j' 'C-j' 'C-j' 'C-j' 'C-j' 'C-j'
  redraw!
endfunction

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

augroup mm_buf_cmds
	autocmd!
	" Color Column (only on insert)
	autocmd!
	if exists ("&colorcolumn")
		autocmd InsertEnter * set colorcolumn=81
		autocmd InsertLeave * set colorcolumn=""
	endif

	" autocmd CursorMoved * if (expand('<cWORD>') =~ @/) | set hlsearch | else | set nohlsearch | endif

	" automatically kill phantom buffers created by netrw - https://github.com/tpope/vim-vinegar/issues/13
	autocmd FileType netrw setl bufhidden=delete

" 	" Sets the current directory to the opened file
" 	autocmd BufEnter * silent! lcd %:p:h
augroup END

" More space with NERDTree
let g:NERDTreeMinimalUI = 1
let g:NERDTreeMarkBookmarks = 0
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeStatusLine = -1

" Tell ack.vim to use ripgrep instead
let g:ackprg = 'rg --vimgrep --no-heading'

augroup THE_PRIMEAGEN
	autocmd!
    autocmd BufEnter,BufWinEnter,TabEnter *.rs :lua require'lsp_extensions'.inlay_hints{}
augroup END

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

	au FileType gitcommit setlocal nolist ts=4 sts=4 sw=4 noet
	au FileType inform7 setlocal nolist tw=0 ts=4 sw=4 noet foldlevel=999
	au FileType json setlocal conceallevel=0 foldmethod=syntax foldlevel=999
	au FileType make setlocal nolist ts=4 sts=4 sw=4 noet
	au FileType markdown syn sync fromstart
	au Filetype gitcommit setlocal tw=80
	au Filetype csv setlocal nocursorline

augroup END
