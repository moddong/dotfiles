return {
  "ibhagwan/fzf-lua",
  cmd = "FzfLua",
  config = function()
    require("fzf-lua").setup({ "max-perf" })
  end,
}
