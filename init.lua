local opt = vim.opt

if require "jb.first_load"() then
  return
end

-- In general, it's a good idea to set this early in your config, because otherwise
-- if you have any mappings you set BEFORE doing this, they will be set to the OLD
-- leader.
-- Remap space as leader key

vim.cmd("syntax enable")
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", {noremap = true, silent = true})
vim.g.mapleader = " "
vim.g.maplocalleader = " "
--Set jj to be escape in insert mode
vim.api.nvim_set_keymap("i", "jj", "<esc>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", ";", ":", {noremap = true})
-- vim.api.nvim_set_keymap("n", "k", "gk", {noremap = true})
-- vim.api.nvim_set_keymap("n", "j", "gj", {noremap = true})

--Remap for dealing with word wrap
vim.api.nvim_set_keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", {noremap = true, expr = true, silent = true})
vim.api.nvim_set_keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", {noremap = true, expr = true, silent = true})

-- Setup globals that I expect to be always available.
--  See `./lua/jb/globals/*.lua` for more information.
require "jb.globals"

-- Load packer.nvim files
require "jb.plugins"
--Set colorscheme (order is important here)

-- Force loading of astronauta first.
vim.cmd [[runtime plugin/astronauta.vim]]

-- Load neovim options
require "jb.options"

-- Neovim builtin LSP configuration
require "jb.lsp"

-- Telescope BTW
require "jb.telescope"
require "jb.telescope.mappings"
