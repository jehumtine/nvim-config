-- Blueprint: architectural blue-grey colorscheme
vim.o.termguicolors = true
vim.g.colors_name = "blueprint"

local c = {
  bg = "#172630",
  surface = "#203442",
  blue = "#294256",
  select = "#38566B",
  border = "#49677A",
  fg = "#D9E2E8",
  muted = "#91A9B9",
  blue_hi = "#91B8D0",
  cyan = "#8FC5C9",
  green = "#A8C6A0",
  amber = "#E0B784",
  red = "#D98989",
  violet = "#B7A6D9",
}

local set = vim.api.nvim_set_hl

local groups = {
  -- Editor
  Normal = { fg = c.fg, bg = c.bg },
  NormalFloat = { fg = c.fg, bg = c.surface },
  NormalNC = { fg = c.fg, bg = c.bg },
  EndOfBuffer = { fg = c.bg },
  CursorLine = { bg = c.surface },
  CursorLineNr = { fg = c.amber, bold = true },
  LineNr = { fg = c.muted },
  SignColumn = { fg = c.muted, bg = c.bg },
  Visual = { bg = c.select },
  Search = { fg = c.bg, bg = c.amber },
  IncSearch = { fg = c.bg, bg = c.cyan },
  MatchParen = { fg = c.amber, bold = true },
  WinSeparator = { fg = c.border },

  -- UI
  Pmenu = { fg = c.fg, bg = c.surface },
  PmenuSel = { fg = c.fg, bg = c.select, bold = true },
  PmenuSbar = { bg = c.blue },
  PmenuThumb = { bg = c.border },
  FloatBorder = { fg = c.border, bg = c.surface },
  StatusLine = { fg = c.fg, bg = c.blue },
  StatusLineNC = { fg = c.muted, bg = c.surface },
  TabLine = { fg = c.muted, bg = c.surface },
  TabLineSel = { fg = c.fg, bg = c.blue },
  TabLineFill = { bg = c.bg },
  Directory = { fg = c.blue_hi },

  -- Standard syntax
  Comment = { fg = c.muted, italic = true },
  Constant = { fg = c.violet },
  String = { fg = c.green },
  Character = { fg = c.green },
  Number = { fg = c.violet },
  Boolean = { fg = c.violet },
  Identifier = { fg = c.fg },
  Function = { fg = c.blue_hi },
  Statement = { fg = c.amber },
  Conditional = { fg = c.amber },
  Repeat = { fg = c.amber },
  Keyword = { fg = c.amber },
  Operator = { fg = c.cyan },
  Type = { fg = c.cyan },
  Structure = { fg = c.cyan },
  Special = { fg = c.cyan },
  PreProc = { fg = c.violet },
  Todo = { fg = c.bg, bg = c.amber, bold = true },

  -- Tree-sitter
  ["@comment"] = { link = "Comment" },
  ["@string"] = { link = "String" },
  ["@number"] = { link = "Number" },
  ["@boolean"] = { link = "Boolean" },
  ["@function"] = { link = "Function" },
  ["@function.call"] = { fg = c.blue_hi },
  ["@keyword"] = { link = "Keyword" },
  ["@operator"] = { link = "Operator" },
  ["@type"] = { link = "Type" },
  ["@variable"] = { fg = c.fg },
  ["@variable.builtin"] = { fg = c.cyan },
  ["@property"] = { fg = c.blue_hi },
  ["@constant"] = { fg = c.violet },
  ["@punctuation"] = { fg = c.muted },

  -- Diagnostics
  DiagnosticError = { fg = c.red },
  DiagnosticWarn = { fg = c.amber },
  DiagnosticInfo = { fg = c.blue_hi },
  DiagnosticHint = { fg = c.cyan },
  DiagnosticUnderlineError = {
    undercurl = true,
    sp = c.red,
  },
  DiagnosticUnderlineWarn = {
    undercurl = true,
    sp = c.amber,
  },

  -- Diff
  DiffAdd = { fg = c.green, bg = c.bg },
  DiffChange = { fg = c.amber, bg = c.bg },
  DiffDelete = { fg = c.red, bg = c.bg },
}

for group, spec in pairs(groups) do
  set(0, group, spec)
end

-- Terminal palette
vim.g.terminal_color_0 = c.bg
vim.g.terminal_color_1 = c.red
vim.g.terminal_color_2 = c.green
vim.g.terminal_color_3 = c.amber
vim.g.terminal_color_4 = c.blue_hi
vim.g.terminal_color_5 = c.violet
vim.g.terminal_color_6 = c.cyan
vim.g.terminal_color_7 = c.fg
vim.g.terminal_color_8 = c.muted
vim.g.terminal_color_9 = c.red
vim.g.terminal_color_10 = c.green
vim.g.terminal_color_11 = c.amber
vim.g.terminal_color_12 = c.blue_hi
vim.g.terminal_color_13 = c.violet
vim.g.terminal_color_14 = c.cyan
vim.g.terminal_color_15 = "#EDF2F5"
