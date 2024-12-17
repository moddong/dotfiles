local p = {
  bg = "#141821",
  bg_float = "#14131f",
  bg_dim = "#1c202e",
  bg_alt = "#222738",
  fg = "#cccccc",
  fg_dim = "#989898",
  fg_alt = "#75715E",
  red = "#ff5f59",
  orange = "#cc853d",
  yellow = "#ccad52",
  green = "#9eb336",
  cyan = "#52bccc",
  blue = "#5c95e6",
  purple = "#9884c4",
  teal = "#47b38f",
  none = "NONE",
}

local groups = {

  { "Normal", { fg = p.fg, bg = p.bg } },
  --signcolumn
  { "SignColumn", { bg = p.bg } },
  --buffer
  { "LineNr", { fg = "#272d40" } },
  { "EndOfBuffer", { fg = p.bg, bg = p.none } },
  { "Search", { fg = p.yellow, reverse = true } },
  { "Visual", { bg = p.bg_alt } },
  { "ColorColumn", { bg = p.bg_alt } },
  { "Whitespace", { fg = p.bg_alt } },
  --window
  { "VertSplit", { fg = p.bg_alt } },
  { "Title", { fg = p.orange, bold = true } },
  --cursorline
  { "Cursorline", { bg = p.bg_dim } },
  { "CursorLineNr", { fg = p.fg } },
  --pmenu
  { "Pmenu", { bg = p.bg_float, fg = p.fg_dim } },
  { "PmenuSel", { fg = p.teal } },
  { "PmenuSbar", { fg = "#586e75" } },
  { "PmenuKind", { bg = p.bg_float, fg = p.yellow } },
  { "PmenuKindSel", { link = "PmenuSel" } },
  { "PmenuExtra", { link = "Pmenu" } },
  { "PmenuExtraSel", { link = "PmenuSel" } },
  { "WildMenu", { link = "Pmenu" } },
  --statusline
  { "StatusLine", { fg = p.fg_dim, bg = p.bg_float } },
  { "StatusLineNC", { fg = p.fg_dim, bg = p.bg_float } },
  { "WinBar", { bg = p.none } },
  { "WinBarNC", { bg = p.none } },
  { "WinSeparator", { bg = p.bg, fg = p.bg_dim } },
  --Error
  { "Error", { fg = p.red, bold = true } },
  { "ErrorMsg", { link = "Error" } },
  --Markup
  { "TODO", { fg = p.cyan } },
  { "Conceal", { fg = p.blue } },
  { "NonText", { link = "Comment" } },
  --Float
  { "FloatBorder", { fg = p.blue } },
  { "NormalFloat", { bg = p.bg_float } },
  --Fold
  { "Folded", { fg = p.bg, bold = true } },
  { "FoldColumn", { link = "SignColumn" } },
  --Spell
  { "SpellBad", { fg = p.red } },
  { "SpellCap", { undercurl = true, sp = p.red } },
  { "SpellRare", { undercurl = true, fg = p.purple } },
  { "SpellLocal", { undercurl = true } },
  --Msg
  { "WarningMsg", { fg = p.red } },
  { "MoreMsg", { fg = p.green } },
  --Internal
  { "NvimInternalError", { fg = p.red } },
  { "Directory", { fg = p.blue } },
  --------------------------------------------------------
  ---
  ---@Langauge Relate
  ---@Identifier
  { "Identifier", { fg = p.blue } },
  -- various variable names
  { "@variable", { fg = p.fg } },
  --built-in variable names (e, {g, `this`)
  { "@variable.builtin", { fg = p.purple } },
  { "Constant", { fg = p.orange } },
  { "@constant.builtin", { link = "Constant" } },
  -- constants defined by the preprocessor
  { "@constant.macro", { link = "Constant" } },
  --modules or namespaces
  { "@namespace", { fg = p.cyan } },
  --symbols or atoms
  -- ['@symbol'] = exe}},
  --------------------------------------------------------
  ---@Keywords
  { "Keyword", { fg = p.green } },
  { "@keyword.function", { link = "Keyword" } },
  { "@keyword.return", { link = "Keyword" } },
  { "@keyword.operat", { link = "Operator" } },
  --if else
  { "Conditional", { link = "Keyword" } },
  --for while
  { "Repeat", { link = "Conditional" } },
  --for attribute
  { "@attribute", { link = "Keyword" } },
  { "Debug", { fg = p.orange } },
  { "Label", { fg = p.purple } },
  { "PreProc", { fg = p.purple } },
  { "Include", { link = "PreProc" } },
  { "Exception", { fg = p.purple } },
  { "Statement", { fg = p.purple } },
  { "SpecialKey", { fg = p.orange } },
  { "Special", { fg = p.orange } },
  --------------------------------------------------------
  ---@Types
  { "Type", { fg = p.yellow } },
  { "@type.builtin", { link = "Type" } },
  --type definitions (e, {g, `typedef` in C)
  { "@type.definition", { link = "Type" } },
  --type qualifiers (e, {g, `const`)
  { "@type.qualifier", { link = "KeyWord" } },
  --modifiers that affect storage in memory or life-time like C `static`
  { "@storageclass", { link = "Keyword" } },
  { "@field", { fg = p.cyan } },
  { "@property", { link = "@field" } },
  --------------------------------------------------------
  ---@Functions
  { "Function", { fg = p.blue } },
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
  { "String", { fg = p.teal } },
  { "Number", { fg = p.purple } },
  { "Float", { link = "Number" } },
  { "Boolean", { link = "Constant" } },
  --
  { "Define", { link = "PreProc" } },
  { "Operator", { fg = p.fg_dim } },
  { "Comment", { fg = "#3d4966" } },
  --------------------------------------------------------
  ---@punctuation
  { "@punctuation.bracket", { fg = p.fg_dim } },
  { "@punctuation.delimiter", { fg = p.fg_dim } },
  --------------------------------------------------------
  ---@Tag
  { "@tag.html", { fg = p.orange } },
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
  { "@text.reference.markdown.inline", { fg = p.blue } },
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
  { "TelescopePromptBorder", { bg = p.bg_alt, fg = p.bg_alt } },
  { "TelescopePromptNormal", { bg = p.bg_alt, fg = p.orange } },
  { "TelescopeResultsBorder", { bg = p.bg_alt, fg = p.bg_alt } },
  { "TelescopePreviewBorder", { bg = p.bg_alt, fg = p.bg_alt } },
  { "TelescopeResultsNormal", { fg = p.fg } },
  { "TelescopeSelectionCaret", { fg = p.yellow } },
  { "TelescopeMatching", { fg = p.yellow } },
  --CursorWord
  { "CursorWord", { bg = p.bg_alt } },
  { "IndentLine", { fg = p.bg_alt } },
  --Lspsaga
  { "SagaVariable", { fg = p.green } },
  --lsp relate
  { "LspSignatureActiveParameter", { fg = p.yellow, underline = true } },
  --netrw
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
g.terminal_color_8 = p.fg_dim
g.terminal_color_9 = p.red
g.terminal_color_10 = p.green
g.terminal_color_11 = p.yellow
g.terminal_color_12 = p.blue
g.terminal_color_13 = p.purple
g.terminal_color_14 = p.cyan
g.terminal_color_15 = p.fg

api.nvim_command("hi clear")
opt.background = "dark"
g.colors_name = "night"
opt.termguicolors = true
for _, v in pairs(groups) do
  api.nvim_set_hl(0, v[1], v[2])
end
