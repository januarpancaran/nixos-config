local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ async = false })
        end,
      })
    end
  end,

  sources = {
    -- Bash
    null_ls.builtins.formatting.shfmt,

    -- Lua
    null_ls.builtins.completion.luasnip,
    null_ls.builtins.formatting.stylua,

    -- Javascript
    require("none-ls.diagnostics.eslint_d"),
    require("none-ls.code_actions.eslint_d"),
    require("none-ls.formatting.eslint_d"),
    null_ls.builtins.formatting.prettierd,

    -- Css
    null_ls.builtins.diagnostics.stylelint,

    -- Markdown
    null_ls.builtins.diagnostics.markdownlint_cli2,

    -- Golang
    null_ls.builtins.formatting.asmfmt,
    null_ls.builtins.diagnostics.golangci_lint,
    null_ls.builtins.formatting.golines,
    null_ls.builtins.formatting.gofumpt,
    null_ls.builtins.diagnostics.staticcheck,

    -- Cpp
    require("none-ls.diagnostics.cpplint").with({
      args = { "--filter=-whitespace,-legal/copyright" },
    }),
    null_ls.builtins.formatting.clang_format,

    -- Python
    null_ls.builtins.formatting.isort,
    null_ls.builtins.formatting.black,
    require("none-ls.diagnostics.ruff"),

    -- Java
    null_ls.builtins.formatting.google_java_format,
    null_ls.builtins.diagnostics.checkstyle.with({
      extra_args = { "-c", "/google_checks.xml" },
    }),

    -- Nix
    null_ls.builtins.formatting.alejandra,

    -- LaTex
    null_ls.builtins.diagnostics.textidote,

    -- Docker
    null_ls.builtins.diagnostics.hadolint,
  },
})
