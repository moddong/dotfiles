local lspconfig = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local t = {
  'Error',
  'Warn',
  'Info',
  'Hint',
}

for _, type in ipairs(t) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = '⮞', texthl = hl, numhl = hl })
end

vim.diagnostic.config({
  signs = true,
  severity_sort = true,
  virtual_text = true,
})

vim.lsp.set_log_level('OFF')

-- local signs = {
--   Error = ' ',
--   Warn = ' ',
--   Info = ' ',
--   Hint = ' ',
-- }

-- for type, icon in pairs(signs) do
--   local hl = 'DiagnosticSign' .. type
--   vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
-- end

-- vim.diagnostic.config({
--   signs = true,
--   update_in_insert = false,
--   underline = true,
--   severity_sort = true,
--   virtual_text = {
--     prefix = '🔥',
--     source = true,
--   },
-- })

lspconfig.lua_ls.setup({
  on_attach = function(client, _)
    client.server_capabilities.semanticTokensProvider = nil
  end,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        enable = true,
        globals = { 'vim' },
        disable = {
          'missing-fields',
        },
      },
      runtime = {
        version = 'LuaJIT',
        path = vim.split(package.path, ';'),
      },
      workspace = {
        library = {
          vim.env.VIMRUNTIME,
        },
        checkThirdParty = false,
      },
      completion = {
        callSnippet = 'Replace',
      },
    },
  },
})

lspconfig.clangd.setup({
  capabilities = capabilities,
  cmd = {
    'clangd',
    '--background-index',
    '--suggest-missing-includes',
    '--clang-tidy',
    '--header-insertion=iwyu',
  },
})

lspconfig.gopls.setup({
  cmd = { 'gopls', 'serve' },
  capabilities = capabilities,
  init_options = {
    usePlaceholders = true,
    completeUnimported = true,
  },
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
})

lspconfig.rust_analyzer.setup({
  on_attach = function(client, _)
    client.server_capabilities.semanticTokensProvider = nil
  end,
  settings = {
    ['rust-analyzer'] = {
      imports = {
        granularity = {
          group = 'module',
        },
        prefix = 'self',
      },
      check = {
        command = 'clippy',
      },
      cargo = {
        buildScripts = {
          enable = true,
        },
      },
      procMacro = {
        enable = true,
      },
    },
  },
})

local servers = {
  'pyright',
  'bashls',
  'html',
  'cssls',
  'tsserver',
  'tailwindcss',
}

for _, server in ipairs(servers) do
  lspconfig[server].setup({
    capabilities = capabilities,
  })
end

vim.lsp.handlers['workspace/diagnostic/refresh'] = function(_, _, ctx)
  local ns = vim.lsp.diagnostic.get_namespace(ctx.client_id)
  local bufnr = vim.api.nvim_get_current_buf()
  vim.diagnostic.reset(ns, bufnr)
  return true
end
