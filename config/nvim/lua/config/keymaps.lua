local keymap = vim.keymap

keymap.set("n", "<c-x>k", "<cmd>bdelete<cr>")
keymap.set("n", "<c-x>d", "<cmd>Vexplore<cr>")
keymap.set("n", "<c-n>", "<cmd>bn<cr>")
keymap.set("n", "<c-p>", "<cmd>bp<cr>")
keymap.set("n", "<c-h>", "<c-w>h")
keymap.set("n", "<c-j>", "<c-w>j")
keymap.set("n", "<c-k>", "<c-w>k")
keymap.set("n", "<c-l>", "<c-w>l")
keymap.set("n", "<a-[>", "<cmd>vertical resize -5<cr>")
keymap.set("n", "<a-]>", "<cmd>vertical resize +5<cr>")

keymap.set("i", "<c-d>", "<del>")
keymap.set("i", "<c-b>", "<left>")
keymap.set("i", "<c-f>", "<right>")
keymap.set("i", "<c-a>", "<home>")
keymap.set("i", "<c-e>", "<end>")
keymap.set("i", "<c-k>", "<c-o>d$")
keymap.set("i", "<c-s>", "<esc>:w<cr>")
keymap.set("i", "<c-n>", "<down>")
keymap.set("i", "<c-p>", "<up>")
keymap.set("i", "<a-j>", "<c-o>o")
keymap.set("i", "<a-k>", "<c-o>O")

keymap.set("c", "<c-d>", "<del>")
keymap.set("c", "<c-b>", "<left>")
keymap.set("c", "<c-f>", "<right>")
keymap.set("c", "<c-a>", "<home>")
keymap.set("c", "<c-e>", "<end>")

keymap.set("i", "<tab>", function()
  if vim.fn.pumvisible() == 1 then
    return "<C-n>"
  elseif vim.snippet.jumpable(1) then
    return "<cmd>lua vim.snippet.jump(1)<cr>"
  else
    return "<TAB>"
  end
end, { expr = true })
keymap.set("i", "<s-tab>", function()
  if vim.fn.pumvisible() == 1 then
    return "<c-p>"
  elseif vim.snippet.jumpable(-1) then
    return "<cmd>lua vim.snippet.jump(-1)<cr>"
  else
    return "<s-tab>"
  end
end, { expr = true })
keymap.set("i", "<cr>", function()
  return vim.fn.pumvisible() == 1 and "<c-y>" or vim.fn.lexima["expand"]("<lt>cr>", "i")
end, { expr = true })

keymap.set("i", "<c-e>", function()
  if vim.fn.pumvisible() == 1 then
    require("epo").disable_trigger()
    return "<c-e>"
  else
    return "<esc>g_a"
  end
end, { expr = true })

keymap.set({ "n", "v" }, "ga", "<cmd>Lspsaga code_action<cr>")
keymap.set({ "n", "t" }, "<A-d>", "<cmd>Lspsaga term_toggle<cr>")
keymap.set("n", "K", "<cmd>Lspsaga hover_doc<cr>")
keymap.set("n", "gh", "<cmd>Lspsaga finder<cr>")
keymap.set("n", "gr", "<cmd>Lspsaga rename<cr>")
keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<cr>")
keymap.set("n", "gp", "<cmd>Lspsaga goto_definition<cr>")
keymap.set("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<cr>")
keymap.set("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<cr>")
keymap.set("n", "<leader>dw", "<cmd>Lspsaga show_workspace_diagnostics<cr>")
keymap.set("n", "<leader>db", "<cmd>Lspsaga show_buf_diagnostics<cr>")
keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<cr>")

keymap.set("n", "gcc", "<cmd>ComComment<cr>")
keymap.set("x", "gcc", ":ComComment<cr>")
keymap.set("n", "gcj", "<cmd>ComAnnotation<cr>")

keymap.set("n", "<Leader>b", "<cmd>FzfLua buffers<cr>")
keymap.set("n", "<Leader>fa", "<cmd>FzfLua live_grep_native<cr>")
keymap.set("n", "<Leader>fs", "<cmd>FzfLua grep_cword<cr>")
keymap.set("n", "<Leader>ff", "<cmd>FzfLua files<cr>")
keymap.set("n", "<Leader>fh", "<cmd>FzfLua helptags<cr>")
keymap.set("n", "<Leader>fo", "<cmd>FzfLua oldfiles<cr>")
keymap.set("n", "<Leader>fg", "<cmd>FzfLua git_files<cr>")
keymap.set("n", "<Leader>gc", "<cmd>FzfLua git_commits<cr>")

keymap.set("n", "<leader>ss", "<cmd>SessionSave<cr>")
keymap.set("n", "<leader>sl", "<cmd>SessionLoad<cr>")

keymap.set("n", "[g", "<cmd>lua require('gitsigns').next_hunk()<cr>")
keymap.set("n", "]g", "<cmd>lua require('gitsigns').next_hunk()<cr>")
