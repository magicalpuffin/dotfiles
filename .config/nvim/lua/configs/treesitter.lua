-- Highlights are enabled globally by NvChad's FileType autocmd
-- (lua/nvchad/autocmds.lua) which calls pcall(vim.treesitter.start).
--
-- Enable treesitter-based folding per filetype.
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "lua",
    "bash",
    "sh",
    "markdown",
    "html",
    "css",
    "toml",
    "yaml",
    "json",
    "sql",
    "rust",
    "python",
    "javascript",
    "typescript",
    "typescriptreact",
    "svelte",
  },
  callback = function()
    vim.wo[0][0].foldmethod = "expr"
    vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
  end,
})
