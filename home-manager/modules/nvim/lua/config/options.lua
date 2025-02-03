-- line numbers
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"

-- scroll
vim.o.scrolloff = 10

-- tab
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

-- indent
vim.o.smartindent = true
vim.o.autoindent = true

-- search
vim.o.hlsearch = false
vim.incsearch = true

-- others
vim.o.updatetime = 300
vim.o.termguicolors = true
vim.o.swapfile = false
vim.o.clipboard = "unnamedplus"

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})
