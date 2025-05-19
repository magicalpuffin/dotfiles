local options = {
  formatters_by_ft = {
    python = { "ruff_format" },
    lua = { "stylua" },
    css = { "prettierd" },
    html = { "prettierd" },
    toml = { "taplo" },
    yaml = { "yamlfmt" },
    json = { "biome-check" },
    jsonc = { "biome-check" },
    javascript = { "biome-check" },
    typescript = { "biome-check" },
    svelte = { "prettierd", "rustywind" },
    svx = { "prettierd" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

require("conform").setup(options)
