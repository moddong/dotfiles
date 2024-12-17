local p = {
  bg_dark = "#e9e9ec",
  bg = "#fafafa",
  bg_float = "#e9e9ec",
  bg_highlight = "#c4c8da",
  bg_popup = "#e9e9ec",
  bg_search = "#7890dd",
  bg_sidebar = "#e9e9ec",
  bg_statusline = "#e1e2e7",
  bg_visual = "#b6bfe2",
  black = "#e9e9ed",
  blue0 = "#7890dd",
  blue1 = "#188092",
  blue2 = "#07879d",
  blue = "#2e7de9",
  blue5 = "#006a83",
  blue6 = "#2e5857",
  blue7 = "#92a6d5",
  border = "#e9e9ed",
  border_highlight = "#2496ac",
  comment = "#848cb5",
  cyan = "#007197",
  dark3 = "#8990b3",
  dark5 = "#68709a",
  error = "#c64343",
  fg = "#3760bf",
  fg_dark = "#6172b0",
  fg_float = "#3760bf",
  fg_gutter = "#a8aecb",
  fg_sidebar = "#6172b0",
  diff_add = "#4197a4",
  diff_change = "#506d9c",
  diff_delete = "#c47981",
  diff_text = "#8990b3",
  gitSigns_add = "#399a96",
  gitSigns_change = "#6482bd",
  gitSigns_delete = "#c25d64",
  green1 = "#387068",
  green2 = "#38919f",
  green = "#587539",
  hint = "#118c74",
  info = "#07879d",
  magenta2 = "#d20065",
  magenta = "#9854f1",
  none = "NONE",
  orange = "#b15c00",
  purple = "#7847bd",
  red1 = "#c64343",
  red = "#f52a65",
  teal = "#118c74",
  terminal_black = "#a1a6c5",
  warning = "#8c6c3e",
  yellow = "#8c6c3e",
}

local groups = {
  { "Normal", { fg = p.fg, bg = p.bg } },
  { "SignColumn", { fg = p.fg_gutter } },
  { "LineNr", { fg = p.fg_gutter } },
  { "EndOfBuffer", { fg = p.bg, bg = p.none } },
  { "Search", { fg = p.fg, bg = p.bg_search } },
  { "Visual", { bg = p.bg_visual } },
  { "ColorColumn", { bg = p.black } },
  { "Whitespace", { fg = p.fg_gutter } },
  { "VertSplit", { fg = p.border } },
  { "Title", { fg = p.blue, bold = true } },
  { "Cursorline", { bg = p.bg_highlight } },
  { "CursorLineNr", { fg = p.dark5 } },
  { "Pmenu", { bg = p.bg_popup, fg = p.fg } },
  { "PmenuSel", { bg = p.fg_sidebar } },
  { "PmenuSbar", { fg = "#586e75" } },
  { "PmenuThumb", { bg = p.bg } },
  { "PmenuKind", { bg = p.bg_dark, fg = p.yellow } },
  { "PmenuKindSel", { link = "PmenuSel" } },
  { "PmenuExtra", { link = "Pmenu" } },
  { "PmenuExtraSel", { link = "PmenuSel" } },
  { "WildMenu", { link = "Pmenu" } },
  { "StatusLine", { fg = p.fg_sidebar, bg = p.bg_statusline } },
  { "StatusLineNC", { fg = p.fg_gutter, bg = p.bg_statusline } },
  { "WinBar", { bg = p.none } },
  { "WinBarNC", { bg = p.none } },
  { "Error", { fg = p.error, bold = true } },
  { "ErrorMsg", { link = "Error" } },
  { "TODO", { fg = p.yellow } },
  { "Conceal", { fg = p.dark5, bg = p.none } },
  { "NonText", { link = "Comment" } },
  { "FloatBorder", { fg = p.border_highlight, bg = p.bg_float } },
  { "FloatNormal", { link = "Normal" } },
  { "FloatShadow", { bg = p.bg_dark } },
  { "Folded", { fg = p.blue, bold = true } },
  { "FoldColumn", { link = "SignColumn" } },
  { "SpellBad", { fg = p.error } },
  { "SpellCap", { undercurl = true, fg = p.warning } },
  { "SpellRare", { undercurl = true, fg = p.hint } },
  { "SpellLocal", { undercurl = true } },
  { "WarningMsg", { fg = p.warning } },
  { "MoreMsg", { fg = p.blue } },
  { "NvimInternalError", { fg = p.error } },
  { "Directory", { fg = p.blue } },
  { "Identifier", { fg = p.magenta } },
  { "@variable", { fg = p.fg } },
  { "@variable.builtin", { fg = p.red } },
  { "Constant", { fg = p.orange } },
  { "@constant.builtin", { link = "Constant" } },
  { "@constant.macro", { link = "Constant" } },
  { "@namespace", { fg = p.red } },
  { "Keyword", { fg = p.cyan } },
  { "@keyword.function", { link = "Keyword" } },
  { "@keyword.return", { link = "Keyword" } },
  { "@keyword.operator", { link = "Operator" } },
  { "Conditional", { link = "Keyword" } },
  { "Repeat", { link = "Conditional" } },
  { "Debug", { fg = p.orange } },
  { "Label", { fg = p.purple } },
  { "PreProc", { fg = p.cyan } },
  { "Include", { link = "PreProc" } },
  { "Exception", { fg = p.purple } }, --
  { "Statement", { fg = p.magenta } },
  { "SpecialKey", { fg = p.dark3 } },
  { "Special", { fg = p.blue1 } },
  { "Type", { fg = p.blue1 } },
  { "@type.builtin", { link = "Type" } },
  { "@type.definition", { link = "Type" } },
  { "@type.qualifier", { link = "KeyWord" } },
  { "@storageclass", { link = "Keyword" } },
  { "@field", { fg = p.green1 } },
  { "@property", { link = "@field" } },
  { "Function", { fg = p.blue } },
  { "@function.builtin", { link = "Function" } },
  { "@function.call", { link = "Function" } },
  { "@function.macro", { link = "Function" } },
  { "@method", { link = "Function" } },
  { "@method.call", { link = "Function" } },
  { "@constructor", { fg = p.magenta } },
  { "@parameter", { link = "@variable" } },
  { "String", { fg = p.green } },
  { "Number", { fg = p.purple } },
  { "Float", { link = "Number" } },
  { "Boolean", { link = "Constant" } },
  { "Define", { link = "PreProc" } },
  { "Operator", { fg = p.blue5 } },
  { "Comment", { fg = p.comment } },
  { "@punctuation.bracket", { fg = p.fg_dark } },
  { "@punctuation.delimiter", { fg = p.blue5 } },
  { "@tag.html", { fg = p.orange } },
  { "@tag.attribute.html", { link = "@property" } },
  { "@tag.delimiter.html", { link = "@punctuation.delimiter" } },
  { "@tag.javascript", { link = "@tag.html" } },
  { "@tag.attribute.javascript", { link = "@tag.attribute.html" } },
  { "@tag.delimiter.javascript", { link = "@tag.delimiter.html" } },
  { "@tag.typescript", { link = "@tag.html" } },
  { "@tag.attribute.typescript", { link = "@tag.attribute.html" } },
  { "@tag.delimiter.typescript", { link = "@tag.delimiter.html" } },
  { "@text.reference.markdown_inline", { fg = p.blue } },
  { "DiffAdd", { fg = p.diff_add, bg = p.none } },
  { "DiffChange", { fg = p.diff_change } },
  { "DiffDelete", { fg = p.diff_delete } },
  { "DiffText", { fg = p.diff_text } },
  { "@text.diff.add.diff", { link = "DiffAdd" } },
  { "@text.diff.delete.diff", { link = "DiffDelete" } },
  { "@text.diff.change.diff", { link = "DiffChange" } },
  { "DiagnosticError", { link = "Error" } },
  { "DiagnosticWarn", { fg = p.warning } },
  { "DiagnosticInfo", { fg = p.info } },
  { "DiagnosticHint", { fg = p.hint } },
  { "DiagnosticSignError", { link = "DiagnosticError" } },
  { "DiagnosticSignWarn", { link = "DiagnosticWarn" } },
  { "DiagnosticSignInfo", { link = "DiagnosticInfo" } },
  { "DiagnosticSignHint", { link = "DiagnosticHint" } },
  { "DiagnosticUnderlineError", { undercurl = true } },
  { "DiagnosticUnderlineWarn", { undercurl = true } },
  { "DiagnosticUnderlineInfo", { undercurl = true } },
  { "DiagnosticUnderlineHint", { undercurl = true } },
  { "GitGutterAdd", { fg = p.gitSigns_add } },
  { "GitGutterChange", { fg = p.gitSigns_change } },
  { "GitGutterDelete", { fg = p.git_delete } },
  { "GitGutterChangeDelete", { fg = p.gitSigns_delete } },
  {
    "TelescopePromptBorder",
    { bg = p.bg_float, fg = p.border_highlight },
  },
  { "TelescopePromptNormal", { bg = p.bg_float, fg = p.orange } },
  {
    "TelescopeResultsBorder",
    { bg = p.bg_float, fg = p.fg_float },
  },
  {
    "TelescopePreviewBorder",
    { bg = p.bg_float, fg = p.fg_float },
  },
  { "TelescopeResultsNormal", { fg = p.fg_float } },
  { "TelescopeSelectionCaret", { fg = p.yellow } },
  { "TelescopeMatching", { fg = p.yellow } },
  { "CursorWord", { bg = p.bg_dark } },
  { "IndentLine", { link = "LineNr" } },
  { "SagaVariable", { fg = p.green } },
  { "RapidFinished", { fg = p.red, bold = true } },
  { "RapidTake", { fg = p.purple, bold = true } },
  { "RapidDate", { fg = p.purple, bold = true } },
  { "RapidFile", { fg = p.blue, bold = true } },
  { "RapidTargetPos", { fg = p.teal, bold = true } },
  { "LspSignatureActiveParameter", { fg = p.yellow, underline = true } },
  { "netrwTreeBar", { link = "Comment" } },
}

local g, api, opt = vim.g, vim.api, vim.opt
g.terminal_color_0 = p.bg
g.terminal_color_1 = p.red
g.terminal_color_2 = p.green
g.terminal_color_3 = p.yellow
g.terminal_color_4 = p.blue
g.terminal_color_5 = p.purple
g.terminal_color_6 = p.cyan
g.terminal_color_7 = p.fg
g.terminal_color_8 = p.fg_float
g.terminal_color_9 = p.red
g.terminal_color_10 = p.green
g.terminal_color_11 = p.yellow
g.terminal_color_12 = p.blue
g.terminal_color_13 = p.purple
g.terminal_color_14 = p.cyan
g.terminal_color_15 = p.fg

api.nvim_command("hi clear")
opt.background = "light"
g.colors_name = "day"
opt.termguicolors = true
for _, v in pairs(groups) do
  api.nvim_set_hl(0, v[1], v[2])
end