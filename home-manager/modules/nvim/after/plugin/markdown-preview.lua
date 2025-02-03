local markdown_group = vim.api.nvim_create_augroup("MarkdownSettings", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = markdown_group,
  pattern = "markdown",
  callback = function()
    vim.g.mkdp_filetypes = { "markdown" }

    vim.keymap.set("n", "<C-m>", ":MarkdownPreview<CR>", {
      silent = true,
      buffer = true,
    })
  end,
})

vim.cmd([[
  command! MarkdownPreviewToggle lua require("markdown-preview").toggle()
  command! MarkdownPreview lua require("markdown-preview").open()
  command! MarkdownPreviewStop lua require("markdown-preview").close()
]])
