require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })
map("c", "<DOWN>", "<C-n>", { desc = "Arrow down  next command" })
map("c", "<UP>", "<C-p>", { desc = "Arrow up  previous command" })

map("n", "<leader>da", "<cmd>lua vim.diagnostic.open_float()<CR>")
map("n", "<leader>ca", function()
  require("tiny-code-action").code_action()
end, { noremap = true, silent = true })

local api = require "nvim-tree.api"
map("n", "<leader>E", function()
  api.tree.open { current_window = true }
end, { noremap = true })
