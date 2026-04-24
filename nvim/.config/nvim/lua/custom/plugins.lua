local plugins = {
  {
  "folke/tokyonight.nvim",
  priority = 1000,
  opts = {},
  },
  {
	  "L3MON4D3/LuaSnip",
	  version = "v2.*",
	  build = "make install_jsregexp",
    requires = {"saadparwaiz1/cmp_luasnip"},
  },
  -- {
  --   "jose-elias-alvarez/null-ls.nvim",
  --   ft = {"python", "rust", "go"},
  --   opts = function ()
  --     return require "custom.configs.null-ls"
  --   end,
  -- },
  {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require "custom.configs.none-ls"
    end,
  },
  {
    "github/copilot.vim",
    keys = {
      {
        "<leader>ce", "<cmd>Lazy load copilot.vim<bar>Copilot enable<cr>", desc="Enable copilot",
      },
      {
        "<leader>cd", "<cmd>Copilot disable<cr>", desc="Disable copilot",
      }
    },
    config = function()
      require("copilot").setup()
    end,
  },

  -- {
  --   "jose-elias-alvarez/null-ls.nvim",
  --   config = function()
  --     require("plugins.configs.null-ls")
  --   end,
  -- },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "black",
        "mypy",
        "ruff",
        "pyright",
        "intelephense",
        "phpstan",
        "prettier",
        "phpactor",
        "rust-analyzer",
        "rustfmt",
        "clangd",
      },
    },
    config = function ()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "pyright", "intelephense" }, -- Add your desired language servers here
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
      config = function ()
        require "plugins.configs.lspconfig"
        require "custom.configs.lspconfig"
      end,

  },
  {"EmranMR/tree-sitter-blade"},
  {"hrsh7th/nvim-cmp"},
  {"hrsh7th/cmp-nvim-lsp"},
  {"saadparwaiz1/cmp_luasnip"},
  {"rafamadriz/friendly-snippets"},
  {"vim-scripts/dbext.vim"},
  {
    "jwalton512/vim-blade",
    event = { "BufReadPre", "BufNewFile" },
    ft = "blade",
    config = function()
      -- vim.cmd([[setlocal commentstring={{-- %s --}}]])
    end,
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
    require('nvim-ts-autotag').setup({
      opts = {
        -- defaults
        enable_close = true, -- auto close tags
        enable_rename = true, -- auto rename pairs of tags
        enable_close_on_slash = false -- auto close on trailing </
      },
    })
    end,
    lazy = false,
    -- config = function()
    --   require "custom.config.nvim-ts-autotag"
    -- end,
  },
  {"rohit-px2/nvui"},
  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   branch = "main",
  --   lazy = false,
  --   build = ":TSUpdate",
  -- }
}
return plugins
