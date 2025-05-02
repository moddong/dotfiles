return {
  'nvim-treesitter/nvim-treesitter',
  event = 'BufRead',
  dependencies = {},
  config = function()
    vim.opt.foldmethod = 'expr'
    vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
    require('nvim-treesitter.configs').setup({
      ensure_installed = {
        'c',
        'cpp',
        'rust',
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
        'markdown',
        'markdown_inline',
        'vimdoc',
      },
      highlight = {
        enable = true,
        disable = function(_, buf)
          local bufname = vim.api.nvim_buf_get_name(buf)
          local max_filesize = 300 * 1024
          local ok, stats = pcall(vim.uv.fs_stat, bufname)
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
        additional_vim_regex_highlighting = false,
      },
    })
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'javascriptreact', 'typescriptreact' },
      callback = function(opt)
        vim.bo[opt.buf].indentexpr = 'nvim_treesitter#indent()'
      end,
    })
  end,
}
