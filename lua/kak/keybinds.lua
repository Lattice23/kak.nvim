local M = {}

local utils = require("kak.utils")

function M.setup(opts)
  local opts = opts or {}

  -- Word motions with reselect behavior
  local word = { "w", "e", "b" }
  utils.keymap.set(word, { presets = { "reselect" } })

  -- All basic movements exit visual mode (no extending selections)
  local movement = { "h", "j", "k", "l" }
  utils.keymap.set(movement, { presets = { "deselect" } })

  -- Keep the normal mode operators
  for _, key in ipairs({ "d", "c", "y" }) do
    vim.keymap.set({ "n" }, key, "v" .. key)
  end
  
  vim.keymap.set({ "n", "x" }, "x", "V")
end

return M
