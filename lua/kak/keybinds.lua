local M = {}

local utils = require("kak.utils")

function M.setup(opts)
  local opts = opts or {}

  -- Only set up word motions with reselect behavior
  local word = { "w", "e", "b" }
  utils.keymap.set(word, { presets = { "reselect" } })

  -- Keep the normal mode operators as they were
  -- (these make d, c, y enter visual mode first)
  for _, key in ipairs({ "d", "c", "y" }) do
    vim.keymap.set({ "n" }, key, "v" .. key)
  end
  
  -- Keep x -> V mapping if you want linewise selection
  vim.keymap.set({ "n", "x" }, "x", "V")
end

return M
