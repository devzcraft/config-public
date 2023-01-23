local status, n = pcall(require, "neosolarized")
if not status then
    return
end

n.setup({ comment_italics = true })

local colorbuddy = require("colorbuddy.init")
local Color = colorbuddy.Color
local colors = colorbuddy.colors
local Group = colorbuddy.Group
local groups = colorbuddy.groups
local styles = colorbuddy.styles

Color.new("white", "#ffffff")
Color.new("black", "#000000")
Group.new("Normal", colors.base1, colors.NONE, styles.NONE)
Group.new("CursorLine", colors.none, colors.base03, styles.NONE, colors.base1)
Group.new("CursorLineNr", colors.yellow, colors.black, styles.NONE, colors.base1)
Group.new("Visual", colors.none, colors.base03, styles.reverse)

local cError = groups.Error.fg
local cInfo = groups.Information.fg
local cWarn = groups.Warning.fg
local cHint = groups.Hint.fg

Group.new("DiagnosticVirtualTextError", cError, cError:dark():dark():dark():dark(), styles.NONE)
Group.new("DiagnosticVirtualTextInfo", cInfo, cInfo:dark():dark():dark(), styles.NONE)
Group.new("DiagnosticVirtualTextWarn", cWarn, cWarn:dark():dark():dark(), styles.NONE)
Group.new("DiagnosticVirtualTextHint", cHint, cHint:dark():dark():dark(), styles.NONE)
Group.new("DiagnosticUnderlineError", colors.none, colors.none, styles.undercurl, cError)
Group.new("DiagnosticUnderlineWarn", colors.none, colors.none, styles.undercurl, cWarn)
Group.new("DiagnosticUnderlineInfo", colors.none, colors.none, styles.undercurl, cInfo)
Group.new("DiagnosticUnderlineHint", colors.none, colors.none, styles.undercurl, cHint)

local bg = Color.new("neosolarized_bg", "#082129")
local txt = Color.new("neosolarized_text", "#2aa198")

Group.new("TelescopeBorder", bg, bg)
Group.new("TelescopeNormal", colors.base1, bg)

Group.new("TelescopePromptTitle", txt)
Group.new("TelescopePromptBorder", colors.base03, colors.base03)
Group.new("TelescopePromptNormal", colors.base1, colors.base03)

Group.new("TelescopePreviewBorder", bg, bg)
Group.new("TelescopePreviewTitle", txt)

Group.new("TelescopeResultsTitle", txt)

Group.new("LspDiagnosticsError", colors.none, cError:dark():dark():dark(), styles.NONE, colors.NONE)
Group.new("LspDiagnosticsErrorLineNr", cError, cError:dark():dark():dark(), styles.NONE, cError)

Group.new("LspDiagnosticsInfo", colors.none, cInfo:dark():dark():dark(), styles.NONE, colors.NONE)
Group.new("LspDiagnosticsInfoLineNr", cInfo, cInfo:dark():dark():dark(), styles.NONE, colors.NONE)
