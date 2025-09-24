require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls","clangd" }
vim.lsp.enable(servers)
vim.lsp.config("roslyn", {})
-- vim.lsp.config("clangd", {})
-- read :h vim.lsp.config for changing options of lsp servers 
