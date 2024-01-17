local g, opt = vim.g, vim.opt

g.loaded_gzip = 1
g.loaded_tar = 1
g.loaded_tarPlugin = 1
g.loaded_zip = 1
g.loaded_zipPlugin = 1
g.loaded_getscript = 1
g.loaded_getscriptPlugin = 1
g.loaded_vimball = 1
g.loaded_vimballPlugin = 1
g.loaded_matchit = 1
g.loaded_matchparen = 1
g.loaded_2html_plugin = 1
g.loaded_logiPat = 1
g.loaded_rrhelper = 1

g.netrw_winsize = 25
g.netrw_banner = 0
g.mapleader = " "

opt.hidden = true
opt.magic = true
opt.virtualedit = "block"
opt.clipboard = "unnamedplus"
opt.wildignorecase = true
opt.swapfile = false

opt.history = 2000
opt.timeout = true
opt.ttimeout = true
opt.timeoutlen = 500
opt.ttimeoutlen = 10
opt.updatetime = 100
opt.redrawtime = 1500
opt.ignorecase = true
opt.smartcase = true
opt.infercase = true
opt.cursorline = true

opt.completeopt = "menu,menuone,noinsert"
opt.showmode = false
opt.shortmess = "aoOTIcF"
opt.scrolloff = 2
opt.sidescrolloff = 5
opt.ruler = false
opt.showtabline = 0
opt.winwidth = 30
opt.pumheight = 15
opt.showcmd = false

opt.cmdheight = 0
opt.laststatus = 3
opt.list = true

opt.listchars = "tab:»·»,nbsp:+,trail:·,extends:→,precedes:←,"
opt.pumblend = 10
opt.winblend = 0
opt.undofile = true

opt.smarttab = true
opt.expandtab = true
opt.autoindent = true
opt.tabstop = 4
opt.shiftwidth = 4

opt.foldlevelstart = 99
opt.foldmethod = "marker"

opt.splitright = true
opt.wrap = false

opt.number = true
opt.signcolumn = "yes"
opt.spelloptions = "camel"

opt.textwidth = 100
opt.colorcolumn = "100"

-- vim.cmd("colorscheme day")
vim.cmd("colorscheme night")
-- vim.cmd("colorscheme pure")

-- wsl yanking to windows clipboard
if vim.fn.has("wsl") == 1 then
  opt.clipboard = ""
  g.clipboard = {
    name = "win32yank-wsl",
    copy = {
      ["+"] = "win32yank.exe -i --crlf",
      ["*"] = "win32yank.exe -i --crlf",
    },
    paste = {
      ["+"] = "win32yank.exe -o --lf",
      ["*"] = "win32yank.exe -o --lf",
    },
    cache_enable = 0,
  }
end
