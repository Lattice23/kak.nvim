local M = {}
local utils = require("kak.utils")

function M.setup(opts)
  local opts = opts or {}
  
  -- Word motions with reselect behavior
  local word = { "w", "e", "b" }
  utils.keymap.set(word, { presets = { "reselect" } })
  
  -- Use "none" preset for basic movements (acts like normal Vim)
  local movement = { "h", "j", "k", "l" }
  utils.keymap.set(movement, { presets = { "none" } })
  
  -- Keep the normal mode operators
  for _, key in ipairs({ "d", "c", "y" }) do
    vim.keymap.set({ "n" }, key, "v" .. key)
  end
end

return M
