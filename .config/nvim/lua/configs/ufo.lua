vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

local kinds = { "comment", "imports" }

require("ufo").setup {
  -- close_fold_kinds_for_ft = {
  --   default = { "comment", "imports" },
  -- },
}

vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
vim.keymap.set("n", "zr", function()
  require("ufo").openFoldsExceptKinds(kinds)
end)
vim.keymap.set("n", "zm", require("ufo").closeFoldsWith)
