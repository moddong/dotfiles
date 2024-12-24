return {
	"nvimdev/indentmini.nvim",
	event = "BufEnter */*",
	config = function()
		vim.opt.listchars:append({ tab = "  " })
		require("indentmini").setup({
			only_current = true,
		})
	end,
}
