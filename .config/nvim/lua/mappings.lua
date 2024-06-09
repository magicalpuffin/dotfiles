require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<leader>da", "<cmd>lua vim.diagnostic.open_float()<CR>")

local api = require "nvim-tree.api"
map("n", "<leader>E", function()
  api.tree.open { current_window = true }
end, { noremap = true })
