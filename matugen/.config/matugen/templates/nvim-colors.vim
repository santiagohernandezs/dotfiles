" ==============================================================================
" MATUGEN.VIM - Material You Wallpaper-Adaptive Colorscheme for Neovim
" Re-generated dynamically by Matugen. 100% Expressive with Material Design 3.
" Supports both Classic Syntax and Modern Treesitter highlighting.
" ==============================================================================

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "matugen"

" ------------------------------------------------------------------------------
" Centralized Color Variables (Material Design 3 Tokens)
" ------------------------------------------------------------------------------
let s:background = "{{ colors.background.default.hex }}"
let s:on_background = "{{ colors.on_background.default.hex }}"
let s:surface_container = "{{ colors.surface_container.default.hex }}"
let s:surface_container_high = "{{ colors.surface_container_high.default.hex }}"
let s:on_surface = "{{ colors.on_surface.default.hex }}"
let s:on_surface_variant = "{{ colors.on_surface_variant.default.hex }}"
let s:outline = "{{ colors.outline.default.hex }}"
let s:outline_variant = "{{ colors.outline_variant.default.hex }}"
let s:primary = "{{ colors.primary.default.hex }}"
let s:on_primary = "{{ colors.on_primary.default.hex }}"
let s:primary_container = "{{ colors.primary_container.default.hex }}"
let s:on_primary_container = "{{ colors.on_primary_container.default.hex }}"
let s:secondary = "{{ colors.secondary.default.hex }}"
let s:on_secondary = "{{ colors.on_secondary.default.hex }}"
let s:secondary_container = "{{ colors.secondary_container.default.hex }}"
let s:on_secondary_container = "{{ colors.on_secondary_container.default.hex }}"
let s:tertiary = "{{ colors.tertiary.default.hex }}"
let s:on_tertiary = "{{ colors.on_tertiary.default.hex }}"
let s:tertiary_container = "{{ colors.tertiary_container.default.hex }}"
let s:on_tertiary_container = "{{ colors.on_tertiary_container.default.hex }}"
let s:error = "{{ colors.error.default.hex }}"
let s:on_error = "{{ colors.on_error.default.hex }}"
let s:error_container = "{{ colors.error_container.default.hex }}"
let s:on_error_container = "{{ colors.on_error_container.default.hex }}"
let s:none = "None"

" ------------------------------------------------------------------------------
" Highlighting Helper Function
" ------------------------------------------------------------------------------
function! s:h(group, style)
  let l:cmd = 'hi ' . a:group
  if has_key(a:style, 'fg')
    let l:cmd .= ' guifg=' . a:style.fg
  endif
  if has_key(a:style, 'bg')
    let l:cmd .= ' guibg=' . a:style.bg
  endif
  if has_key(a:style, 'gui')
    let l:cmd .= ' gui=' . a:style.gui
  endif
  execute l:cmd
endfunction

" ------------------------------------------------------------------------------
" Editor UI & Windowing
" ------------------------------------------------------------------------------
call s:h('Normal', {'bg': s:background, 'fg': s:on_background})
call s:h('NormalNC', {'bg': s:background, 'fg': s:on_background})
call s:h('CursorLine', {'bg': s:surface_container})
call s:h('CursorColumn', {'bg': s:surface_container})
call s:h('ColorColumn', {'bg': s:surface_container})

call s:h('LineNr', {'bg': s:none, 'fg': s:outline_variant})
call s:h('CursorLineNr', {'bg': s:none, 'fg': s:primary, 'gui': 'bold'})
call s:h('SignColumn', {'bg': s:none, 'fg': s:outline_variant})
call s:h('FoldColumn', {'bg': s:none, 'fg': s:outline_variant})
call s:h('Folded', {'bg': s:surface_container, 'fg': s:outline, 'gui': 'italic'})

call s:h('VertSplit', {'bg': s:none, 'fg': s:surface_container})
call s:h('WinSeparator', {'bg': s:none, 'fg': s:surface_container})

" ------------------------------------------------------------------------------
" Floating Windows & Dialogs
" ------------------------------------------------------------------------------
call s:h('NormalFloat', {'bg': s:surface_container, 'fg': s:on_surface})
call s:h('FloatBorder', {'bg': s:surface_container, 'fg': s:outline})
call s:h('FloatTitle', {'bg': s:surface_container, 'fg': s:primary, 'gui': 'bold'})

" ------------------------------------------------------------------------------
" Popup & Autocomplete Menus
" ------------------------------------------------------------------------------
call s:h('Pmenu', {'bg': s:surface_container, 'fg': s:on_surface})
call s:h('PmenuSel', {'bg': s:secondary_container, 'fg': s:on_secondary_container, 'gui': 'bold'})
call s:h('PmenuSbar', {'bg': s:surface_container_high})
call s:h('PmenuThumb', {'bg': s:outline})

" ------------------------------------------------------------------------------
" Selections & Search
" ------------------------------------------------------------------------------
call s:h('Selection', {'bg': s:secondary_container})
call s:h('Visual', {'bg': s:secondary_container})
call s:h('VisualNOS', {'bg': s:secondary_container})

call s:h('Search', {'bg': s:secondary_container, 'fg': s:on_secondary_container, 'gui': 'bold'})
call s:h('IncSearch', {'bg': s:primary, 'fg': s:on_primary, 'gui': 'bold'})
call s:h('CurSearch', {'bg': s:primary, 'fg': s:on_primary, 'gui': 'bold'})

" ------------------------------------------------------------------------------
" Classic Syntax Highlighting
" ------------------------------------------------------------------------------
call s:h('Comment', {'bg': s:none, 'fg': s:outline, 'gui': 'italic'})
call s:h('Constant', {'bg': s:none, 'fg': s:tertiary})
call s:h('String', {'bg': s:none, 'fg': s:secondary})
call s:h('Character', {'bg': s:none, 'fg': s:secondary})
call s:h('Number', {'bg': s:none, 'fg': s:tertiary, 'gui': 'bold'})
call s:h('Boolean', {'bg': s:none, 'fg': s:tertiary, 'gui': 'bold'})
call s:h('Float', {'bg': s:none, 'fg': s:tertiary, 'gui': 'bold'})

call s:h('Identifier', {'bg': s:none, 'fg': s:on_background})
call s:h('Function', {'bg': s:none, 'fg': s:primary, 'gui': 'bold'})

call s:h('Statement', {'bg': s:none, 'fg': s:primary, 'gui': 'bold'})
call s:h('Conditional', {'bg': s:none, 'fg': s:primary, 'gui': 'bold'})
call s:h('Repeat', {'bg': s:none, 'fg': s:primary, 'gui': 'bold'})
call s:h('Label', {'bg': s:none, 'fg': s:primary, 'gui': 'bold'})
call s:h('Operator', {'bg': s:none, 'fg': s:outline})
call s:h('Keyword', {'bg': s:none, 'fg': s:primary, 'gui': 'bold'})
call s:h('Exception', {'bg': s:none, 'fg': s:primary, 'gui': 'bold'})

call s:h('PreProc', {'bg': s:none, 'fg': s:tertiary})
call s:h('Include', {'bg': s:none, 'fg': s:tertiary})
call s:h('Define', {'bg': s:none, 'fg': s:tertiary})
call s:h('Macro', {'bg': s:none, 'fg': s:tertiary})
call s:h('PreCondit', {'bg': s:none, 'fg': s:tertiary})

call s:h('Type', {'bg': s:none, 'fg': s:secondary, 'gui': 'bold,italic'})
call s:h('StorageClass', {'bg': s:none, 'fg': s:primary, 'gui': 'bold'})
call s:h('Structure', {'bg': s:none, 'fg': s:secondary, 'gui': 'bold'})
call s:h('Typedef', {'bg': s:none, 'fg': s:secondary, 'gui': 'bold'})

call s:h('Special', {'bg': s:none, 'fg': s:secondary})
call s:h('SpecialChar', {'bg': s:none, 'fg': s:tertiary, 'gui': 'bold'})
call s:h('Tag', {'bg': s:none, 'fg': s:primary})
call s:h('Delimiter', {'bg': s:none, 'fg': s:outline_variant})
call s:h('SpecialComment', {'bg': s:none, 'fg': s:outline, 'gui': 'italic'})
call s:h('Debug', {'bg': s:none, 'fg': s:tertiary})

call s:h('Underlined', {'bg': s:none, 'fg': s:primary, 'gui': 'underline'})
call s:h('Ignore', {'bg': s:none, 'fg': s:outline_variant})
call s:h('Error', {'bg': s:error_container, 'fg': s:on_error_container, 'gui': 'bold'})
call s:h('Todo', {'bg': s:none, 'fg': s:tertiary, 'gui': 'bold,italic'})

" ------------------------------------------------------------------------------
" Modern Treesitter Highlight Mappings
" ------------------------------------------------------------------------------
hi! link @comment Comment
hi! link @string String
hi! link @string.escape SpecialChar
hi! link @character Character
hi! link @number Number
hi! link @boolean Boolean
hi! link @float Float

hi! link @function Function
hi! link @function.builtin Special
hi! link @function.macro Macro
hi! link @method Function
hi! link @parameter Identifier
hi! link @field Identifier
hi! link @property Identifier
hi! link @constructor Type

hi! link @conditional Conditional
hi! link @repeat Repeat
hi! link @label Label
hi! link @operator Operator
hi! link @keyword Keyword
hi! link @keyword.function Keyword
hi! link @keyword.operator Operator
hi! link @exception Exception

hi! link @type Type
hi! link @type.builtin Special
hi! link @structure Structure
hi! link @include Include
hi! link @variable Identifier
hi! link @variable.builtin Special

" ------------------------------------------------------------------------------
" UI Components (Gitsigns, Statusline, etc.)
" ------------------------------------------------------------------------------
call s:h('GitSignsAdd', {'bg': s:none, 'fg': s:primary})
call s:h('GitSignsChange', {'bg': s:none, 'fg': s:tertiary})
call s:h('GitSignsDelete', {'bg': s:none, 'fg': s:error})

call s:h('StatusLine', {'bg': s:primary_container, 'fg': s:on_primary_container})
call s:h('StatusLineNC', {'bg': s:surface_container, 'fg': s:on_surface_variant})

" ------------------------------------------------------------------------------
" Mini.files Specific Styling
" ------------------------------------------------------------------------------
call s:h('MiniFilesBorder', {'bg': s:surface_container, 'fg': s:outline})
call s:h('MiniFilesNormal', {'bg': s:surface_container, 'fg': s:on_surface})
call s:h('MiniFilesTitle', {'bg': s:surface_container, 'fg': s:primary, 'gui': 'bold'})
call s:h('MiniFilesCursorLine', {'bg': s:secondary_container})

" ------------------------------------------------------------------------------
" Mini.pick Specific Styling
" ------------------------------------------------------------------------------
call s:h('MiniPickNormal', {'bg': s:surface_container, 'fg': s:on_surface})
call s:h('MiniPickBorder', {'bg': s:surface_container, 'fg': s:outline})
call s:h('MiniPickBorderBusy', {'bg': s:surface_container, 'fg': s:primary})
call s:h('MiniPickBorderText', {'bg': s:surface_container, 'fg': s:primary, 'gui': 'bold'})
call s:h('MiniPickCursor', {'bg': s:primary, 'fg': s:on_primary})
call s:h('MiniPickIconDirectory', {'bg': s:none, 'fg': s:primary})
call s:h('MiniPickIconFile', {'bg': s:none, 'fg': s:secondary})
call s:h('MiniPickHeader', {'bg': s:surface_container, 'fg': s:secondary, 'gui': 'bold'})
call s:h('MiniPickMatchCurrent', {'bg': s:secondary_container, 'fg': s:on_secondary_container, 'gui': 'bold'})
call s:h('MiniPickMatchMarked', {'bg': s:tertiary_container, 'fg': s:on_tertiary_container, 'gui': 'bold'})
call s:h('MiniPickMatchRanges', {'fg': s:primary, 'gui': 'bold'})
call s:h('MiniPickPreviewLine', {'bg': s:surface_container_high, 'gui': 'bold'})
call s:h('MiniPickPreviewRegion', {'bg': s:secondary_container, 'fg': s:on_secondary_container})
call s:h('MiniPickPrompt', {'bg': s:surface_container, 'fg': s:primary, 'gui': 'bold'})
call s:h('MiniPickPromptCaret', {'bg': s:primary, 'fg': s:on_primary})
call s:h('MiniPickPromptPrefix', {'bg': s:surface_container, 'fg': s:primary, 'gui': 'bold'})

" ------------------------------------------------------------------------------
" Mini.completion Specific Styling
" ------------------------------------------------------------------------------
call s:h('MiniCompletionActiveParameter', {'fg': s:primary, 'gui': 'bold'})
call s:h('MiniCompletionDeprecated', {'fg': s:outline, 'gui': 'strikethrough'})
call s:h('MiniCompletionInfoBorderOutdated', {'fg': s:error})

" ------------------------------------------------------------------------------
" Mini.cmdline Specific Styling (Autopeek Window)
" ------------------------------------------------------------------------------
call s:h('MiniCmdlinePeekNormal', {'bg': s:surface_container, 'fg': s:on_surface})
call s:h('MiniCmdlinePeekBorder', {'bg': s:surface_container, 'fg': s:outline})
call s:h('MiniCmdlinePeekTitle', {'bg': s:surface_container, 'fg': s:primary, 'gui': 'bold'})
call s:h('MiniCmdlinePeekLineNr', {'bg': s:none, 'fg': s:outline_variant})
call s:h('MiniCmdlinePeekSep', {'bg': s:none, 'fg': s:outline_variant})
call s:h('MiniCmdlinePeekSign', {'bg': s:none, 'fg': s:outline_variant})
