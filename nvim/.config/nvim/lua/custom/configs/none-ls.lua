local none_ls = require("none-ls")

local formatting = none_ls.builtins.formatting
local diagnostics = none_ls.builtins.diagnostics

-- Setup
none_ls.setup({
  sources = {
    formatting.black,
    formatting.prettier,
    diagnostics.mypy,
    diagnostics.ruff,
    formatting.rustfmt,
    formatting.gofmt,
    formatting.goimports,
  },

  -- ✅ Add this section to enable format-on-save
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      -- Clear any old autocommands to avoid duplicates
      vim.api.nvim_clear_autocmds({ group = "FormatOnSave", buffer = bufnr })

      vim.api.nvim_create_augroup("FormatOnSave", { clear = false })

      vim.api.nvim_create_autocmd("BufWritePre", {
        group = "FormatOnSave",
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({
            bufnr = bufnr,
            timeout_ms = 2000,
            filter = function(client)
              return client.name == "null-ls" or client.name == "none-ls"
            end,
          })
        end,
      })
    end
  end,
})
