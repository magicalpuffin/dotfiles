-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua
-- local sep_style = "default"
--
-- local default_sep_icons = {
--   default = { left = "", right = "" },
--   round = { left = "", right = "" },
--   block = { left = "█", right = "█" },
--   arrow = { left = "", right = "" },
-- }
--
-- local separators = (type(sep_style) == "table" and sep_style) or default_sep_icons[sep_style]
--
-- local sep_l = separators["left"]
-- local sep_r = separators["right"]
-- local getstbufnr = function()
--   return vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
-- end
--
-- local getFile = function()
--   local icon = "󰈚"
--   local path = vim.api.nvim_buf_get_name(getstbufnr())
--   local workingDir = vim.loop.cwd()
--
--   local name = "Empty "
--   -- check if path starts with working directory
--   if path:sub(1, #workingDir) == workingDir then
--     name = path:sub(#workingDir + 2)
--   end
--
--   if name ~= "Empty " then
--     local devicons_present, devicons = pcall(require, "nvim-web-devicons")
--
--     if devicons_present then
--       local ft_icon = devicons.get_icon(name)
--       icon = (ft_icon ~= nil and ft_icon) or icon
--     end
--   end
--
--   return { icon, name }
-- end
--
-- local fileDisplay = function()
--   local x = getFile()
--   local name = " " .. x[2] .. " "
--   return "%#St_file# " .. x[1] .. name .. "%#St_file_sep#" .. sep_r
-- end

---@type ChadrcConfig
local M = {}

local dark_green = "#65926A"

M.base46 = {
  theme = "github_dark",
  hl_override = {
    Comment = { italic = true, fg = "light_grey" },
    ["@comment"] = { italic = true, fg = dark_green },
  },
  -- statusline = {
  --   modules = {
  --     file = function()
  --       return fileDisplay()
  --     end,
  --   },
  -- },
}

return M
