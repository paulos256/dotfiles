lua require("theprimeagen")

nnoremap <leader>rg :lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>
nnoremap <leader>RG :lua require('telescope.builtin').live_grep()<CR>
vnoremap <leader>rg :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <C-p> :lua require('telescope.builtin').find_files()<CR>

nnoremap <leader>b :tab :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>tab :tab lua require('telescope.builtin').tabs()<CR>
nnoremap <leader>vh :lua require('telescope.builtin').help_tags()<CR>
nnoremap <leader>vrc :lua require('theprimeagen.telescope').search_dotfiles()<CR>
nnoremap <leader>vedit :lua require('theprimeagen.telescope').search_vim_config()<CR>
