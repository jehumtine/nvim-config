-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {
  desc = "Rename symbol",
})

-- KCL (Zoo) CAD loop
vim.keymap.set("n", "<leader>kv", function()
  local file = vim.fn.expand("%:p")
  require("snacks").terminal({ "zoo", "kcl", "view", file }, {
    cwd = vim.fn.expand("%:p:h"),
    win = { position = "bottom", height = 0.55 },
  })
end, { desc = "KCL: view render (terminal)" })

vim.keymap.set("n", "<leader>ka", function()
  vim.fn.jobstart({ "zoo", "app", vim.fn.expand("%:p") }, { detach = true })
end, { desc = "KCL: open in Zoo Design Studio" })
