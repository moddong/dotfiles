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
opt.foldmethod = "marker"

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

-- highlight
local p = {
  bg = "#141821",
  bg_alt = "#222738",
  bg_float = "#14131f",
  fg = "#cccccc",
  red = "#ff5f59",
  orange = "#cc853d",
  yellow = "#ccad52",
  gray = "#3d4966",
  green = "#9eb336",
  cyan = "#52bccc",
  blue = "#5c95e6",
  purple = "#957acc",
  teal = "#47b38f",
  none = "NONE",
}

local groups = {

  { "Normal", { fg = p.fg, bg = p.bg } },
  --signcolumn
  { "SignColumn", { bg = p.bg } },
  --buffer
  { "LineNr", { fg = p.gray } },
  { "EndOfBuffer", { fg = p.bg, bg = p.bg } },
  { "Search", { fg = p.yellow, reverse = true } },
  { "Visual", { bg = p.yellow } },
  { "ColorColumn", { bg = p.bg } },
  { "Whitespace", { link = "LineNr" } },
  --window
  { "VertSplit", { fg = p.fg } },
  { "Title", { fg = p.fg, bold = true } },
  --cursorline
  { "Cursorline", { bg = p.bg_alt } },
  { "CursorLineNr", { fg = p.fg, bg = p.bg_alt } },
  --pmenu
  { "Pmenu", { bg = p.bg_float, fg = p.fg } },
  { "PmenuSel", { fg = p.teal } },
  { "PmenuSbar", { fg = "#586e75" } },
  { "PmenuKind", { bg = p.bg_float, fg = p.yellow } },
  { "PmenuKindSel", { link = "PmenuSel" } },
  { "PmenuExtra", { link = "Pmenu" } },
  { "PmenuExtraSel", { link = "PmenuSel" } },
  { "WildMenu", { link = "Pmenu" } },
  --statusline
  { "StatusLine", { fg = p.fg, bg = p.bg } },
  { "StatusLineNC", { fg = p.fg, bg = p.bg } },
  { "WinBar", { bg = p.bg } },
  { "WinBarNC", { bg = p.bg } },
  { "WinSeparator", { bg = p.bg, fg = p.fg } },
  --Error
  { "Error", { fg = p.red, bold = true } },
  { "ErrorMsg", { link = "Error" } },
  --Markup
  { "TODO", { fg = p.fg } },
  { "Conceal", { fg = p.fg } },
  { "NonText", { link = "LineNr" } },
  --Float
  { "FloatBorder", { fg = p.fg } },
  { "NormalFloat", { bg = p.bg } },
  --Fold
  { "Folded", { fg = p.bg, bold = true } },
  { "FoldColumn", { link = "SignColumn" } },
  --Spell
  { "SpellBad", { fg = p.fg } },
  { "SpellCap", { undercurl = true, sp = p.none } },
  { "SpellRare", { undercurl = true, fg = p.fg } },
  { "SpellLocal", { undercurl = true } },
  --Msg
  { "WarningMsg", { fg = p.green } },
  { "MoreMsg", { fg = p.green } },
  --Internal
  { "NvimInternalError", { fg = p.red } },
  { "Directory", { fg = p.fg } },
  --------------------------------------------------------
  ---
  ---@Langauge Relate
  ---@Identifier
  { "Identifier", { fg = p.fg } },
  -- various variable names
  { "@variable", { fg = p.fg } },
  --built-in variable names (e, {g, `this`)
  { "@variable.builtin", { fg = p.fg } },
  { "Constant", { fg = p.fg } },
  { "@constant.builtin", { link = "Constant" } },
  -- constants defined by the preprocessor
  { "@constant.macro", { link = "Constant" } },
  --modules or namespaces
  { "@namespace", { fg = p.fg } },
  --symbols or atoms
  -- ['@symbol'] = exe}},
  --------------------------------------------------------
  ---@Keywords
  { "Keyword", { fg = p.fg } },
  { "@keyword.function", { link = "Keyword" } },
  { "@keyword.return", { link = "Keyword" } },
  { "@keyword.operat", { link = "Operator" } },
  --if else
  { "Conditional", { link = "Keyword" } },
  --for while
  { "Repeat", { link = "Conditional" } },
  --for attribute
  { "@attribute", { link = "Keyword" } },
  { "Debug", { fg = p.fg } },
  { "Label", { fg = p.fg } },
  { "PreProc", { fg = p.fg } },
  { "Include", { link = "PreProc" } },
  { "Exception", { fg = p.fg } },
  { "Statement", { fg = p.fg } },
  { "SpecialKey", { link = "LineNr" } },
  { "Special", { link = "LineNr" } },
  --------------------------------------------------------
  ---@Types
  { "Type", { fg = p.fg } },
  { "@type.builtin", { link = "Type" } },
  --type definitions (e, {g, `typedef` in C)
  { "@type.definition", { link = "Type" } },
  --type qualifiers (e, {g, `const`)
  { "@type.qualifier", { link = "KeyWord" } },
  --modifiers that affect storage in memory or life-time like C `static`
  { "@storageclass", { link = "Keyword" } },
  { "@field", { fg = p.fg } },
  { "@property", { link = "@field" } },
  --------------------------------------------------------
  ---@Functions
  { "Function", { fg = p.fg } },
  --built-in functions
  { "@function.builtin", { link = "Function" } },
  --function calls
  { "@function.call", { link = "Function" } },
  --preprocessor macros
  { "@function.macro", { link = "Function" } },
  { "@method", { link = "Function" } },
  { "@method.call", { link = "Function" } },
  { "@constructor", { fg = p.n_orange } },
  { "@parameter", { link = "@variable" } },
  --------------------------------------------------------
  ---@Literals
  { "String", { fg = p.fg } },
  { "Number", { fg = p.fg } },
  { "Float", { link = "Number" } },
  { "Boolean", { link = "Constant" } },
  --
  { "Define", { link = "PreProc" } },
  { "Operator", { fg = p.fg } },
  { "Comment", { link = "LineNr" } },
  --------------------------------------------------------
  ---@punctuation
  { "@punctuation.bracket", { fg = p.fg } },
  { "@punctuation.delimiter", { fg = p.fg } },
  --------------------------------------------------------
  ---@Tag
  { "@tag.html", { fg = p.fg } },
  { "@tag.attribute.html", { link = "@property" } },
  { "@tag.delimiter.html", { link = "@punctuation.delimiter" } },
  { "@tag.javascript", { link = "@tag.html" } },
  { "@tag.attribute.javascript", { link = "@tag.attribute.html" } },
  { "@tag.delimiter.javascript", { link = "@tag.delimiter.html" } },
  { "@tag.typescript", { link = "@tag.html" } },
  { "@tag.attribute.typescript", { link = "@tag.attribute.html" } },
  { "@tag.delimiter.typescript", { link = "@tag.delimiter.html" } },
  --------------------------------------------------------
  ---@Markdown
  { "@text.reference.markdown.inline", { fg = p.fg } },
  ---@Diff
  { "DiffAdd", { fg = p.teal } },
  { "DiffChange", { fg = p.blue } },
  { "DiffDelete", { fg = p.orange } },
  { "DiffText", { fg = p.orange } },
  { "@text.diff.add.diff", { link = "DiffAdd" } },
  { "@text.diff.delete.diff", { link = "DiffDelete" } },
  { "@text.diff.change.diff", { link = "DiffChange" } },
  --------------------------------------------------------
  ---@Diagnostic
  { "DiagnosticError", { link = "Error" } },
  { "DiagnosticWarn", { fg = p.yellow } },
  { "DiagnosticInfo", { fg = p.blue } },
  { "DiagnosticHint", { fg = p.cyan } },
  { "DiagnosticSignError", { link = "DiagnosticError" } },
  { "DiagnosticSignWarn", { link = "DiagnosticWarn" } },
  { "DiagnosticSignInfo", { link = "DiagnosticInfo" } },
  { "DiagnosticSignHint", { link = "DiagnosticHint" } },
  { "DiagnosticUnderlineError", { undercurl = true } },
  { "DiagnosticUnderlineWarn", { undercurl = true } },
  { "DiagnosticUnderlineInfo", { undercurl = true } },
  { "DiagnosticUnderlineHint", { undercurl = true } },
  ---@plugin
  { "GitGutterAdd", { fg = p.teal } },
  { "GitGutterChange", { fg = p.blue } },
  { "GitGutterDelete", { fg = p.red } },
  { "GitGutterChangeDelete", { fg = p.red } },
  --Telescope
  { "TelescopePromptBorder", { bg = p.bg, fg = p.fg } },
  { "TelescopePromptNormal", { bg = p.bg, fg = p.fg } },
  { "TelescopeResultsBorder", { bg = p.bg, fg = p.fg } },
  { "TelescopePreviewBorder", { bg = p.bg, fg = p.fg } },
  { "TelescopeResultsNormal", { fg = p.fg } },
  { "TelescopeSelectionCaret", { fg = p.blue } },
  { "TelescopeMatching", { fg = p.blue } },
  --CursorWord
  { "CursorWord", { bg = p.bg } },
  { "IndentLine", { link = "Comment" } },
  --Lspsaga
  { "SagaVariable", { fg = p.fg } },
  --lsp relate
  { "LspSignatureActiveParameter", { fg = p.yellow, underline = true } },
  --netrw
  { "netrwTreeBar", { link = "Comment" } },
}

g.terminal_color_0 = p.bg
g.terminal_color_1 = p.red
g.terminal_color_2 = p.green
g.terminal_color_3 = p.yellow
g.terminal_color_4 = p.blue
g.terminal_color_5 = p.purple
g.terminal_color_6 = p.cyan
g.terminal_color_7 = p.fg
g.terminal_color_8 = p.fg_dim
g.terminal_color_9 = p.red
g.terminal_color_10 = p.green
g.terminal_color_11 = p.yellow
g.terminal_color_12 = p.blue
g.terminal_color_13 = p.purple
g.terminal_color_14 = p.cyan
g.terminal_color_15 = p.fg

for _, v in pairs(groups) do
  api.nvim_set_hl(0, v[1], v[2])
end

-- statusline
local function statusline(data)
  local stl = { val = "" }
  function stl:append(text, hl)
    self.val = self.val .. string.format("%%#%s#%s %%* ", hl or "StatusLine", text)
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
      stl:append(current == 0 and "" or current .. "/" .. search.total, "Function")
    end
  end
  -- mac record
  if fn.reg_recording() ~= "" then
    stl:append(" REC: " .. fn.reg_recording())
  end

  stl:append("%=")

  return stl.val
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
    pattern = pattern,
    group = stl_group,
    callback = function(opts)
      vim.schedule(function()
        vim.opt.stl = statusline(opts.data)
      end)
    end,
  })
end

local opt_local = vim.opt_local
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*.go"},
  callback = function(ev)
    opt_local.expandtab = false
    opt_local.shiftwidth = 4
    opt_local.softtabstop = 4
    opt_local.tabstop = 4
  end
})
