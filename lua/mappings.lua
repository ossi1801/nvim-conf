require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

--Shows inline hints with <space> sh, useed to reduce clutter
map("n", "<leader>sh", function()
local current_config = vim.diagnostic.config()
vim.diagnostic.config({
    virtual_text = not current_config.virtual_text
})
end, { desc = 'Toggle diagnostic virtual text' })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
