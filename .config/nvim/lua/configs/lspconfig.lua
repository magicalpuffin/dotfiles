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

local lspconfig = vim.lsp.config
local servers = {
  "pyright",
  "ruff",
  "html",
  "cssls",
  "jsonls",
  "yamlls",
  "taplo",
}

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig(lsp, {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  })
  vim.lsp.enable(lsp)
end

-- lua
vim.lsp.config("lua_ls", {
  -- copied from neovim-lspconfig
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if
        path ~= vim.fn.stdpath "config"
        and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
      then
        return
      end
    end

    client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
          -- Depending on the usage, you might want to add additional paths here.
          -- "${3rd}/luv/library"
          -- "${3rd}/busted/library",
        },
        -- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
        -- library = vim.api.nvim_get_runtime_file("", true)
      },
    })
  end,
  settings = {
    Lua = {},
  },
})
vim.lsp.enable "lua_ls"

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
lspconfig("vtsls", {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
})
vim.lsp.enable "vtsls"

-- biome
lspconfig("biome", {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  root_dir = function()
    -- override for biome to apply regardless of biome.json
    return vim.fn.getcwd()
  end,
  filetypes = {
    "typescript",
    "javascript",
    "json",
    "jsonc",
  },
})
vim.lsp.enable "biome"

-- eslint
lspconfig("eslint", {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  filetypes = {
    "svelte",
  },
})
vim.lsp.enable "eslint"

lspconfig("svelte", {
  on_attach = on_attach,
  init = on_init,
  capabilities = svelte_lsp_capabilities,
  filetypes = {
    "svelte",
  },
})
vim.lsp.enable "svelte"

-- tailwindcss
lspconfig("tailwindcss", {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  filetypes = {
    "html",
    "css",
    "svelte",
  },
})
vim.lsp.enable "tailwindcss"
