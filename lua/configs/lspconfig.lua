require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls","clangd" }
vim.lsp.enable(servers)
vim.lsp.config("roslyn", {})
-- vim.lsp.config("clangd", {})
-- read :h vim.lsp.config for changing options of lsp servers 
-- IMPORTANT: vim diagnostic configuration AFTER LSPs are loaded
vim.diagnostic.config(
    {
        underline = false,
        virtual_text = false,
        update_in_insert = false,
        severity_sort = true,
        signs = {
            text = {
                [vim.diagnostic.severity.ERROR] = " ",
                [vim.diagnostic.severity.WARN] = " ",
                [vim.diagnostic.severity.HINT] = " ",
                [vim.diagnostic.severity.INFO] = " ",
            }
        }
    }
)
