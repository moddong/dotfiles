vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'c',
    'cpp',
    'go',
    'lua',
    'python',
    'cmake',
    'ninja',
    'make',
    'bash',
    'css',
    'html',
    'javascript',
    'tsx',
    'typescript',
    'markdown',
    'markdown_inline',
  },
  highlight = {
    enable = true,
    disable = function(_, buf)
      local max_filesize = 1024 * 1024 -- 1MB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,
  },
  textobjects = {
    select = {
      enable = true,
      keymaps = {
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
  },
})
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'javascriptreact', 'typescriptreact' },
  callback = function(opt)
    vim.bo[opt.buf].indentexpr = 'nvim_treesitter#indent()'
  end,
})
