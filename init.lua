-- Basics
vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.tabstop = 4
vim.o.swapfile = false
vim.o.smartindent = true
vim.o.signcolumn = "yes"
vim.g.mapleader = " "
--
--Plugins
vim.pack.add({
		{ src = "https://github.com/vague2k/vague.nvim" },
		{ src = "https://github.com/chentoast/marks.nvim" },
		{ src = "https://github.com/stevearc/oil.nvim" },
		{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
		{ src = "https://github.com/aznhe21/actions-preview.nvim" },
		{ src = "https://github.com/nvim-treesitter/nvim-treesitter",        version = "main" },
		{ src = "https://github.com/nvim-telescope/telescope.nvim",          version = "0.1.8" },
		{ src = "https://github.com/nvim-telescope/telescope-ui-select.nvim" },
		{ src = "https://github.com/neovim/nvim-lspconfig" },
		{ src = "https://github.com/mason-org/mason.nvim" },
		{ src = "https://github.com/L3MON4D3/LuaSnip" },
		{ src = "https://github.com/LinArcX/telescope-env.nvim" },
		--https://github.com/numToStr/Comment.nvim
})
require("mason").setup()
require("oil").setup()

--Configure LSP
 vim.api.nvim_create_autocmd('LspAttach', {
 	group = vim.api.nvim_create_augroup('my.lsp', {}),
 	callback = function(args)
 		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
 		if client:supports_method('textDocument/completion') then
 			-- Optional: trigger autocompletion on EVERY keypress. May be slow!
 			local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
 			client.server_capabilities.completionProvider.triggerCharacters = chars
 			vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
 		end
 	end,
 })
vim.cmd [[set completeopt+=menuone,noselect,popup]]
vim.lsp.enable({"lua_ls", "clangd","cpp" })

-- Rest of the keybindings
vim.keymap.set('n','<leader>e', ":Oil<CR>")
vim.keymap.set('n','<leader>kf', vim.lsp.buf.format)
--vim.keymap.set('n','<leader>e', ":Oil<CR>")
--vim.keymap.set('n','<leader>e', ":Oil<CR>")
