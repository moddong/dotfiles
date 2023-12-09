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
  --   config = conf.bufferline,
  -- },
  { 'nvim-tree/nvim-web-devicons' },
  {
    'nvimdev/dbsession.nvim',
    cmd = { 'SessionSave', 'SessionDelete', 'SessionLoad' },
    opts = true,
  },
  {
    'folke/tokyonight.nvim',
  },
  {
    'nvimdev/guard.nvim',
    event = 'BufRead',
    ft = { 'c', 'cpp', 'python', 'go', 'rust', 'lua', 'javascriptreact' },
    dependencies = {
      'nvimdev/guard-collection',
    },
    config = function()
      require('config.guard')
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
      require('config.telescope')
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    event = 'BufRead',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function()
      require('config.treesitter')
    end,
  },
  { 'nvimdev/coman.nvim' },
  {
    'neovim/nvim-lspconfig',
    config = function()
      require('config.lspconfig')
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
      },
      outline = {
        detail = false,
      },
    },
  },
  -- {
  --   'nvimdev/epo.nvim',
  --   event = 'LspAttach',
  --   config = function()
  --     require('epo').setup({})
  --   end,
  -- },
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-buffer' },
      {
        'L3MON4D3/LuaSnip',
        config = function()
          require('config.luasnip')
        end,
      },
      { 'saadparwaiz1/cmp_luasnip' },
    },
    config = function()
      require('config.cmp')
    end,
  },
}, {
  lockfile = vim.fn.stdpath('data') .. '/lazy-lock.json',
})
