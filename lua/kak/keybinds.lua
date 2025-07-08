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
  
  -- Alternative movement keys that work normally in visual mode
  vim.keymap.set("x", "<C-h>", "h")  
  vim.keymap.set("x", "<C-j>", "j")  
  vim.keymap.set("x", "<C-k>", "k")  
  vim.keymap.set("x", "<C-l>", "l")

  -- Experimemtal features
  if opts.experimental.rebind_visual_aiAI then
      vim.keymap.set("x", "i", "<Esc>`<i")
      vim.keymap.set("x", "a", "<Esc>`>a")
    end
end

return M
