" lua require("theprimeagen")

" Terminal commands
" ueoa is first through fourth finger left hand home row.
" This just means I can crush, with opposite hand, the 4 terminal positions
"
" These functions are stored in harpoon.  A plugn that I am developing
nnoremap <Leader><C-a> :lua require("harpoon.mark").add_file()<CR>
nnoremap <C-S-e> :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <C-S-y> :lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>

nnoremap <C-S-a> :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <C-S-r> :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <C-S-s> :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <C-S-t> :lua require("harpoon.ui").nav_file(4)<CR>
" nnoremap <leader>tu :lua require("harpoon.term").gotoTerminal(1)<CR>
" nnoremap <leader>te :lua require("harpoon.term").gotoTerminal(2)<CR>
" nnoremap <leader>cu :lua require("harpoon.term").sendCommand(1, 1)<CR>
" nnoremap <leader>ce :lua require("harpoon.term").sendCommand(1, 2)<CR>
