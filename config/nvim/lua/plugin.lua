local conf = require('config')

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
  vim.api.nvim_command(
    '!git clone https://github.com/folke/lazy.nvim.git ' .. lazypath
  )
end
vim.opt.runtimepath:prepend(lazypath)

require('lazy').setup({
  -- {
  --   'nvimdev/whiskyline.nvim',
  --    event = 'BufEnter',
  --   dependencies = { 'nvim-tree/nvim-web-devicons' },
  --   config = conf.whisky,
  -- },
  {
    'nvimdev/dbsession.nvim',
    cmd = { 'SessionSave', 'SessionDelete', 'SessionLoad' },
    opts = true,
  },
  {
    'nvimdev/guard.nvim',
    ft = { 'c', 'cpp', 'python', 'go', 'rust', 'lua', 'javascriptreact' },
    config = conf.guard,
  },
  { 'nvimdev/hlsearch.nvim', event = 'BufRead', config = conf.hlsearch },
  {
    'nvimdev/indentmini.nvim',
    event = 'BufEnter',
    config = conf.indentmini,
  },
  { 'windwp/nvim-autopairs', event = 'InsertEnter', config = conf.autopairs },
  {
    'lewis6991/gitsigns.nvim',
    event = { 'BufRead', 'BufNewFile' },
    config = conf.gitsigns,
  },
  {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-fzy-native.nvim',
      'nvim-telescope/telescope-file-browser.nvim',
    },
    config = conf.telescope,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    event = 'BufRead',
    config = conf.nvim_treesitter,
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
  },
  { 'nvimdev/coman.nvim' },
  { 'neovim/nvim-lspconfig', config = conf.nvim_lsp },
  {
    'nvimdev/lspsaga.nvim',
    event = 'LspAttach',
    cmd = 'Lspsaga term_toggle',
    dependencies = {
      { 'nvim-tree/nvim-web-devicons' },
      { 'nvim-treesitter/nvim-treesitter' },
    },
    config = conf.lspsaga,
  },
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-buffer' },
      { 'L3MON4D3/LuaSnip', config = conf.lua_snip },
      { 'saadparwaiz1/cmp_luasnip' },
    },
    config = conf.nvim_cmp,
  },
}, {
  lockfile = vim.fn.stdpath('data') .. '/lazy-lock.json',
})
