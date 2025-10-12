local M = {}
M.ui = { theme = "vscode" }  -- Match your colorscheme

-- Override LSP semantic highlights (after colorscheme loads)
vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
    -- VS-like colors (hex values for dark theme)
local colors = {
    blue = "#569CD6",      -- Keywords
    cyan = "#4EC9B0",      -- Types, classes
    teal = "#9CDCFE",      -- Locals, parameters
    magenta = "#CE9178",   -- Strings
    green = "#6A9955",     -- Comments
    orange = "#B5CEA8",    -- Numbers
    purple = "#C586C0",    -- Methods/functions
    yellow = "#DCDCAA",    -- Properties
}

-- Clear defaults and link/set new ones
vim.api.nvim_set_hl(0, "@lsp.type.keyword", { fg = colors.blue, italic = false })
vim.api.nvim_set_hl(0, "@lsp.type.class", { fg = colors.cyan })
vim.api.nvim_set_hl(0, "@lsp.type.interface", { fg = colors.cyan })
vim.api.nvim_set_hl(0, "@lsp.type.variable", { fg = colors.teal })
vim.api.nvim_set_hl(0, "@lsp.type.parameter", { fg = colors.teal, italic = true })
vim.api.nvim_set_hl(0, "@lsp.type.string", { fg = colors.magenta })
vim.api.nvim_set_hl(0, "@lsp.type.comment", { fg = colors.green, italic = true })
vim.api.nvim_set_hl(0, "@lsp.type.number", { fg = colors.orange })
vim.api.nvim_set_hl(0, "@lsp.type.function", { fg = colors.purple })
vim.api.nvim_set_hl(0, "@lsp.type.property", { fg = colors.yellow })
vim.api.nvim_set_hl(0, "@lsp.typemod.variable.defaultLibrary", { fg = colors.yellow, underline = true })  -- Built-ins

-- Modifiers (e.g., static, readonly)
vim.api.nvim_set_hl(0, "@lsp.mod.modifier.static", { bold = true })
vim.api.nvim_set_hl(0, "@lsp.mod.modifier.readonly", { fg = colors.orange, italic = true })
end,
})

return M
