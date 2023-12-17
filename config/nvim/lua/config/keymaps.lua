local map = function(mode, lhs, rhs, opts)
  vim.keymap.set(mode, lhs, rhs, opts)
end
vim.g.mapleader = ' '

map('n', '<c-x>k', '<cmd>bdelete<cr>')
map('n', '<c-n>', '<cmd>bn<cr>')
map('n', '<c-p>', '<cmd>bp<cr>')
map('n', '<c-h>', '<c-w>h')
map('n', '<c-j>', '<c-w>j')
map('n', '<c-k>', '<c-w>k')
map('n', '<c-l>', '<c-w>l')
map('n', '<a-[>', '<cmd>vertical resize -5<cr>')
map('n', '<a-]>', '<cmd>vertical resize +5<cr>')

map('i', '<c-d>', '<del>')
map('i', '<c-b>', '<left>')
map('i', '<c-f>', '<right>')
map('i', '<c-a>', '<home>')
map('i', '<c-e>', '<end>')
map('i', '<c-k>', '<c-o>d$')
map('i', '<c-s>', '<esc>:w<cr>')
map('i', '<c-n>', '<down>')
map('i', '<c-p>', '<up>')
map('i', '<a-j>', '<c-o>o')
map('i', '<a-k>', '<c-o>O')

map('c', '<c-d>', '<del>')
map('c', '<c-b>', '<left>')
map('c', '<c-f>', '<right>')
map('c', '<c-a>', '<home>')
map('c', '<c-e>', '<end>')

map('i', '<TAB>', function()
  if vim.fn.pumvisible() == 1 then
    return '<C-n>'
  elseif vim.snippet.jumpable(1) then
    return '<cmd>lua vim.snippet.jump(1)<cr>'
  else
    return '<TAB>'
  end
end, { expr = true })

map('i', '<S-TAB>', function()
  if vim.fn.pumvisible() == 1 then
    return '<C-p>'
  elseif vim.snippet.jumpable(-1) then
    return '<cmd>lua vim.snippet.jump(-1)<CR>'
  else
    return '<S-TAB>'
  end
end, { expr = true })

map('i', '<CR>', function()
  return vim.fn.pumvisible() == 1 and '<C-y>'
    or vim.fn.lexima['expand']('<LT>CR>', 'i')
end, { expr = true })

map('i', '<c-e>', function()
  if vim.fn.pumvisible() == 1 then
    require('epo').disable_trigger()
    return '<c-e>'
  else
    return '<Esc>g_a'
  end
end, { expr = true })

map({ 'n', 'v' }, 'ga', '<cmd>Lspsaga code_action<cr>')
map({ 'n', 't' }, '<A-d>', '<cmd>Lspsaga term_toggle<cr>')
map('n', 'K', '<cmd>Lspsaga hover_doc<cr>')
map('n', 'gh', '<cmd>Lspsaga finder<cr>')
map('n', 'gr', '<cmd>Lspsaga rename<cr>')
map('n', 'gd', '<cmd>Lspsaga peek_definition<cr>')
map('n', 'gp', '<cmd>Lspsaga goto_definition<cr>')
map('n', '[e', '<cmd>Lspsaga diagnostic_jump_prev<cr>')
map('n', ']e', '<cmd>Lspsaga diagnostic_jump_next<cr>')
map('n', '<leader>dw', '<cmd>Lspsaga show_workspace_diagnostics<cr>')
map('n', '<leader>db', '<cmd>Lspsaga show_buf_diagnostics<cr>')
map('n', '<leader>o', '<cmd>Lspsaga outline<cr>')

map('n', 'gcc', '<cmd>ComComment<cr>')
map('x', 'gcc', ':ComComment<cr>')
map('n', 'gcj', '<cmd>ComAnnotation<cr>')

map('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
map('n', '<leader>b', '<cmd>Telescope buffers<cr>')
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')
map('n', '<leader>fb', '<cmd>Telescope file_browser<cr>')

map('n', '<leader>ss', '<cmd>SessionSave<cr>')
map('n', '<leader>sl', '<cmd>SessionLoad<cr>')

map('n', '[g', '<cmd>lua require("gitsigns").next_hunk()<cr>')
map('n', ']g', '<cmd>lua require("gitsigns").next_hunk()<cr>')
