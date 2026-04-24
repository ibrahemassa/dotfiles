require("nvim-tree").setup({
  event_handlers = {
    {
      event = "nvim-tree_buffer_enter",
      handler = function()
        vim.cmd [[
          setlocal relativenumber
        ]]
      end,
    }
  },
})
