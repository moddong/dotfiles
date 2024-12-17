local lspconfig = require("lspconfig")
local capabilities = vim.tbl_deep_extend(
  "force",
  vim.lsp.protocol.make_client_capabilities(),
  require("epo").register_cap()
)

local function attach(client, _)
  vim.opt.omnifunc = "v:lua.vim.lsp.omnifunc"
  client.server_capabilities.semanticTokensProvider = nil
  local orignal = vim.notify
  local mynotify = function(msg, level, opts)
    if msg == "No code actions available" or msg:find("overly") then
      return
    end
    orignal(msg, level, opts)
  end
  vim.notify = mynotify
end

lspconfig.lua_ls.setup({
  on_attach = attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        enable = true,
        globals = { "vim" },
        disable = {
          "missing-fields",
          "no-unknown",
        },
      },
      runtime = {
        version = "LuaJIT",
        path = vim.split(package.path, ";"),
      },
      workspace = {
        library = {
          vim.env.VIMRUNTIME,
        },
        checkThirdParty = false,
      },
      completion = {
        callSnippet = "Replace",
      },
    },
  },
})

local servers = {
  "clangd",
  "gopls",
  "pyright",
  "rust_analyzer",
}

for _, server in ipairs(servers) do
  lspconfig[server].setup({
    on_attach = attach,
    capabilities = capabilities,
  })
end

vim.lsp.handlers["workspace/diagnostic/refresh"] = function(_, _, ctx)
  local ns = vim.lsp.diagnostic.get_namespace(ctx.client_id)
  local bufnr = vim.api.nvim_get_current_buf()
  vim.diagnostic.reset(ns, bufnr)
  return true
end
