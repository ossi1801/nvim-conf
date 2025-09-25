vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "autocmds"

vim.schedule(function()
  require "mappings"
end)


--Custom stuff
--Set vim options in ~/.config/nvim/lua/options.lua
--vim.opt.relativenumber = true

--c# debug
require("neotest").setup({
  adapters = {
    require("neotest-dotnet")
  }
})
--Cursor custom animation (default behaviour done in plugins/smear_cursor.lua)
require("smear_cursor").setup({
  cursor_color = "ff8800",
  stiffness = 0.8,
  trailing_stiffness = 0.5,
  distance_stop_animation = 0.5,
})
