vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "c",
    "cpp",
    "rust",
    "go",
    "lua",
    "python",
    "cmake",
    "ninja",
    "make",
    "bash",
    "css",
    "html",
    "javascript",
    "tsx",
    "markdown",
    "markdown_inline",
    "vimdoc",
  },
  highlight = {
    enable = true,
    disable = function(_, buf)
      return vim.api.nvim_buf_line_count(buf) > 3000
    end,
  },
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "javascriptreact", "typescriptreact" },
  callback = function(opt)
    vim.bo[opt.buf].indentexpr = "nvim_treesitter#indent()"
  end,
})
