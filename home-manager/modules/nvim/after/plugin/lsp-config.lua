local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.bashls.setup({ capabilities = capabilities })
lspconfig.clangd.setup({ capabilities = capabilities })
lspconfig.cssls.setup({ capabilities = capabilities })
lspconfig.docker_compose_language_service.setup({ capabilities = capabilities })
lspconfig.dockerls.setup({ capabilities = capabilities })
lspconfig.eslint.setup({ capabilities = capabilities })
lspconfig.gopls.setup({ capabilities = capabilities })
lspconfig.html.setup({ capabilities = capabilities })
lspconfig.jdtls.setup({ capabilities = capabilities })
lspconfig.jsonls.setup({ capabilities = capabilities })
lspconfig.lua_ls.setup({ capabilities = capabilities })
lspconfig.marksman.setup({ capabilities = capabilities })
lspconfig.matlab_ls.setup({ capabilities = capabilities })
lspconfig.nixd.setup({ capabilities = capabilities })
lspconfig.ruff.setup({ capabilities = capabilities })
lspconfig.rust_analyzer.setup({ capabilities = capabilities })
lspconfig.sqls.setup({ capabilities = capabilities })
lspconfig.svelte.setup({ capabilities = capabilities })
lspconfig.tailwindcss.setup({ capabilities = capabilities })
lspconfig.texlab.setup({ capabilities = capabilities })
lspconfig.ts_ls.setup({ capabilities = capabilities })
lspconfig.volar.setup({ capabilities = capabilities })
