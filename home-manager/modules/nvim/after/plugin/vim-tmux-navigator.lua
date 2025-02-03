vim.cmd([[
  command! TmuxNavigateLeft lua require('vim-tmux-navigator').navigate_left()
  command! TmuxNavigateDown lua require('vim-tmux-navigator').navigate_down()
  command! TmuxNavigateUp lua require('vim-tmux-navigator').navigate_up()
  command! TmuxNavigateRight lua require('vim-tmux-navigator').navigate_right()
  command! TmuxNavigatePrevious lua require('vim-tmux-navigator').navigate_previous()
  command! TmuxNavigatorProcessList lua require('vim-tmux-navigator').process_list()
]])

vim.keymap.set("n", "<C-h>", ":TmuxNavigateLeft<CR>", { silent = true })
vim.keymap.set("n", "<C-j>", ":TmuxNavigateDown<CR>", { silent = true })
vim.keymap.set("n", "<C-k>", ":TmuxNavigateUp<CR>", { silent = true })
vim.keymap.set("n", "<C-l>", ":TmuxNavigateRight<CR>", { silent = true })
vim.keymap.set("n", "<C-\\>", ":TmuxNavigatePrevious<CR>", { silent = true })
