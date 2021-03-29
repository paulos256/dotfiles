augroup FILETYPE_PYTHON
	autocmd!
	autocmd FileType python :iabbrev <buffer> iff if:<left>
augroup END

augroup FILETYPE_JAVASCRIPT
	autocmd!
	autocmd FileType javascript :iabbrev <buffer> iff if ()<left>
augroup END

augroup FILETYPE_VIMSCRIPT
	autocmd!
	autocmd FileType vim setlocal commentstring=\"\ %s
augroup END

augroup FILETYPE_RUST
	autocmd!
	autocmd! FileType rust :nnorem
augroup END




" For updating the browser while editing a web project:
" Install browser-sync:
" 1. npm install -g browser-sync
" Run browser-sync:
" 1. navigate to server folder
" 2. browser-sync start --server --files
" if on Linux, create an alias:
" 1. alias serve="browser-sync start --server --files"

