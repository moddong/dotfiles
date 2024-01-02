local p = {
  bg = "#141821",
  bg_alt = "#222738",
  bg_float = "#14131f",
  -- fg = "#cccccc",
  red = "#ff5f59",
  orange = "#cc853d",
  yellow = "#ccad52",
  green = "#9eb336",
  cyan = "#52bccc",
  blue = "#5c95e6",
  purple = "#957acc",
  teal = "#47b38f",
  none = "NONE",
}

local groups = {

  { "Normal", { fg = p.none, bg = p.bg } },
  --signcolumn
  { "SignColumn", { bg = p.bg } },
  --buffer
  { "LineNr", { fg = "#272d40" } },
  { "EndOfBuffer", { fg = p.bg, bg = p.none } },
  { "Search", { fg = p.yellow, reverse = true } },
  { "Visual", { bg = p.yellow } },
  { "ColorColumn", { bg = p.none } },
  { "Whitespace", { fg = p.none } },
  --window
  { "VertSplit", { fg = p.none } },
  { "Title", { fg = p.none, bold = true } },
  --cursorline
  { "Cursorline", { bg = p.bg_alt } },
  { "CursorLineNr", { fg = p.none, bg = p.bg_alt } },
  --pmenu
  { "Pmenu", { bg = p.bg_float, fg = p.none } },
  { "PmenuSel", { fg = p.teal } },
  { "PmenuSbar", { fg = "#586e75" } },
  { "PmenuKind", { bg = p.bg_float, fg = p.yellow } },
  { "PmenuKindSel", { link = "PmenuSel" } },
  { "PmenuExtra", { link = "Pmenu" } },
  { "PmenuExtraSel", { link = "PmenuSel" } },
  { "WildMenu", { link = "Pmenu" } },
  --statusline
  { "StatusLine", { fg = p.none, bg = p.none } },
  { "StatusLineNC", { fg = p.none, bg = p.none } },
  { "WinBar", { bg = p.none } },
  { "WinBarNC", { bg = p.none } },
  { "WinSeparator", { bg = p.bg, fg = p.none } },
  --Error
  { "Error", { fg = p.red, bold = true } },
  { "ErrorMsg", { link = "Error" } },
  --Markup
  { "TODO", { fg = p.none } },
  { "Conceal", { fg = p.none } },
  { "NonText", { link = "Comment" } },
  --Float
  { "FloatBorder", { fg = p.none } },
  { "NormalFloat", { bg = p.none } },
  --Fold
  { "Folded", { fg = p.bg, bold = true } },
  { "FoldColumn", { link = "SignColumn" } },
  --Spell
  { "SpellBad", { fg = p.none } },
  { "SpellCap", { undercurl = true, sp = p.none } },
  { "SpellRare", { undercurl = true, fg = p.none } },
  { "SpellLocal", { undercurl = true } },
  --Msg
  { "WarningMsg", { fg = p.none } },
  { "MoreMsg", { fg = p.none } },
  --Internal
  { "NvimInternalError", { fg = p.none } },
  { "Directory", { fg = p.none } },
  --------------------------------------------------------
  ---
  ---@Langauge Relate
  ---@Identifier
  { "Identifier", { fg = p.none } },
  -- various variable names
  { "@variable", { fg = p.none } },
  --built-in variable names (e, {g, `this`)
  { "@variable.builtin", { fg = p.none } },
  { "Constant", { fg = p.none } },
  { "@constant.builtin", { link = "Constant" } },
  -- constants defined by the preprocessor
  { "@constant.macro", { link = "Constant" } },
  --modules or namespaces
  { "@namespace", { fg = p.none } },
  --symbols or atoms
  -- ['@symbol'] = exe}},
  --------------------------------------------------------
  ---@Keywords
  { "Keyword", { fg = p.none } },
  { "@keyword.function", { link = "Keyword" } },
  { "@keyword.return", { link = "Keyword" } },
  { "@keyword.operat", { link = "Operator" } },
  --if else
  { "Conditional", { link = "Keyword" } },
  --for while
  { "Repeat", { link = "Conditional" } },
  --for attribute
  { "@attribute", { link = "Keyword" } },
  { "Debug", { fg = p.none } },
  { "Label", { fg = p.none } },
  { "PreProc", { fg = p.none } },
  { "Include", { link = "PreProc" } },
  { "Exception", { fg = p.none } },
  { "Statement", { fg = p.none } },
  { "SpecialKey", { link = "Comment" } },
  { "Special", { link = "Comment" } },
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
  { "@field", { fg = p.none } },
  { "@property", { link = "@field" } },
  --------------------------------------------------------
  ---@Functions
  { "Function", { fg = p.none } },
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
  { "String", { fg = p.none } },
  { "Number", { fg = p.none } },
  { "Float", { link = "Number" } },
  { "Boolean", { link = "Constant" } },
  --
  { "Define", { link = "PreProc" } },
  { "Operator", { fg = p.none } },
  { "Comment", { fg = "#3d4966" } },
  --------------------------------------------------------
  ---@punctuation
  { "@punctuation.bracket", { fg = p.none } },
  { "@punctuation.delimiter", { fg = p.none } },
  --------------------------------------------------------
  ---@Tag
  { "@tag.html", { fg = p.none } },
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
  { "@text.reference.markdown.inline", { fg = p.none } },
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
  { "TelescopePromptBorder", { bg = p.none, fg = p.none } },
  { "TelescopePromptNormal", { bg = p.none, fg = p.none } },
  { "TelescopeResultsBorder", { bg = p.none, fg = p.none } },
  { "TelescopePreviewBorder", { bg = p.none, fg = p.none } },
  { "TelescopeResultsNormal", { fg = p.none } },
  { "TelescopeSelectionCaret", { fg = p.blue } },
  { "TelescopeMatching", { fg = p.blue } },
  --CursorWord
  { "CursorWord", { bg = p.none } },
  { "IndentLine", { link = "Comment" } },
  --Lspsaga
  { "SagaVariable", { fg = p.none } },
  --lsp relate
  { "LspSignatureActiveParameter", { fg = p.yellow, underline = true } },
  --netrw
  { "netrwTreeBar", { link = "Comment" } },
}
local g, api, opt = vim.g, vim.api, vim.opt
g.terminal_color_0 = p.bg
g.terminal_color_1 = p.none
g.terminal_color_2 = p.none
g.terminal_color_3 = p.yellow
g.terminal_color_4 = p.none
g.terminal_color_5 = p.none
g.terminal_color_6 = p.none
g.terminal_color_7 = p.none
g.terminal_color_8 = p.none
g.terminal_color_9 = p.none
g.terminal_color_10 = p.none
g.terminal_color_11 = p.yellow
g.terminal_color_12 = p.none
g.terminal_color_13 = p.none
g.terminal_color_14 = p.none
g.terminal_color_15 = p.none

api.nvim_command("hi clear")
opt.background = "dark"
g.colors_name = "pure"
opt.termguicolors = true
for _, v in pairs(groups) do
  api.nvim_set_hl(0, v[1], v[2])
end
