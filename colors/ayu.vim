" Initialisation:"{{{
" ----------------------------------------------------------------------------
hi clear
if exists("syntax_on")
  syntax reset
endif

let s:style = get(g:, 'ayucolor', 'dark')
let g:colors_name = "ayu"
"}}}

" Palettes:"{{{
" ----------------------------------------------------------------------------

" let s:palette.operator  = {'dark': "#E7C547",  'light': "#FF8773",  'mirage': "#80D4FF"}
" let s:palette.special   = {'dark': "#E6B673",  'light': "#FFD33D",  'mirage': "#FFC44C"}
" let s:palette.keyword   = {'dark': "#FF7733",  'light': "",  'mirage': "#FFAE57"}
" let s:palette.error     = {'dark': "#FF3333",  'light': "#F07178",  'mirage': "#FF3333"}
" let s:palette.string    = {'dark': "#F29718",  'light': "#FFCC66",  'mirage': "#EDB879"}
" let s:palette.string    = {'dark': "#95E6CB",  'light': "#36A3D9",  'mirage': "#95E6CB"}

let s:palette = {}

let s:palette.bg        = {'dark': "#212733",  'light': "#212733",  'mirage': "#212733"}

let s:palette.markup    = {'dark': "#F07178",  'light': "#F07178",  'mirage': "#F07178"}
let s:palette.comment   = {'dark': "#5C6773",  'light': "#5C6773",  'mirage': "#5C6773"}
" comment
let s:palette.constant  = {'dark': "#FFEE99",  'light': "#FFEE99",  'mirage': "#D4BFFF"}
let s:palette.operator  = {'dark': "#E7C547",  'light': "#FF7733",  'mirage': "#FF8773"}
let s:palette.tag       = {'dark': "#36A3D9",  'light': "#5CCFE6",  'mirage': "#5CCFE6"}
let s:palette.string    = {'dark': "#F29718",  'light': "#FFCC66",  'mirage': "#EDB879"}
let s:palette.regexp    = {'dark': "#95E6CB",  'light': "#80D4FF",  'mirage': "#D4BFFF"}
let s:palette.accent    = {'dark': "#B8CC52",  'light': "#A7CD81",  'mirage': "#A7CD81"}
let s:palette.function  = {'dark': "#FFB454",  'light': "#FFD57F",  'mirage': "#EDB879"}
let s:palette.keyword   = {'dark': "#FF7733",  'light': "#FF7733",  'mirage': "#FFAE57"}

let s:palette.error     = {'dark': "#FF3333",  'light': "#FF3333",  'mirage': "#FF3333"}
let s:palette.panel     = {'dark': "#14191F",  'light': "#272D38",  'mirage': "#272D38"}
let s:palette.guide     = {'dark': "#2D3640",  'light': "#27344B",  'mirage': "#3D4751"}
let s:palette.line      = {'dark': "#151A1E",  'light': "#242B38",  'mirage': "#242B38"}
let s:palette.selection = {'dark': "#253340",  'light': "#343F4C",  'mirage': "#343F4C"}
let s:palette.fg        = {'dark': "#E6E1CF",  'light': "#D9D7CE",  'mirage': "#D9D7CE"}
let s:palette.fg_idle   = {'dark': "#3E4B59",  'light': "#607080",  'mirage': "#607080"}

let s:palette.special   = {'dark': "#E6B673",  'light': "#EF6C0C",  'mirage': "#36A3D9"}
let s:palette.accent    = {'dark': "#FFFFFF",  'light': "#EDB879",  'mirage': "#EDB879"}
let s:palette.important = {'dark': "#FFFFFF",  'light': "#FF7733",  'mirage': "#F07178"}

let s:palette.removed   = {'dark': "",  'light': "",  'mirage': "#F07178"}
let s:palette.added     = {'dark': "",  'light': "",  'mirage': "#A7CD81"}
let s:palette.todo      = {'dark': "",  'light': "",  'mirage': "#6161FA"}

"#A04748  #FF8773 #FFD33D #09152D #27344B #267275 #A04748
"
"#5C6773"

"#F07178"
"#D4BFFF"
"#FF8773"
"#5CCFE6"
"#267275"
"#A7CD81"
"#FFD57F"
"#FFD33D"
"#A04748"
"#FF3333"
"#FFCC66"
"#271320"
"#27344B"
"#242B38"
"#343F4C"
"#D9D7CE"
"#607080"

"#EF6C0C"
"#BBE67E"
"#EDB879"
"#09152D"
"}}}

" Highlighting Primitives:"{{{
" ----------------------------------------------------------------------------

function! s:build_prim(hi_elem, field)
  let l:vname = "s:" . a:hi_elem . "_" . a:field " s:bg_gray
  let l:gui_assign = "gui".a:hi_elem."=".s:palette[a:field][s:style] " guibg=...
  exe "let " . l:vname . " = ' " . l:gui_assign . "'"
endfunction

let s:bg_none = ' guibg=NONE ctermbg=NONE'
let s:fg_none = ' guifg=NONE ctermfg=NONE'
for [key_name, d_value] in items(s:palette)
  call s:build_prim('bg', key_name)
  call s:build_prim('fg', key_name)
endfor
" }}}

" Formatting Options:"{{{
" ----------------------------------------------------------------------------
let s:none   = "NONE"
let s:t_none = "NONE"
let s:n      = "NONE"
let s:c      = ",undercurl"
let s:r      = ",reverse"
let s:s      = ",standout"
let s:b      = ",bold"
let s:u      = ",underline"
let s:i      = ",italic"

exe "let s:fmt_none = ' gui=NONE".          " cterm=NONE".          " term=NONE"        ."'"
exe "let s:fmt_bold = ' gui=NONE".s:b.      " cterm=NONE".s:b.      " term=NONE".s:b    ."'"
exe "let s:fmt_bldi = ' gui=NONE".s:b.      " cterm=NONE".s:b.      " term=NONE".s:b    ."'"
exe "let s:fmt_undr = ' gui=NONE".s:u.      " cterm=NONE".s:u.      " term=NONE".s:u    ."'"
exe "let s:fmt_undb = ' gui=NONE".s:u.s:b.  " cterm=NONE".s:u.s:b.  " term=NONE".s:u.s:b."'"
exe "let s:fmt_undi = ' gui=NONE".s:u.      " cterm=NONE".s:u.      " term=NONE".s:u    ."'"
exe "let s:fmt_curl = ' gui=NONE".s:c.      " cterm=NONE".s:c.      " term=NONE".s:c    ."'"
exe "let s:fmt_ital = ' gui=NONE".s:i.      " cterm=NONE".s:i.      " term=NONE".s:i    ."'"
exe "let s:fmt_stnd = ' gui=NONE".s:s.      " cterm=NONE".s:s.      " term=NONE".s:s    ."'"
exe "let s:fmt_revr = ' gui=NONE".s:r.      " cterm=NONE".s:r.      " term=NONE".s:r    ."'"
exe "let s:fmt_revb = ' gui=NONE".s:r.s:b.  " cterm=NONE".s:r.s:b.  " term=NONE".s:r.s:b."'"
"}}}

" Vim Highlighting: (see :help highlight-groups)"{{{
" ----------------------------------------------------------------------------
exe "hi! Normal"        .s:fg_fg          .s:bg_bg          .s:fmt_none
exe "hi! ColorColumn"   .s:fg_none        .s:bg_bg          .s:fmt_none
" Conceal, Cursor, CursorIM
exe "hi! CursorColumn"  .s:fg_none        .s:bg_bg          .s:fmt_none
exe "hi! CursorLine"    .s:fg_none        .s:bg_bg          .s:fmt_bold
exe "hi! CursorLineNr"  .s:fg_accent      .s:bg_bg          .s:fmt_none
exe "hi! LineNr"        .s:fg_guide       .s:bg_none        .s:fmt_none

exe "hi! Directory"     .s:fg_fg_idle     .s:bg_none        .s:fmt_none
exe "hi! DiffAdd"       .s:fg_added       .s:bg_none        .s:fmt_none
exe "hi! DiffChange"    .s:fg_tag         .s:bg_none        .s:fmt_none
exe "hi! DiffText"      .s:fg_fg          .s:bg_none        .s:fmt_none
exe "hi! ErrorMsg"      .s:fg_fg          .s:bg_error       .s:fmt_stnd
exe "hi! IncSearch"     .s:fg_constant    .s:bg_none        .s:fmt_revr
exe "hi! Folded"        .s:fg_constant    .s:bg_bg          .s:fmt_bold
exe "hi! FoldColumn"    .s:fg_fg          .s:bg_bg          .s:fmt_none
exe "hi! SignColumn"    .s:fg_fg          .s:bg_bg          .s:fmt_none

exe "hi! MatchParen"    .s:fg_error       .s:bg_bg          .s:fmt_bold
exe "hi! ModeMsg"       .s:fg_string      .s:bg_none        .s:fmt_none
exe "hi! MoreMsg"       .s:fg_string      .s:bg_none        .s:fmt_none
exe "hi! NonText"       .s:fg_guide       .s:bg_none        .s:fmt_none
exe "hi! Pmenu"         .s:fg_fg          .s:bg_bg          .s:fmt_none
exe "hi! PmenuSel"      .s:fg_none        .s:bg_bg          .s:fmt_bold
"   PmenuSbar"
"   PmenuThumb"
exe "hi! Question"      .s:fg_string      .s:bg_none        .s:fmt_none
exe "hi! Search"        .s:fg_constant    .s:bg_none        .s:fmt_bold
exe "hi! SpecialKey"    .s:fg_selection   .s:bg_none        .s:fmt_none
exe "hi! SpellCap"      .s:fg_tag         .s:bg_none        .s:fmt_undr
exe "hi! SpellLocal"    .s:fg_keyword     .s:bg_none        .s:fmt_undr
exe "hi! SpellBad"      .s:fg_error       .s:bg_none        .s:fmt_bold
exe "hi! SpellRare"     .s:fg_regexp      .s:bg_none        .s:fmt_undr
exe "hi! StatusLine"    .s:fg_fg          .s:bg_bg          .s:fmt_none
exe "hi! StatusLineNC"  .s:fg_fg_idle     .s:bg_bg          .s:fmt_none
exe "hi! VertSplit"     .s:fg_bg          .s:bg_none        .s:fmt_none
exe "hi! WildMenu"      .s:fg_bg          .s:bg_markup      .s:fmt_none
exe "hi! TabLine"       .s:fg_bg          .s:bg_bg          .s:fmt_none
exe "hi! TabLineFill"   .s:fg_fg          .s:bg_bg          .s:fmt_none
exe "hi! TabLineSel"    .s:fg_string      .s:bg_none        .s:fmt_bold
"   TabLineFill"
"   TabLineSel"
exe "hi! Title"         .s:fg_keyword     .s:bg_bg          .s:fmt_none
exe "hi! Visual"        .s:fg_none        .s:bg_selection   .s:fmt_none
"   VisualNos"
exe "hi! WarningMsg"    .s:fg_error       .s:bg_none        .s:fmt_none

" TODO LongLineWarning to use variables instead of hardcoding
hi LongLineWarning  guifg=NONE        guibg=#371F1C     gui=underline ctermfg=NONE        ctermbg=NONE        cterm=underline
"   WildMenu"

"}}}

" Generic Syntax Highlighting: (see :help group-name)"{{{
" ----------------------------------------------------------------------------
exe "hi! Comment"         .s:fg_comment   .s:bg_none        .s:fmt_ital
exe "hi! Conceal"         .s:fg_guide     .s:bg_none        .s:fmt_none
exe "hi! CursorLineConceal" .s:fg_guide   .s:bg_line        .s:fmt_none
exe "hi! Constant"        .s:fg_important .s:bg_none        .s:fmt_bold
exe "hi! Error"           .s:fg_fg        .s:bg_error       .s:fmt_none
exe "hi! Function"        .s:fg_function  .s:bg_none        .s:fmt_none
exe "hi! Identifier"      .s:fg_tag       .s:bg_none        .s:fmt_none
exe "hi! Ignore"          .s:fg_none      .s:bg_none        .s:fmt_none
exe "hi! Operator"        .s:fg_operator  .s:bg_none        .s:fmt_none
"   Keyword"
"   Exception"
exe "hi! PreProc"         .s:fg_regexp  .s:bg_none        .s:fmt_none
"   Include"
"   Define"
"   Macro"
"   PreCondit"
exe "hi! qfLineNr"        .s:fg_keyword   .s:bg_none        .s:fmt_none
"   qfFileName"
"   qfLineNr"
"   qfError"
exe "hi! Special"         .s:fg_special   .s:bg_none        .s:fmt_none
"   SpecialChar"
"   Tag"
"   Delimiter"
"   SpecialComment"
"   Debug"
exe "hi! Statement"       .s:fg_error     .s:bg_none        .s:fmt_none
"   Conditional"
"   Repeat"
" }}}
"   Label"
exe "hi! String"          .s:fg_string    .s:bg_none        .s:fmt_none
" let s:c      = #",undercurl"
" let s:r      = #",reverse"
" let s:s      = #",standout"
" let s:b      = #",bold"
" let s:u      = #",underline"
" let s:i      = #",italic"
"   Character"
"   Number"
exe "hi! Boolean"         .s:fg_important .s:bg_none        .s:fmt_bold
"   Float"
exe "hi! Structure"       .s:fg_special   .s:bg_none        .s:fmt_none
"   Typedef"
exe "hi! Type"            .s:fg_tag       .s:bg_none        .s:fmt_none
"   StorageClass"
exe "hi! Todo"            .s:fg_todo      .s:bg_none        .s:fmt_bold
" Quickfix window highlighting
exe "hi! Underlined"      .s:fg_tag       .s:bg_none        .s:fmt_undr

" Terminal
" ---------
if has('nvim')
  let g:terminal_color_0 =  '#212733'
  let g:terminal_color_1 =  '#ff557f'
  let g:terminal_color_2 =  '#a7cd81'
  let g:terminal_color_3 =  '#ffd787'
  let g:terminal_color_4 =  '#6495ed'
  let g:terminal_color_5 =  '#8e6ebc'
  let g:terminal_color_6 =  '#87ceeb'
  let g:terminal_color_7 =  '#ffd8b5'
  let g:terminal_color_8 =  '#000000'
  let g:terminal_color_9 =  '#fb4934'
  let g:terminal_color_10 = '#a8e137'
  let g:terminal_color_11 = '#fc9b29'
  let g:terminal_color_12 = '#1a8fff'
  let g:terminal_color_13 = '#c31fc9'
  let g:terminal_color_14 = '#19cfce'
  let g:terminal_color_15 = '#ffffff'
  let g:terminal_color_background = g:terminal_color_0
  let g:terminal_color_foreground = s:palette.fg[s:style]
else
  let g:terminal_ansi_colors =  [s:palette.bg[s:style],      s:palette.markup[s:style]]
  let g:terminal_ansi_colors += [s:palette.string[s:style],  s:palette.accent[s:style]]
  let g:terminal_ansi_colors += [s:palette.tag[s:style],     s:palette.constant[s:style]]
  let g:terminal_ansi_colors += [s:palette.regexp[s:style],  "#FFFFFF"]
  let g:terminal_ansi_colors += [s:palette.fg_idle[s:style], s:palette.error[s:style]]
  let g:terminal_ansi_colors += [s:palette.string[s:style],  s:palette.accent[s:style]]
  let g:terminal_ansi_colors += [s:palette.tag[s:style],     s:palette.constant[s:style]]
  let g:terminal_ansi_colors += [s:palette.regexp[s:style],  s:palette.comment[s:style]]
endif


" NerdTree
" ---------
exe "hi! NERDTreeOpenable"          .s:fg_fg_idle     .s:bg_none        .s:fmt_none
exe "hi! NERDTreeClosable"          .s:fg_accent      .s:bg_none        .s:fmt_none
" exe "hi! NERDTreeBookmarksHeader"   .s:fg_pink        .s:bg_none        .s:fmt_none
" exe "hi! NERDTreeBookmarksLeader"   .s:fg_bg          .s:bg_none        .s:fmt_none
" exe "hi! NERDTreeBookmarkName"      .s:fg_keyword     .s:bg_none        .s:fmt_none
" exe "hi! NERDTreeCWD"               .s:fg_pink        .s:bg_none        .s:fmt_none
exe 'hi! NERDTreeUp'        .s:fg_fg_idle   .s:bg_none  .s:fmt_none
exe 'hi! NERDTreeDir'       .s:fg_added     .s:bg_none  .s:fmt_none
exe 'hi! NERDTreeFile'      .s:fg_none      .s:bg_none  .s:fmt_none
exe 'hi! NERDTreeDirSlash'  .s:fg_accent    .s:bg_none  .s:fmt_none


" GitGutter
" ---------
exe "hi! GitGutterAdd"          .s:fg_added     .s:bg_none  .s:fmt_none
exe "hi! GitGutterChange"       .s:fg_tag       .s:bg_none  .s:fmt_bold
exe "hi! GitGutterDelete"       .s:fg_removed   .s:bg_none  .s:fmt_none
exe "hi! GitGutterChangeDelete" .s:fg_important .s:bg_none  .s:fmt_none

"}}}

" Diff Syntax Highlighting:"{{{
" ----------------------------------------------------------------------------
" Diff
"   diffOldFile
"   diffNewFile
"   diffFile
"   diffOnly
"   diffIdentical
"   diffDiffer
"   diffBDiffer
"   diffIsA
"   diffNoEOL
"   diffCommon
" hi! link diffRemoved Constant
"   diffChanged
exe 'hi! diffRemoved'   .s:fg_removed   .s:bg_panel .s:fmt_bold
exe 'hi! diffAdded'     .s:fg_added     .s:bg_panel .s:fmt_bold
"   diffLine
"   diffSubname
"   diffComment

"}}}
" Markdown: {{{
exe "hi! htmlH1"                .s:fg_none    .s:bg_important        .s:fmt_bold
exe "hi! htmlH2"                .s:fg_keyword   .s:bg_none             .s:fmt_bold
" hi! link mkdHeading htmlH1
" hi! link htmlH2 diffAdded
"   diffChanged
" }}}
" Python: {{{
" types, builtin objects
hi! link pythonBuiltin Boolean
" " callables
hi! link pythonFunction Todo
" " if / else
" hi! link pythonConditional deusRedBold
" " and / in / or / not
" hi! link pythonOperator deusRed
" " def / return
" hi! link pythonStatement diffAdded
" " @ symbol
" hi! link pythonDecorator deusRedBold
" " name
hi! link pythonDecoratorName gitGutterChange
" " from ...  import
" hi! link pythonInclude Todo
" hi! link pythonExceptions deusOrangeBold
" hi! link pythonString GitGutterChangeDelete
" hi! link pythonAttribute GitGutterChangeDelete
" exe "hi! pythonBoolean"         .s:fg_important .s:bg_none        .s:fmt_none
" }}}
" This is needed for some reason: {{{

let &background = s:style
" }}}
