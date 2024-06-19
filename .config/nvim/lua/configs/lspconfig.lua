local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

-- add folding for ufo
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

local lspconfig = require "lspconfig"
local servers = {
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
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePost", {
      pattern = { "*.js", "*.ts" },
      callback = function(ctx)
        -- Here use ctx.match instead of ctx.file
        client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
      end,
    })
  end,
  init = on_init,
  capabilities = capabilities,
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
