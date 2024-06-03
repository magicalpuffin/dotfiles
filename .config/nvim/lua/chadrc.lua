-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

local dark_green = "#65926A"

M.ui = {
  theme = "github_dark",
  hl_override = {
    Comment = { italic = true, fg = "light_grey" },
    ["@comment"] = { italic = true, fg = dark_green },
  },
}

return M
