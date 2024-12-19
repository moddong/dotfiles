return {
  "nvimdev/guard.nvim",
  ft = { "c", "cpp", "python", "go", "rust", "lua", "javascript", "javascriptreact" },
  dependencies = {
    "nvimdev/guard-collection",
  },
  config = function()
    local ft = require("guard.filetype")

    ft("c"):fmt("clang-format")
    ft("cpp"):fmt("clang-format")
    ft("lua"):fmt("stylua")
    ft("rust"):fmt("rustfmt")
    ft("python"):fmt("black")
    ft("go"):fmt("lsp"):append("golines")
    ft("javascript,typescript,javascriptreact"):fmt("prettier")

    vim.api.nvim_create_autocmd("User", {
      pattern = "GuardFmt",
      callback = function(args)
        if args.data.status == "done" then
          vim.diagnostic.show()
        end
      end,
    })
  end,
}
