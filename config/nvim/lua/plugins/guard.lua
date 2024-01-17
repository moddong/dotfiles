local ft = require("guard.filetype")

ft("c"):fmt("clang-format")
ft("cpp"):fmt("clang-format")
ft("lua"):fmt("stylua")
ft("rust"):fmt("rustfmt")
ft("python"):fmt("black")
ft("go"):fmt("lsp"):append("golines")
ft("javascript,typescript,javascriptreact"):fmt("prettier")

require("guard").setup()
