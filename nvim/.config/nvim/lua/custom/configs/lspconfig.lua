local config = require("plugins.configs.lspconfig")
require("mason").setup()
local on_attach = config.on_attach
local capabiliteies = config.capabilities

local lspconfig = require("lspconfig")
local util = require "lspconfig/util"
require("luasnip.loaders.from_vscode").lazy_load()

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabiliteies = capabiliteies,
  cmd = {"gopls"},
  filetypes = {"go", "gomod", "gowork", "gotmpl"},
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
}

lspconfig.pyright.setup {
  on_attach = on_attach,
  capabiliteies = capabiliteies,
  filetypes = {"python"},
}

lspconfig.intelephense.setup{
  on_attach = on_attach,
  capabiliteies = capabiliteies,
  filetypes = {"php", "blade"},
  root_dir = lspconfig.util.root_pattern("index.php", "index.blade.php", "composer.json", ".git"),
}

lspconfig.rust_analyzer.setup({
  on_attach = on_attach,
  capabiliteies = capabiliteies,
  filetypes = {"rust"},
  root_dir = util.root_pattern("Cargo.toml"),
  settings = {
    ['rust-analyzer'] = {
      cargo = {
        allFeatures = true,
      },
    },
  },
})

lspconfig.clangd.setup{
  on_attach = on_attach,
  capabiliteies = capabiliteies,

}

-- lspconfig.phpactor.setup{
--   on_attach = on_attach,
--   capabiliteies = capabiliteies,
--   filetypes = {"php"},
--   root_dir = lspconfig.util.root_pattern("index.php", "composer.json", ".git"),
-- }

lspconfig.cssls.setup{}
lspconfig.html.setup{
  capabiliteies = capabiliteies,
  on_attach = on_attach,
  filetypes = {"html", "blade"},
}
lspconfig.bashls.setup{}
lspconfig.ast_grep.setup{
  on_attach = on_attach,
  capabiliteies = capabiliteies,
  filetypes = {"javascriptreact", "jsx"},
}

lspconfig.jdtls.setup{
  on_attach = on_attach,
  capabiliteies = capabiliteies,
  filetypes = {"java"},
}
