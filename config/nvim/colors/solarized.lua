local palette = {
  base03 = '#002b36',
  base02 = '#073642',
  base01 = '#586e75',
  base00 = '#657b83',
  base0 = '#839496',
  base1 = '#93a1a1',
  base2 = '#eee8d5',
  base3 = '#fdf6e3',
  red = '#BE3455',
  dorange = '#cb4b16',
  orange = '#cc7529',
  yellow = '#b58900',
  magenta = '#d33682',
  violet = '#9977d9',
  blue = '#268bd2',
  cyan = '#2aa198',
  dcyan = '#3ca9ba',
  green = '#859900',
  non = 'NONE',
}

local groups = {
  --Neovim Relate
  { 'Normal', { fg = palette.base0, bg = palette.base03 } },
  --signcolumn
  { 'SignColumn', { bg = palette.base03 } },
  --buffer
  { 'LineNr', { fg = palette.base01 } },
  { 'EndOfBuffer', { bg = palette.non, fg = palette.base03 } },
  { 'Search', { fg = palette.yellow, reverse = true } },
  { 'Visual', { bg = palette.base02 } },
  { 'ColorColumn', { bg = palette.base02 } },
  { 'Whitespace', { fg = palette.base02 } },
  --window
  { 'VertSplit', { fg = palette.base02 } },
  { 'Title', { fg = palette.orange, bold = true } },
  --cursorline
  { 'Cursorline', { bg = palette.base02 } },
  { 'CursorLineNr', { fg = palette.base0 } },
  --pmenu
  { 'Pmenu', { bg = palette.base02, fg = palette.base1 } },
  { 'PmenuSel', { fg = palette.base2, bg = palette.base00 } },
  { 'PmenuSbar', { bg = '#586e75' } },
  { 'PmenuThumb', { bg = palette.base0 } },
  { 'PmenuKind', { bg = palette.base02, fg = palette.yellow } },
  { 'PmenuKindSel', { link = 'PmenuSel' } },
  { 'PmenuExtra', { link = 'Pmenu' } },
  { 'PmenuExtraSel', { link = 'PmenuSel' } },
  { 'WildMenu', { link = 'pmenu' } },
  --statusline
  { 'StatusLine', { bg = palette.base02 } },
  { 'StatusLineNC', { fg = palette.base02, bg = palette.base05 } },
  { 'WinBar', { bg = palette.non } },
  { 'WinBarNC', { bg = palette.non } },
  --Error
  { 'ErrorMsg', { link = 'Error' } },
  --Markup
  { 'TODO', { fg = palette.magenta } },
  { 'Conceal', { fg = palette.blue } },
  { 'Error', { fg = palette.red, bold = true } },
  { 'NonText', { bg = palette.bg_alt } },
  --Float
  { 'FloatBorder', { fg = palette.blue } },
  { 'FloatNormal', { link = 'Normal' } },
  { 'FloatShadow', { bg = palette.base06 } },
  --Fold
  { 'Folded', { fg = palette.base0, bold = true } },
  { 'FoldColumn', { link = 'SignColumn' } },
  --Spell
  { 'SpellBad', { fg = palette.magenta } },
  { 'SpellCap', { undercurl = true, fg = palette.magenta } },
  { 'SpellRare', { undercurl = true, sp = palette.violet } },
  { 'SpellLocal', { undercurl = true } },
  --Msg
  { 'WarningMsg', { fg = palette.magenta } },
  { 'MoreMsg', { fg = palette.green } },
  --Internal
  { 'NvimInternalError', { fg = palette.red } },
  { 'Directory', { fg = palette.blue } },
  --------------------------------------------------------
  ---@Langauge Relate
  ---@Identifier
  { 'Identifier', { fg = palette.blue } },
  -- various variable names
  { '@variable', { fg = palette.base0 } },
  --built-in variable names (e.g. `this`)
  { '@variable.builtin', { fg = palette.magenta, bold = true } },
  { 'Constant', { fg = palette.orange } },
  { '@constant.builtin', { link = 'Constant' } },
  -- constants defined by the preprocessor
  { '@constant.macro', {} },
  --modules or namespaces
  { '@namespace', { link = 'Include' } },
  --symbols or atoms
  -- ['@symbol'] = {},
  --------------------------------------------------------
  ---@Keywords
  { 'Keyword', { fg = palette.green } },
  { '@keyword.function', { link = 'Keyword' } },
  { '@keyword.return', { fg = palette.red } },
  { '@keyword.operator', { link = 'Operator' } },
  --if else
  { 'Conditional', { link = 'Keyword' } },
  --for while
  { 'Repeat', { link = 'Conditional' } },

  { 'Debug', { fg = palette.dorange } },
  { 'Label', { fg = palette.violet } },
  { 'PreProc', { fg = palette.dorange } },
  { 'Include', { link = 'PreProc' } },
  { 'Exception', { fg = palette.violet } },
  { 'Statement', { fg = palette.green } },
  { 'SpecialKey', { fg = palette.dorange } },
  { 'Special', { fg = palette.dorange } },
  --------------------------------------------------------
  ---@Types
  { 'Type', { fg = palette.yellow } },
  { '@type.builtin', { link = 'Type' } },
  --type definitions (e.g. `typedef` in C)
  { '@type.definition', { link = 'Type' } },
  --type qualifiers (e.g. `const`)
  { '@type.qualifier', { fg = palette.green } },
  --modifiers that affect storage in memory or life-time like C `static`
  { '@storageclass', { link = 'Keyword' } },
  { '@field', { fg = palette.dcyan } },
  { '@property', { link = '@field' } },
  --------------------------------------------------------
  ---@Functions
  { 'Function', { fg = palette.blue } },
  --built-in functions
  { '@function.builtin', { link = 'Function' } },
  --function calls
  { '@function.call', { link = 'Function' } },
  --preprocessor macros
  { '@function.macro', { link = 'Function' } },
  { '@method', { link = 'Function' } },
  { '@method.call', { link = 'Function' } },
  { '@constructor', { fg = palette.violet } },
  { '@parameter', { link = '@variable' } },
  --------------------------------------------------------
  ---@Literals
  { 'String', { fg = palette.cyan } },
  { 'Number', { fg = palette.violet } },
  { 'Float', { link = 'Number' } },
  { 'Boolean', { link = 'Number' } },
  --
  { 'Define', { link = 'PreProc' } },
  { 'Operator', { fg = '#8c8027' } },
  { 'Comment', { fg = palette.base01 } },
  --------------------------------------------------------
  ---@punctuation
  { '@punctuation.bracket', { fg = palette.base00 } },
  { '@punctuation.delimiter', { link = '@punctuation.bracket' } },
  --------------------------------------------------------
  ---@Tag
  { '@tag.html', { fg = palette.orange } },
  { '@tag.attribute.html', { link = '@property' } },
  { '@tag.delimiter.html', { link = '@punctuation.delimiter' } },
  { '@tag.javascript', { link = '@tag.html' } },
  { '@tag.attribute.javascript', { link = '@tag.attribute.html' } },
  { '@tag.delimiter.javascript', { link = '@tag.delimiter.html' } },
  { '@tag.typescript', { link = '@tag.html' } },
  { '@tag.attribute.typescript', { link = '@tag.attribute.html' } },
  { '@tag.delimiter.typescript', { link = '@tag.delimiter.html' } },
  --------------------------------------------------------
  ---@Markdown
  { '@text.reference.markdown_inline', { fg = palette.blue } },
  ---@Diff
  { 'DiffAdd', { fg = palette.green } },
  { 'DiffChange', { fg = palette.blue } },
  { 'DiffDelete', { fg = palette.dorange } },
  { 'DiffText', { fg = palette.dorange } },
  --------------------------------------------------------
  ---@Diagnostic
  { 'DiagnosticError', { link = 'Error' } },
  { 'DiagnosticWarn', { fg = palette.yellow } },
  { 'DiagnosticInfo', { fg = palette.blue } },
  { 'DiagnosticHint', { fg = '#4eacb5' } },
  { 'DiagnosticSignError', { link = 'DiagnosticError' } },
  { 'DiagnosticSignWarn', { link = 'DiagnosticWarn' } },
  { 'DiagnosticSignInfo', { link = 'DiagnosticInfo' } },
  { 'DiagnosticSignHint', { link = 'DiagnosticHint' } },
  { 'DiagnosticUnderlineError', { undercurl = true } },
  { 'DiagnosticUnderlineWarn', { undercurl = true } },
  { 'DiagnosticUnderlineInfo', { undercurl = true } },
  { 'DiagnosticUnderlineHint', { undercurl = true } },
  ---@plugin
  { 'GitGutterAdd', { fg = palette.green } },
  { 'GitGutterChange', { fg = palette.blue } },
  { 'GitGutterDelete', { fg = palette.red } },
  { 'GitGutterChangeDelete', { fg = palette.red } },
  --Telescope
  {
    'TelescopePromptBorder',
    { bg = palette.base02, fg = palette.base02 },
  },
  {
    'TelescopePromptNormal',
    { bg = palette.base02, fg = palette.dorange },
  },
  {
    'TelescopeResultsBorder',
    { bg = palette.base02, fg = palette.base02 },
  },
  {
    'TelescopePreviewBorder',
    { bg = palette.base02, fg = palette.base02 },
  },
  { 'TelescopeResultsNormal', { fg = palette.base0 } },
  { 'TelescopeSelectionCaret', { fg = palette.yellow } },
  { 'TelescopeMatching', { fg = palette.yellow } },
  --CursorWord
  { 'CursorWord', { bg = palette.base02 } },
  { 'IndentLine', { fg = '#1f5866' } },
  --Lspsaga
  { 'SagaVariable', { fg = palette.green } },
}

local g, api, opt = vim.g, vim.api, vim.opt
g.terminal_color_0 = palette.base05
g.terminal_color_1 = palette.red
g.terminal_color_2 = palette.green
g.terminal_color_3 = palette.yellow
g.terminal_color_4 = palette.blue
g.terminal_color_5 = palette.magenta
g.terminal_color_6 = palette.cyan
g.terminal_color_7 = palette.base3
g.terminal_color_8 = palette.base01
g.terminal_color_9 = palette.orange
g.terminal_color_10 = palette.base00
g.terminal_color_11 = palette.base0
g.terminal_color_12 = palette.base1
g.terminal_color_13 = palette.violet
g.terminal_color_14 = palette.base2
g.terminal_color_15 = palette.base3

api.nvim_command('hi clear')
opt.background = 'dark'
g.colors_name = 'solarized'
opt.termguicolors = true
for _, v in pairs(groups) do
  vim.api.nvim_set_hl(0, v[1], v[2])
end
