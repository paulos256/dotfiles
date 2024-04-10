-- lazy.vim package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("lazy").setup("plugins", {})

-- shared keymaps and options with VsVim
vim.g.actual_neovim = true
vim.cmd("source " .. vim.fn.stdpath("config") .. "/vimrc.vim")

require("config.keymaps")
require("config.options")
require("config.autocmds")

vim.cmd.colorscheme("slate")
vim.o.background = "dark" -- or "light" for light mode
