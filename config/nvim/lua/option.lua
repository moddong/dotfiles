local g, opt = vim.g, vim.opt

opt.termguicolors = true
opt.hidden = true
opt.encoding = 'utf-8'
opt.clipboard = 'unnamedplus'
opt.number = true
opt.cursorline = true
opt.textwidth = 80
opt.colorcolumn = '80'
opt.smarttab = true
opt.expandtab = true
opt.autoindent = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.splitright = true
opt.softtabstop = -1
opt.laststatus = 3
opt.history = 200
opt.display = 'lastline'
opt.wildmenu = true
opt.infercase = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true
opt.autoread = true
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.shiftround = true
opt.wrap = false
opt.timeout = true
opt.ttimeout = true
opt.timeoutlen = 500
opt.ttimeoutlen = 10
opt.updatetime = 100
opt.redrawtime = 1500
opt.list = true
opt.listchars = 'trail:·,tab:»·,nbsp:+,'
opt.showmode = false
opt.signcolumn = 'yes'
opt.foldenable = false
opt.foldlevel = 99
opt.cmdheight = 0

-- wsl yanking to windows clipboard
if vim.fn.has('wsl') == 1 then
  opt.clipboard = ''
  g.clipboard = {
    name = 'win32yank-wsl',
    copy = {
      ['+'] = 'win32yank.exe -i --crlf',
      ['*'] = 'win32yank.exe -i --crlf',
    },
    paste = {
      ['+'] = 'win32yank.exe -o --lf',
      ['*'] = 'win32yank.exe -o --lf',
    },
    cache_enable = 0,
  }
end
