vim.opt.guifont = { "Cascadia Code PL:h10" }

if vim.fn.has("nvim-0.10") == 1 then
  opt.smoothscroll = true
end

-- -- put these in here to keep them out of VsVim
-- vim.keymap.set("n", "<Leader>/", ":let @/='\\<<C-r><C-w>\\>'<CR>:let @\"=@0<CR>:set hlsearch<CR>", { silent = true })
-- vim.keymap.set("v", "<Leader>/", "\"zy:let @/='\\V<C-R>=escape(@z,'/\\[]')<CR>'<CR>:let @\"=@0<CR>:set hlsearch<CR>", { silent = true })


