-- Enable lush.ify on this file, run:
--
--  `:Lushify`

local lush = require('lush')

local yellow  = "#f8aa01"
local red = "#ff2f6d"
local blue = "#2c84fc"
local purple = "#886efa"
local green = "#43cc70"
local muted = "#444444"

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
  local sym = injected_functions.sym
  return {
    ColorColumn  { bg="#3a3a3a" },
    Conceal      { fg="#1e59aa" },
    CursorColumn { bg="#282828" },
    CursorLine   { bg="none" },
    Directory    { fg="#2c84fc" },
    EndOfBuffer  { fg="#626262" },
    -- ErrorMsg     { }, -- Error messages on the command line
    -- VertSplit    { }, -- Column separating vertically split windows
    -- Folded       { }, -- Line used for closed folds
    -- FoldColumn   { }, -- 'foldcolumn'
    SignColumn   { bg="none" },
    IncSearch    { bg=yellow, fg="#000000" },
    Substitute   { bg=blue, fg="#ffffff" },
    LineNr       { fg=muted },
    CursorLineNr { fg="#ffffff", bg="#303030" },
    MatchParen   { bg="#282828", fg=yellow },
    ModeMsg      { fg=yellow },
    -- MsgArea      { }, -- Area for messages and cmdline
    -- MsgSeparator { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    -- MoreMsg      { }, -- |more-prompt|
    NonText      { fg="#626262" },
    Normal       { fg = "#eeeeee", bg = "#202020" },
    NormalFloat  { fg = "#eeeeee", bg = "#383838" },
    Pmenu        { fg = "#eeeeee", bg = "#383838" },
    PmenuSel     { fg="#111111", bg = yellow },
    PmenuSbar    { bg="#808080" },
    PmenuThumb   { bg="#d0d0d0" },
    Question     { fg=yellow }, -- |hit-enter| prompt and yes/no questions
    -- QuickFixLine { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search       { bg=blue, fg="#ffffff" },
    -- SpecialKey   { }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
    SpellBad     { gui = "underline" },
    StatusLine   { bg="#444444" },
    StatusLineNC { bg="#444444" },
    TabLine      { bg="none", fg="#444444"},
    TabLineFill  { bg="none" },
    TabLineSel   { bg="none", fg="#a8a8a8"},
    Title        { fg="#ffaf87" },
    Visual       { bg="#ffd75f", fg="#000000" },
    -- WarningMsg   { }, -- Warning messages
    -- Whitespace   { }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    -- Winseparator { }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
    WildMenu     { fg="#111111", bg = yellow },

    -- Common vim syntax groups used for all kinds of code and markup.
    -- Commented-out groups should chain up to their preferred (*) group
    -- by default.
    --
    -- See :h group-name
    --
    -- Uncomment and edit if you want more specific syntax highlighting.

    Comment        { fg="#626262" },

    Constant       { fg=blue }, -- (*) Any constant
    String         { fg="#fb89ad" }, --   A string constant: "this is a string"
    Character      { fg="#ffaf87" }, --   A character constant: 'c', '\n'
    Number         { fg="#ffaf87" }, --   A number constant: 234, 0xff
    Boolean        { fg="#ffaf87" }, --   A boolean constant: TRUE, false
    Float          { fg="#ffaf87" }, --   A floating point constant: 2.3e10

    Identifier     { fg="#f0f0f0" }, -- (*) Any variable name
    Function       { fg="#67a2fd" }, --   Function name (also: methods for classes)

    Statement      { fg=yellow }, -- (*) Any statement
    Conditional    { fg=purple }, --   if, then, else, endif, switch, etc.
    Repeat         { fg=purple }, --   for, do, while, etc.
    Label          { fg=purple }, --   case, default, etc.
    Operator       { fg="#67a2fd" }, --   "sizeof", "+", "*", etc.
    Keyword        { fg="#4b76b8" }, --   any other keyword
    Exception      { fg="#ff2f6d" }, --   try, catch, throw

    PreProc        { fg="#4b76b8" }, -- (*) Generic Preprocessor
    -- Include        { }, --   Preprocessor #include
    -- Define         { }, --   Preprocessor #define
    -- Macro          { }, --   Same as Define
    -- PreCondit      { }, --   Preprocessor #if, #else, #endif, etc.

    Type           { fg="#ff2f6d" }, -- (*) int, long, char, etc.
    -- StorageClass   { fg=blue }, --   static, register, volatile, etc.
    -- Structure      { fg=green }, --   struct, union, enum, etc.
    -- Typedef        { fg=green }, --   A typedef

    Special        { fg="#f8aa01" }, -- (*) Any special symbol
    -- SpecialChar    { }, --   Special character in a constant
    -- Tag            { }, --   You can use CTRL-] on this
    -- Delimiter      { }, --   Character that needs attention
    -- SpecialComment { }, --   Special things inside a comment (e.g. '\n')
    -- Debug          { }, --   Debugging statements

    Underlined     { gui = "underline", fg=blue },
    -- Ignore         { }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
    -- Error          { }, -- Any erroneous construct
    Todo           { fg="#f8aa01" }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- These groups are for the native LSP client and diagnostic system. Some
    -- other LSP clients may use these groups, or use their own. Consult your
    -- LSP client's documentation.

    -- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
    --
    -- LspReferenceText            { } , -- Used for highlighting "text" references
    -- LspReferenceRead            { } , -- Used for highlighting "read" references
    -- LspReferenceWrite           { } , -- Used for highlighting "write" references
    -- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
    -- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
    -- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

    -- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
    --
    -- DiagnosticError            { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticWarn             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticInfo             { fg="#a6cccc" } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticHint             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticVirtualTextError { } , -- Used for "Error" diagnostic virtual text.
    -- DiagnosticVirtualTextWarn  { } , -- Used for "Warn" diagnostic virtual text.
    -- DiagnosticVirtualTextInfo  { } , -- Used for "Info" diagnostic virtual text.
    -- DiagnosticVirtualTextHint  { } , -- Used for "Hint" diagnostic virtual text.
    DiagnosticUnderlineError   { gui="underline" },
    -- DiagnosticUnderlineWarn    { } , -- Used to underline "Warn" diagnostics.
    -- DiagnosticUnderlineInfo    { } , -- Used to underline "Info" diagnostics.
    -- DiagnosticUnderlineHint    { } , -- Used to underline "Hint" diagnostics.
    -- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
    -- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
    -- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
    -- DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
    -- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
    -- DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.

    -- Tree-Sitter syntax groups.
    --
    -- See :h treesitter-highlight-groups, some groups may not be listed,
    -- submit a PR fix to lush-template!
    --
    -- Tree-Sitter groups are defined with an "@" symbol, which must be
    -- specially handled to be valid lua code, we do this via the special
    -- sym function. The following are all valid ways to call the sym function,
    -- for more details see https://www.lua.org/pil/5.html
    --
    -- sym("@text.literal")
    -- sym('@text.literal')
    -- sym"@text.literal"
    -- sym'@text.literal'
    --
    -- For more information see https://github.com/rktjmp/lush.nvim/issues/109

    -- sym"@text.literal"      { }, -- Comment
    -- sym"@text.reference"    { }, -- Identifier
    -- sym"@text.title"        { }, -- Title
    -- sym"@text.uri"          { }, -- Underlined
    -- sym"@text.underline"    { }, -- Underlined
    sym"@text.strong"         { gui="bold" },
    -- sym"@text.todo"         { }, -- Todo
    sym"@text.code"            { fg=yellow },
	sym"@text.code_block"      { fg="#a6cccc" },
    -- sym"@comment"           { }, -- Comment
    sym"@comment.documentation" { bg="#262626", fg="#ffd787" },
    sym"@punctuation"	{ fg=blue },
    sym"@punctuation.bracket"  { fg="#606060" },
    sym"@punctuation.special"  { fg=blue }, -- Delimiter
    -- sym"@constant"          { }, -- Constant
    -- sym"@constant.builtin"  { }, -- Special
    -- sym"@constant.macro"    { }, -- Define
    -- sym"@define"            { }, -- Define
    -- sym"@macro"             { }, -- Macro
    -- sym"@string"            { }, -- String
    -- sym"@string.escape"     { }, -- SpecialChar
    -- sym"@string.special"    { }, -- SpecialChar
    -- sym"@character"         { }, -- Character
    -- sym"@character.special" { }, -- SpecialChar
    -- sym"@number"            { }, -- Number
    -- sym"@boolean"           { }, -- Boolean
    -- sym"@float"             { }, -- Float
    -- sym"@function"          { }, -- Function
    -- sym"@function.builtin"  { }, -- Special
    -- sym"@function.macro"    { }, -- Macro
    -- sym"@parameter"         { }, -- Identifier
    -- sym"@method"            { }, -- Function
    sym"@field"                { fg="#00af87" },
    sym"@property"             { fg="#00af87" },
    -- sym"@constructor"       { }, -- Special
    -- sym"@conditional"       { }, -- Conditional
    -- sym"@repeat"            { }, -- Repeat
    -- sym"@label"             { }, -- Label
    -- sym"@operator"          { }, -- Operator
    -- sym"@keyword"           { }, -- Keyword
    -- sym"@exception"         { }, -- Exception
    -- sym"@variable"          { }, -- Identifier
    sym"@variable.builtin"     { fg="#4b76b8" }, -- Identifier
    -- sym"@type"              { }, -- Type
    -- sym"@type.definition"   { }, -- Typedef
    sym"@type.qualifier"              { fg="#4b76b8" },
    -- sym"@storageclass"      { }, -- StorageClass
    -- sym"@structure"         { }, -- Structure
    sym"@namespace"         { fg="#7fb1f5" }, -- Identifier
    -- sym"@include"           { }, -- Include
    -- sym"@preproc"           { }, -- PreProc
    -- sym"@debug"             { }, -- Debug
    -- sym"@tag"               { }, -- Tag

    sym"@text.todo.unchecked" { fg=red, bg="none"},
    sym"@text.todo.checked" { fg=green, bg="none"},
	sym"@text.todo.checked.text" { fg="#5f5f87" },
    sym"@text.reference"    { fg=blue, gui="underline"},

    -- https://github.com/nvim-telescope/telescope.nvim/blob/master/plugin/telescope.lua
    TelescopeSelection       { bg=muted },
}
end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap
