return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    config = function()
      require "configs.conform"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "tailwindcss-language-server",
        "rustywind",
        "rust-analyzer",
        "ruff",
        "eslint-lsp",
        "prettier",
        "biome",
        "typescript-language-server",
        "svelte-language-server",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "vimdoc",
        "lua",
        "bash",
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
        "svelte",
      },
    },
  },
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "html",
      "svelte",
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "danymat/neogen",
    cmd = "Neogen",
    config = function()
      require("neogen").setup { snippet_engine = "luasnip" }
    end,
  },
  {
    "kevinhwang91/nvim-ufo",
    event = { "BufReadPost" },
    dependencies = { "kevinhwang91/promise-async" },
    config = function()
      require "configs.ufo"
    end,
  },
}
