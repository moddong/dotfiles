local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
  vim.api.nvim_command(
    '!git clone https://github.com/folke/lazy.nvim.git ' .. lazypath
  )
end
vim.opt.runtimepath:prepend(lazypath)

require('lazy').setup({
  -- { 'akinsho/bufferline.nvim',
  --   dependencies = { 'nvim-tree/nvim-web-devicons' },
  --   config = plugins.bufferline,
  -- },
  { 'nvim-tree/nvim-web-devicons' },
  {
    'nvimdev/dbsession.nvim',
    cmd = { 'SessionSave', 'SessionDelete', 'SessionLoad' },
    opts = true,
  },
  {
    'nvimdev/guard.nvim',
    event = 'BufRead',
    ft = { 'c', 'cpp', 'python', 'go', 'rust', 'lua', 'javascriptreact' },
    dependencies = {
      'nvimdev/guard-collection',
    },
    config = function()
      require('plugins.guard')
    end,
  },
  { 'nvimdev/hlsearch.nvim', event = 'BufRead', opts = true },
  {
    'nvimdev/indentmini.nvim',
    event = 'BufEnter',
    opts = true,
  },
  { 'windwp/nvim-autopairs', event = 'InsertEnter', opts = true },
  {
    'lewis6991/gitsigns.nvim',
    event = { 'BufRead', 'BufNewFile' },
    opts = {},
  },
  {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-fzy-native.nvim',
      'nvim-telescope/telescope-file-browser.nvim',
    },
    config = function()
      require('plugins.telescope')
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    event = 'BufRead',
    dependencies = {},
    config = function()
      require('plugins.treesitter')
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    ft = { 'c', 'rust', 'go', 'lua', 'cpp' },
    config = function()
      vim.defer_fn(function()
        require('nvim-treesitter.configs').setup({
          textobjects = {
            select = {
              enable = true,
              keymaps = {
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',
                ['ac'] = '@class.outer',
                ['ic'] = { query = '@class.inner' },
              },
            },
          },
        })
      end, 0)
    end,
  },
  { 'nvimdev/coman.nvim' },
  {
    'neovim/nvim-lspconfig',
    config = function()
      require('plugins.lspconfig')
    end,
  },
  {
    'nvimdev/lspsaga.nvim',
    event = 'LspAttach',
    cmd = 'Lspsaga term_toggle',
    dependencies = {
      { 'nvim-tree/nvim-web-devicons' },
      { 'nvim-treesitter/nvim-treesitter' },
    },
    opts = {
      symbol_in_winbar = {
        hide_keyword = true,
        folder_level = 0,
      },
      outline = {
        detail = false,
        layout = 'float',
      },
    },
  },
  {
    'nvimdev/epo.nvim',
    event = 'LspAttach',
    opts = true,
  },
  {
    'nvimdev/rapid.nvim',
    cmd = 'Rapid',
    config = function()
      require('rapid').setup()
    end
  },
  -- {
  --   'hrsh7th/nvim-cmp',
  --   event = 'InsertEnter',
  --   dependencies = {
  --     { 'hrsh7th/cmp-nvim-lsp' },
  --     { 'hrsh7th/cmp-buffer' },
  --     {
  --       'L3MON4D3/LuaSnip',
  --       config = function()
  --         require('plugins.luasnip')
  --       end,
  --     },
  --     { 'saadparwaiz1/cmp_luasnip' },
  --   },
  --   config = function()
  --     require('plugins.cmp')
  --   end,
  -- },
}, {
  lockfile = vim.fn.stdpath('data') .. '/lazy-lock.json',
})
