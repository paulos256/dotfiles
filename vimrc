set guicursor=n-v:block,i-c-ci-ve:ver25,o:hor50,a:blinkoff0-Cursor/lCursor
  \,r-cr:block-blinkwait100-blinkoff100-blinkon100
set nohidden  " DON'T allow dirty background buffers. Clean it up the first time!
set noerrorbells
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
" set nohlsearch

set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

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

" Turn off linewise keys. I want this to act more visually -- I want `down'
" to mean the next line on the screen
noremap j gj
noremap k gk

" Marks should go to the column, not just the line. Why isn't this the default?
nnoremap ' `

" You don't know what you're missing if you don't use this.
" nnoremap <C-e> :e#<CR>

" Search for the word under the cursor in the current directory
nnoremap <M-k>    mo:Ack! "\b<cword>\b" <CR>

" Quickly fix spelling errors choosing the first result
nnoremap <Leader>z z=1<CR><CR>

" Fix annoyances in the QuickFix window, like scrolling too much
autocmd FileType qf setlocal number nolist
autocmd Filetype qf wincmd J " Makes sure it's at the bottom of the vim window

" These are things that I mistype and want ignored.
nnoremap Q  <silent>
nnoremap q: <silent>

" Buffers
nnoremap <Leader>b :ls<CR>:b
nnoremap <Leader>B :ls!<CR>:b
nnoremap <Leader>Q :bd<CR>

" Navigation
nnoremap <C-S-Left> :bp<CR>
nnoremap <C-S-Right> :bn<CR>

nnoremap <C-h> gT
nnoremap <C-l> gt
nnoremap <C-Left> gT
nnoremap <C-Right> gt

" Jump up, jump up to get down!
nnoremap <C-j> <C-d>
nnoremap <C-k> <C-u>
vnoremap <C-j> <C-d>
vnoremap <C-k> <C-u>

nnoremap <A-k> :cnext<CR>
nnoremap <A-j> :cprev<CR>
nnoremap <Leader>' :call ToggleQFList(1)<CR>
nnoremap <Leader>" :call ToggleQFList(0)<CR>


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

nnoremap <Leader>h :wincmd h<CR>
nnoremap <Leader>j :wincmd j<CR>
nnoremap <Leader>k :wincmd k<CR>
nnoremap <Leader>l :wincmd l<CR>
nnoremap <Leader>q :wincmd c<CR>
nnoremap <silent><Leader>wt :wincmd T<CR>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Help and windows and Sex!
let g:netrw_banner = 1
let g:netrw_liststyle = 1
let g:netrw_browse_split = 3
let g:netrw_winsize = 25

" Help and windows and Sex!
nnoremap <leader>dir :Sex!<CR>
nnoremap <Leader>cd :cd %:p:h<CR>
nnoremap <leader>ghw :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>srw :CocSearch <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>bs /<C-R>=escape(expand("<cWORD>"), "/")<CR><CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <Leader><CR> :so $MYVIMRC<CR>

nnoremap <Leader>- :vertical resize +5<CR>
nnoremap <Leader>_ :vertical resize -5<CR>
nnoremap <Leader>= :resize +2<CR>
nnoremap <Leader>+ :resize -2<CR>
nnoremap <Leader>rp :resize 100<CR>

nnoremap <S-r> <nop>
" nnoremap <C-p> <nop>

" greatest remap ever
vnoremap p "_dP
" greatest remap replacement

" next greatest remap ever : asbjornHaland
nnoremap <Leader>y "+y
vnoremap <Leader>y "+y
nnoremap <Leader>Y gg"+yG
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
vnoremap <Leader>p "+p
vnoremap <Leader>P "+P

nnoremap <Leader>d "_d
vnoremap <Leader>d "_d
nnoremap Y y$

nnoremap <Leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/I<Left><Left><Left>
nnoremap <Leader>/ :let @/='\<<C-r><C-w>\>'<CR>

vnoremap < <gv
vnoremap > >gv

nnoremap S i<CR><Right><ESC>

" get out of insert mode
inoremap <C-c> <ESC>
" inoremap kj <ESC>

" Toggle spelling hints
nnoremap <Silent><Leader>ts :set spell!<CR>

iabbrev teh the
iabbrev adn and
iabbrev wehn when
iabbrev tehn then
iabbrev Pual Paul

fun! EditInitVim()
	:tabnew $MYVIMRC
	:new ~/.vimrc
endfunction

fun! EmptyRegisters()
    let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
    for r in regs
        call setreg(r, [])
    endfor
endfun

" Stay on the same line when window switching
function! KeepCurrentLine(motion)
  let theLine = line('.')
  let theCol = col('.')
  exec 'wincmd ' . a:motion
  if &diff
    call cursor(theLine, theCol)
  endif
endfunction
nnoremap <C-w>h :silent call KeepCurrentLine('h')<CR>
nnoremap <C-w>l :silent call KeepCurrentLine('l')<CR>

" Commands to send common keystrokes using tmux
let g:tmux_console_pane = '0:0.0'
let g:tmux_server_pane = '0:0.0'
function TmuxPaneRepeat()
  write
  silent execute ':!tmux send-keys -t' g:tmux_console_pane 'C-p' 'C-j'
  redraw!
endfunction
function TmuxPaneClear()
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

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END

" fun! SearchForWord()
" 	call setreg("/", expand("<cword>"))
" 	set hlsearch
" endfun
" nnoremap // :call SearchForWord()<CR>

augroup mm_buf_cmds
	autocmd!
	" Color Column (only on insert)
	autocmd!
	if exists ("&colorcolumn")
		autocmd InsertEnter * set colorcolumn=80
		autocmd InsertLeave * set colorcolumn=""
	endif

	autocmd CursorMoved * if (expand('<cWORD>') =~ @/) | set hlsearch | else | set nohlsearch | endif

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
	autocmd BufWritePre * :call TrimWhitespace()
augroup END
"
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
