-- line numbers
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"

-- scroll
vim.o.scrolloff = 10
vim.o.wrap = false

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

-- undo
vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.o.undofile = true

-- others
vim.o.updatetime = 50
vim.o.termguicolors = true
vim.o.guicursor = ""
vim.o.clipboard = "unnamedplus"

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})
