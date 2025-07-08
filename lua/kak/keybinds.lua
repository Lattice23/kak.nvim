local M = {}

local utils = require("kak.utils")

function M.setup(opts)
  local opts = opts or {}

  -- Only set up word motions with reselect behavior in NORMAL mode
  local word = { "w", "e", "b" }
  for _, key in ipairs(word) do
    vim.keymap.set("n", key, "v" .. key .. "<Esc>", { noremap = true })
  end

  -- Normal mode operators: select, then act
  for _, key in ipairs({ "d", "c", "y" }) do
    vim.keymap.set("n", key, "v" .. key, { noremap = true })
  end
end
return M
