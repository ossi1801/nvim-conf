-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "vscode_dark",--"onedark",
  --https://nvchad.com/themes
  --Read :h nvui.base46

	hl_override = {
	  Type = { bold = true, italic = false },
	  ["@comment"] = { italic = true },
	  ["@function"] = { bold = true, italic = true },
	  ["@function.builtin"] = { bold = true },
	  ["@function.call"] = { bold = true },
	  ["@function.method.call"] = { bold = true },
	  ["@keyword"] = { italic = true }
  }

}

-- M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
-- }

-- Load custom highlights
--require("custom.configs.highlights")
return M
