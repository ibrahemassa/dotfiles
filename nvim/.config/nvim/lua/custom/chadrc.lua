---@type ChadrcConfig
vim.deprecate = function() end
local M = {}

M.ui = {
  transparency = true,
  theme = 'catppuccin',
  nvdash = {
    load_on_startup = true,
  },
  statusline = {
    theme = "vscode_colored",
    -- theme = "minimal",
  },
}

-- Dude like this line should be inside vim.cmd block lol!!
-- highlight LineNr guifg=#ff0000

-- vim.o.cursorline = true

vim.cmd[[
  highlight LineNr guifg=#bf71d9
  highlight CursorLineNr guifg=#ffffff
  highlight @comment guifg=#9c9c9c guibg=#45435c 
  highlight StatusLine guibg=NONE guifg=#ffffff
  highlight TabLine guibg=NONE guifg=#ffffff
  highlight TabLineFill guibg=NONE
  highlight TabLineSel guibg=NONE guifg=#00ffff gui=bold
  " highlight CursorLine guibg=#545c7e ctermbg=235
" highlight CursorLine guibg=#32374d ctermbg=235
" highlight CursorLine guibg=#333b47 ctermbg=233
  highlight Visual guibg=#454c5c guifg=none
]]


M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

-- require("custom.configs.completions")
vim.opt.relativenumber = true

vim.g.terminal_emulator='kitty'

require("custom.configs.dbext-config")

return M
