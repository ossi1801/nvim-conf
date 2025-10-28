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
	{ src = "https://github.com/vague2k/vague.nvim" },                                 --Color theme
	{ src = "https://github.com/chentoast/marks.nvim" },                               --Mark your files
	{ src = "https://github.com/stevearc/oil.nvim" },                                  --File browser
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },                        --Icons
	{ src = "https://github.com/aznhe21/actions-preview.nvim" },                       --Previews
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter",        version = "main" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim",          version = "0.1.8" }, --Fuzzy
	{ src = "https://github.com/nvim-telescope/telescope-ui-select.nvim" },            --Fuzzy
	{ src = "https://github.com/neovim/nvim-lspconfig" },                              --LSP
	{ src = "https://github.com/mason-org/mason.nvim" },                               --LSP etc
	{ src = "https://github.com/L3MON4D3/LuaSnip" },                                   --No idea
	{ src = "https://github.com/LinArcX/telescope-env.nvim" },                         --Fuzzy
	{ src = "https://github.com/nvim-lua/plenary.nvim" },                              --Needed for harpoon2
	{ src = "https://github.com/ThePrimeagen/harpoon",                   version = "harpoon2" },
	{ src = "https://github.com/mfussenegger/nvim-dap" },
--	{ src = "https://github.com/rcarriga/nvim-dap-ui" },
	--https://github.com/numToStr/Comment.nvim
})
require("mason").setup()
require("oil").setup()
require("plenary")
require("vague").setup({})
vim.cmd("colorscheme vague")

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
vim.lsp.enable({ "lua_ls", "clangd", "cpp" })

--NVIM DEBUGGER STUFF
vim.api.nvim_set_hl(0,'DapBreakpoint', { ctermbg=0, fg='#993939', bg='#31353f' })
vim.api.nvim_set_hl(0,'DapLogPoint', { ctermbg=0, fg='#61afef', bg='#31353f' })
vim.api.nvim_set_hl(0,'DapStopped', { ctermbg=0, fg='#98c379', bg='#31353f' })

vim.fn.sign_define('DapBreakpoint', { text='•', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' })
vim.fn.sign_define('DapBreakpointCondition', { text='•', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' })
vim.fn.sign_define('DapBreakpointRejected', { text='', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl= 'DapBreakpoint' })
vim.fn.sign_define('DapLogPoint', { text='', texthl='DapLogPoint', linehl='DapLogPoint', numhl= 'DapLogPoint' })
vim.fn.sign_define('DapStopped', { text='', texthl='DapStopped', linehl='DapStopped', numhl= 'DapStopped' })


--Harpoon for jumping in files
local harpoon = require("harpoon")
harpoon:setup()
vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-l>", function() harpoon:list():select(9) end)

-- Toggle previous & next buffers stored within Harpoon list
--vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
--vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)

--Telecope for fuzzy finding and jumping between files
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- Rest of the keybindings
vim.keymap.set('n', '<leader>e', ":Oil<CR>")
vim.keymap.set('n', '<leader>kf', vim.lsp.buf.format)
--vim.keymap.set('n','<leader>e', ":Oil<CR>")
--vim.keymap.set('n','<leader>e', ":Oil<CR>")
