local ls = require('luasnip')
ls.config.set_config({
  delete_check_events = 'TextChanged,InsertEnter',
})
require('luasnip.loaders.from_vscode').lazy_load({
  paths = { vim.fn.stdpath('config') .. '/snippets' },
})
