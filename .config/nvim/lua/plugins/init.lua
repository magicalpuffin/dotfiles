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
    "nvim-tree/nvim-tree.lua",
    opts = {
      view = { adaptive_size = true },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "pyright",
        "ruff",
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "json-lsp",
        "yaml-language-server",
        "taplo",
        "tailwindcss-language-server",
        "rustywind",
        "rust-analyzer",
        "eslint-lsp",
        "prettier",
        "biome",
        "vtsls",
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
      "svx",
    },
    config = function()
      require("nvim-ts-autotag").setup {
        aliases = {
          ["svx"] = "svelte",
        },
      }
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
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local cmp = require "cmp"
      cmp.setup {
        preselect = cmp.PreselectMode.None,
        mapping = cmp.mapping.preset.insert {
          ["<ArrowUp>"] = cmp.mapping.select_prev_item(),
          ["ArrowDown>"] = cmp.mapping.select_next_item(),
        },
      }
    end,
  },
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>tx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>tX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>ts",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>tl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>tL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>tQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },
}
