require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "emmet_language_server" }
vim.lsp.enable(servers)

vim.lsp.config("ts_ls", {
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = vim.fn.expand "$HOME/.local/share/nvim/mason/packages/vue-language-server/node_modules/@vue/language-server",
        languages = { "vue" },
      },
    },
  },
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
  settings = {
    typescript = {
      inlayHints = {
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    },
    javascript = {
      inlayHints = {
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    },
  },
})
vim.lsp.enable "ts_ls"

vim.lsp.config("eslint", {
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        if vim.fn.exists ":LspEslintFixAll" > 0 then
          vim.cmd "LspEslintFixAll"
        end
      end,
    })
  end,
})
vim.lsp.enable "eslint"

vim.lsp.config("jsonls", {
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
      validate = { enable = true },
    },
  },
})
vim.lsp.enable "jsonls"

vim.lsp.config("vue_ls", {
  init_options = {
    vue = {
      hybridMode = true,
    },
  },
})
vim.lsp.enable "vue_ls"

vim.lsp.enable "tailwindcss"

vim.lsp.config("rust_analyzer", {
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = { command = "clippy" },
      completion = {
        callable = { snippets = "fill_arguments" },
      },
      procMacro = { enable = true },
      cargo = {
        buildScripts = { enable = true },
        features = "all",
      },
    },
  },
})
vim.lsp.enable "rust_analyzer"
