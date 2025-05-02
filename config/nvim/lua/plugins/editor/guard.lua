return {
  'nvimdev/guard.nvim',
  ft = { 'c', 'cpp', 'python', 'go', 'rust', 'lua', 'javascript', 'javascriptreact' },
  dependencies = {
    'nvimdev/guard-collection',
  },
  config = function()
    local ft = require('guard.filetype')

    ft('python'):fmt('black'):lint('mypy')
    ft('go'):fmt('lsp'):append('golines')
    ft('rust'):fmt('rustfmt')
    ft('typescript', 'javascript', 'typescriptreact', 'javascriptreact'):fmt('prettier')
    ft('haskell'):fmt('ormolu'):lint('hlint')
    ft('c,cpp'):fmt({
      cmd = 'clang-format',
      stdin = true,
      ignore_patterns = { 'neovim', 'vim' },
    })

    ft('lua'):fmt({
      cmd = 'stylua',
      args = { '-' },
      stdin = true,
      ignore_patterns = 'function.*_spec%.lua',
      find = '.stylua.toml',
    })

    vim.api.nvim_create_autocmd('User', {
      pattern = 'GuardFmt',
      callback = function(args)
        if args.data.status == 'done' then
          vim.diagnostic.show()
        end
      end,
    })
  end,
}
