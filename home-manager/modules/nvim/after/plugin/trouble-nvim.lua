require("trouble").setup({})

vim.api.nvim_create_user_command("Trouble", function(opts)
  require("trouble").toggle(opts.args)
end, { nargs = "*" })

vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics<cr>", {
  silent = true,
  desc = "Diagnostics (Trouble)",
})

vim.keymap.set("n", "<leader>xX", "<cmd>Trouble diagnostics filter.buf=0<cr>", {
  silent = true,
  desc = "Buffer Diagnostics (Trouble)",
})

vim.keymap.set("n", "<leader>cs", "<cmd>Trouble symbols focus=false<cr>", {
  silent = true,
  desc = "Symbols (Trouble)",
})

vim.keymap.set("n", "<leader>cl", "<cmd>Trouble lsp focus=false win.position=right<cr>", {
  silent = true,
  desc = "LSP Definitions / references / ... (Trouble)",
})

vim.keymap.set("n", "<leader>xL", "<cmd>Trouble loclist<cr>", {
  silent = true,
  desc = "Location List (Trouble)",
})

vim.keymap.set("n", "<leader>xQ", "<cmd>Trouble qflist<cr>", {
  silent = true,
  desc = "Quickfix List (Trouble)",
})
