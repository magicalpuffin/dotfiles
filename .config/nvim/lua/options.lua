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
vim.treesitter.language.register("svelte", "svx")
