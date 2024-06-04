vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

require("ufo").setup {
  close_fold_kinds_for_ft = {
    default = { "comment" },
  },
}
