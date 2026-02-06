require "nvchad.options"

local o = vim.o

o.cursorlineopt = "both"
o.shell = "fish"
o.relativenumber = true

vim.filetype.add {
  extension = {
    svx = "svx",
  },
}
vim.treesitter.language.register("markdown", "svx")

vim.opt.termguicolors = true
vim.opt.guicursor = "n-v-c:block," .. "i-ci-ve:ver25," .. "r-cr:hor20"
vim.opt.lazyredraw = true
vim.opt.ttyfast = true
vim.opt.updatetime = 200
