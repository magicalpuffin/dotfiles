local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

-- add folding for ufo
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

-- use svelte fallback watcher
local svelte_lsp_capabilities = vim.tbl_deep_extend("force", {}, capabilities)
svelte_lsp_capabilities.workspace = { didChangeWatchedFiles = false }

local lspconfig = require "lspconfig"
local servers = {
  "pyright",
  "ruff",
  "lua_ls",
  "html",
  "cssls",
  "yamlls",
  "taplo",
}

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- typescript
-- lspconfig.tsserver.setup {
--   on_attach = on_attach,
--   on_init = on_init,
--   capabilities = capabilities,
-- init_options = {
--   preferences = {
--     disableSuggestions = true,
--   },
-- },
-- }

-- vtsls
lspconfig.vtsls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

-- biome
lspconfig.biome.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  filetypes = {
    "typescript",
    "javascript",
    "json",
    "jsonc",
  },
}

-- eslint
lspconfig.eslint.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  filetypes = {
    "svelte",
  },
}

lspconfig.svelte.setup {
  on_attach = on_attach,
  init = on_init,
  capabilities = svelte_lsp_capabilities,
}

-- tailwindcss
lspconfig.tailwindcss.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  filetypes = {
    "html",
    "css",
    "svelte",
  },
}
