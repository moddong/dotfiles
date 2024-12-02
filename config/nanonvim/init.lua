local g, opt, keymap, fn, api = vim.g, vim.opt, vim.keymap, vim.fn, vim.api
-- options
g.netrw_winsize = 25
g.netrw_banner = 0
g.mapleader = " "

opt.hidden = true
opt.magic = true
opt.virtualedit = "block"
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
opt.tabstop = 2
opt.shiftwidth = 2

opt.foldlevelstart = 99
opt.foldmethod = "syntax"

opt.splitright = true
opt.wrap = false

opt.number = true
opt.signcolumn = "yes"
opt.spelloptions = "camel"

opt.textwidth = 100
opt.colorcolumn = "100"

opt.background = "dark"
opt.termguicolors = true

-- keymap
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
keymap.set("n", "<a-d>", "<cmd>Term<cr>")

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


opt.termguicolors = true

--term
api.nvim_create_user_command("Term", function()
  local win = api.nvim_open_win(api.nvim_create_buf(true, false), true, {
    relative = "editor",
    width = math.ceil(vim.o.co),
    height = math.ceil(vim.o.lines * 0.45),
    row = math.ceil(0.55 * vim.o.lines),
    col = 0,
    style = "minimal",
    border = { "═", "═", "═", "", "", "", "", "" },
  })

  vim.fn.termopen(vim.o.shell, {
    cwd = vim.fn.getcwd(),
    on_exit = function()
      vim.cmd("bd %")
    end,
  })
  vim.cmd.startinsert()
end, { nargs = 0, bang = true })

-- statusline
local function statusline()
  local stl = { contents = "" }
  function stl:append(text)
    self.contents = self.contents .. string.format("%%#StatusLine#%s %%* ", text)
  end

  -- modeinfo
  stl:append(api.nvim_get_mode().mode:upper())
  -- fileencode
  stl:append(vim.o.fileencoding)
  -- fileinfo
  stl:append("%f %P")
  -- modified
  stl:append('%{&modified?"**":"--"}')
  -- lnumcol
  stl:append("%-5.(%l:%c%)")
  -- tab info
  local tabs = api.nvim_list_tabpages()
  if #tabs > 1 then
    stl:append(1 + vim.fn.index(tabs, api.nvim_get_current_tabpage()) .. ":" .. #tabs)
  end
  -- hlsearch
  if vim.v.hlsearch == 1 then
    local search = fn.searchcount()
    if search.total and search.total > 0 then
      local current = search.current
      stl:append(current == 0 and "" or current .. "/" .. search.total)
    end
  end
  -- mac record
  if fn.reg_recording() ~= "" then
    stl:append(" REC: " .. fn.reg_recording())
  end

  stl:append("%=")

  return stl.contents
end

local events = {
  "ModeChanged",
  "BufEnter",
  "BufWrite",
  "TabEnter",
  "TabNewEntered",
  "TabClosed",
  "CursorHold",
  "CursorMoved",
  "DiagnosticChanged",
  "RecordingEnter",
  "RecordingLeave",
  "CmdlineEnter",
  "CmdlineLeave",
}

local stl_group = api.nvim_create_augroup("StatusLine", {})
for _, e in ipairs(events) do
  api.nvim_create_autocmd(e, {
    pattern = { "*" },
    group = stl_group,
    callback = function()
      vim.schedule(function()
        vim.opt.stl = statusline()
      end)
    end,
  })
end
local colors = {
  base04 = '#00202b',
  base03 = '#002936',
  base02 = '#073642',
  base01 = '#586e75',
  base00 = '#657b83',
  base0 = '#839496',
  base1 = '#93a1a1',
  base2 = '#eee8d5',
  base3 = '#fdf6e3',
  yellow = '#b58900',
  orange = '#b86114',
  red = '#d75f5f',
  violet = '#887ec8',
  blue = '#268bd2',
  cyan = '#2aa198',
  green = '#84a800',
  magenta = '#d33682',
  -- Custom modifications
  fg = '#b6b6b6', -- Brighter foreground
}

vim.g.colors_name = 'solarized'

local function shl(group, properties)
  vim.api.nvim_set_hl(0, group, properties)
end

local function load_solarized()
  -- General editor highlights
  shl('Normal', { fg = colors.fg, bg = colors.base03 })
  shl('EndOfBuffer', { fg = colors.base03 })
  shl('CursorLine', { bg = colors.base02 })
  shl('CursorLineNr', { fg = colors.base1, bg = colors.base02 })
  shl('LineNr', { fg = colors.base01 })
  shl('Comment', { fg = colors.base01, italic = true })
  shl('String', { fg = colors.cyan })
  shl('Function', { fg = colors.blue })
  shl('Keyword', { fg = colors.green, bold = true })
  shl('Constant', { fg = colors.violet })
  shl('Identifier', { fg = colors.blue })
  shl('Statement', { fg = colors.green })
  shl('Number', { link = 'Constant' })
  shl('PreProc', { fg = colors.orange })
  shl('Type', { fg = colors.yellow })
  shl('Special', { fg = colors.orange })
  shl('Operator', { fg = colors.base0 })
  shl('Underlined', { fg = colors.violet, underline = true })
  shl('Todo', { fg = colors.magenta, bold = true })
  shl('Error', { fg = colors.red, bg = colors.base03, bold = true })
  shl('WarningMsg', { fg = colors.orange })
  shl('IncSearch', { fg = colors.base03, bg = colors.orange })
  shl('Search', { fg = colors.base03, bg = colors.yellow })
  shl('Visual', { fg = colors.base01, bg = colors.base03, reverse = true })
  shl('Pmenu', { fg = colors.base0, bg = colors.base04 })
  shl('PmenuMatch', { fg = colors.cyan, bg = colors.base04, bold = true })
  shl('PmenuMatchSel', { fg = colors.cyan, bg = colors.base00, bold = true })
  shl('PmenuSel', { fg = colors.base3, bg = colors.base00 })
  shl('PmenuSbar', { bg = colors.base1 })
  shl('PmenuThumb', { bg = colors.base01 })
  shl('MatchParen', { bg = colors.base02 })
  shl('WinBar', { bg = colors.base02 })
  shl('NormalFloat', { bg = colors.base02 })
  shl('FloatBorder', { fg = colors.blue })
  shl('Title', { fg = colors.yellow })
  shl('WinSeparator', { fg = colors.base00 })
  shl('StatusLine', { bg = colors.base1, fg = colors.base02 })
  shl('StatusLineNC', { bg = colors.base00, fg = colors.base02 })
  shl('ModeMsg', { fg = colors.cyan })
  shl('ColorColumn', { bg = colors.base02 })
  shl('Title', { fg = colors.orange })
  shl('WildMenu', { fg = colors.base2, bg = colors.base02, reverse = true })
  shl('Folded', { bg = colors.base02, fg = colors.base0 })

  -- Treesitter highlights
  shl('@function', { fg = colors.blue })
  shl('@function.builtin', { fg = colors.blue })
  shl('@variable', { fg = colors.fg })
  shl('@variable.builtin', { fg = colors.fg })
  shl('@keyword', { fg = colors.green })
  shl('@keyword.import', { link = 'PreProc' })
  shl('@string', { fg = colors.cyan })
  shl('@string.escape', { fg = colors.cyan })
  shl('@string.regexp', { fg = colors.cyan })
  shl('@comment', { fg = colors.base01, italic = true })
  shl('@type', { fg = colors.yellow })
  shl('@type.builtin', { link = '@type' })
  shl('@constant', { link = 'Constant' })
  shl('@constant.builtin', { link = 'Constant' })
  shl('@constant.macro', { link = 'Constant' })
  shl('@constructor', { link = 'Function' })
  shl('@parameter', { fg = colors.base0 })
  shl('@class', { fg = colors.yellow })
  shl('@method', { fg = colors.blue })
  shl('@property', { link = '@variable' })
  shl('@field', { fg = colors.base0 })
  shl('@interface', { fg = colors.yellow })
  shl('@namespace', { fg = colors.base0 })
  shl('@punctuation', { fg = colors.base0 })
  shl('@operator', { link = 'Operator' })
  shl('@attribute', { fg = colors.yellow })
  shl('@boolean', { link = 'Constant' })
  shl('@number', { link = 'Number' })
  shl('@tag', { fg = colors.green })
  shl('@tag.attribute', { fg = colors.base0 })
  shl('@tag.delimiter', { fg = colors.base0 })

  -- Diagnostics
  shl('DiagnosticError', { fg = colors.red })
  shl('DiagnosticWarn', { fg = colors.yellow })
  shl('DiagnosticInfo', { fg = colors.blue })
  shl('DiagnosticHint', { fg = colors.cyan })
  shl('DiagnosticUnderlineError', { undercurl = true, sp = colors.red })
  shl('DiagnosticUnderlineWarn', { undercurl = true, sp = colors.yellow })
  shl('DiagnosticUnderlineInfo', { undercurl = true, sp = colors.blue })
  shl('DiagnosticUnderlineHint', { undercurl = true, sp = colors.cyan })

  -- LSP
  shl('LspReferenceText', { bg = colors.base02 })
  shl('LspReferenceRead', { bg = colors.base02 })
  shl('LspReferenceWrite', { bg = colors.base02 })

  -- Indentmini
  shl('IndentLine', { link = 'Comment' })
  shl('IndentLineCurrent', { link = 'Comment' })

  -- GitSigns
  shl('GitSignsAdd', { fg = colors.green, bg = colors.base03 })
  shl('GitSignsChange', { fg = colors.yellow, bg = colors.base03 })
  shl('GitSignsDelete', { fg = colors.red, bg = colors.base03 })
  shl('DashboardHeader', { fg = colors.green })
  shl('ModeLineMode', { bold = true })
end

load_solarized()

local opt_local = vim.opt_local
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*.go" },
  callback = function(ev)
    opt_local.expandtab = false
    opt_local.shiftwidth = 4
    opt_local.softtabstop = 4
    opt_local.tabstop = 4
  end,
})
