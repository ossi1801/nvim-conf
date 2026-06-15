require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("v","J",":m '>+1<CR>gv=gv") --Allows to move highlighted rows in visual mode with K J
map("v","K",":m '<-2<CR>gv=gv") --Allows to move highlighted rows in visual mode with K J
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
