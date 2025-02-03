vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pp", vim.cmd.Ex)

vim.keymap.set("n", "j", "jzz")
vim.keymap.set("n", "k", "kzz")
vim.keymap.set("n", "{", "{zz")
vim.keymap.set("n", "}", "}zz")

vim.keymap.set("n", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("n", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-h>", "wincmd h<CR>")
vim.keymap.set("n", "<C-j>", "wincmd j<CR>")
vim.keymap.set("n", "<C-k>", "wincmd k<CR>")
vim.keymap.set("n", "<C-l>", "wincmd l<CR>")

vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
