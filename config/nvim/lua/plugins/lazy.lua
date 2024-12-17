local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.api.nvim_command("!git clone https://github.com/folke/lazy.nvim.git " .. lazypath)
end
vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup({
  { "windwp/nvim-autopairs", event = "InsertEnter", opts = true },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufRead", "BufNewFile" },
    opts = {},
  },
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzy-native.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
    },
    config = function()
      require("plugins.telescope")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufRead",
    dependencies = {},
    config = function()
      require("plugins.treesitter")
    end,
  },
  {
    "neovim/nvim-lspconfig",
    ft = { "go", "lua", "rust", "c", "cpp", "python", "javascript", "javascriptreact", "json" },
    config = function()
      require("plugins.lspconfig")
    end,
  },
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    cmd = "Lspsaga term_toggle",
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      { "nvim-treesitter/nvim-treesitter" },
    },
    config = function()
      require("plugins.lspsaga")
    end,
  },
  {
    "nvimdev/epo.nvim",
    event = "LspAttach",
    opts = true,
  },
  { "nvimdev/coman.nvim" },
  {
    "nvimdev/whiskyline.nvim",
    event = "BufEnter",
    opts = true,
  },
  {
    "nvimdev/dbsession.nvim",
    cmd = { "SessionSave", "SessionDelete", "SessionLoad" },
    opts = true,
  },
  {
    "nvimdev/guard.nvim",
    ft = { "c", "cpp", "python", "go", "rust", "lua", "javascript", "javascriptreact" },
    dependencies = {
      "nvimdev/guard-collection",
    },
    config = function()
      require("plugins.guard")
    end,
  },
  {
    "nvimdev/hlsearch.nvim",
    event = "BufRead",
    opts = true,
  },
  {
    "nvimdev/indentmini.nvim",
    event = "BufEnter",
    opts = true,
  },
}, {
  lockfile = vim.fn.stdpath("data") .. "/lazy-lock.json",
})
