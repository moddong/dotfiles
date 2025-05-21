return {
  'neovim/nvim-lspconfig',
  ft = {
    'go',
    'lua',
    'rust',
    'c',
    'cpp',
    'python',
    'javascript',
    'javascriptreact',
    'json',
    'haskell',
  },
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'nvimdev/lspsaga.nvim',
  },
  config = function()
    local lspsaga = require('lspsaga')
    lspsaga.setup({
      lightbulb = { enable = false },
    })
    vim.lsp.log.set_level(vim.log.levels.OFF)

    vim.diagnostic.config({
      virtual_text = { current_line = true },
      signs = {
        text = { '●', '●', '●', '●' },
      },
    })

    vim.lsp.config('lua_ls', {
      on_init = function(client)
        if client.workspace_folders then
          local path = client.workspace_folders[1].name
          if
            path ~= vim.fn.stdpath('config')
            and (
              vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc')
            )
          then
            return
          end
        end

        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
          runtime = {
            version = 'LuaJIT',
          },
          workspace = {

            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME,
            },
          },
        })
      end,
      settings = {
        Lua = {},
      },
    })

    vim.lsp.config('clangd', {
      cmd = { 'clangd', '--background-index', '--header-insertion=never' },
      init_options = { fallbackFlags = { vim.bo.filetype == 'cpp' and '-std=c++23' or nil } },
      root_markers = {
        '.clangd',
        '.clang-tidy',
        '.clang-format',
        'compile_commands.json',
        'compile_flags.txt',
        -- 'configure.ac',
        '.git',
      },
    })

    vim.lsp.config('rust_analyzer', {
      settings = {
        ['rust-analyzer'] = {
          imports = {
            granularity = {
              group = 'module',
            },
            prefix = 'self',
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
    vim.lsp.enable({
      'lua_ls',
      'clangd',
      'rust_analyzer',
      'basedpyright',
      'ruff',
      --'bashls',
      --'zls',
      --'cmake',
      --'jsonls',
      --'ts_ls',
      --'eslint',
      --'tailwindcss',
      --'cssls',
      'hls',
    })
  end,
}
