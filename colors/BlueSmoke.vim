" Vim color file

" First remove all existing highlighting.
set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "BlueSmoke"

" Normal should come first
" Orangish hue : #FEF1E0
hi Normal		guifg=Grey5 guibg=White

hi Cursor		guifg=White guibg=Black
hi lCursor		guifg=NONE guibg=Cyan

hi Visual		guifg=White guibg=SlateBlue
hi VisualNOS	gui=underline,bold

hi Folded		guifg=#808080 guibg=#ECECEC

hi StatusLineNC	guifg=Grey75 guibg=NavyBlue
hi VertSplit    guifg=Grey75 guibg=NavyBlue
hi StatusLine	guifg=White guibg=NavyBlue gui=None

hi LineNr		guifg=#959595 guibg=#ECECEC
hi CursorLine	guibg=#FFF4CE

hi DiffAdd       guibg=LightBlue
hi DiffChange    guibg=LightMagenta
hi DiffDelete    gui=bold guifg=Blue guibg=LightCyan
hi DiffText      gui=bold guibg=Red
hi Directory     guifg=Blue
hi ErrorMsg      guibg=White guifg=DarkRed	   
hi Error         guibg=White guifg=DarkRed	   
hi FoldColumn    guibg=Grey guifg=DarkBlue
hi IncSearch     gui=reverse
hi ModeMsg       gui=None
hi MoreMsg       gui=None guifg=SeaGreen
hi NonText       gui=bold guifg=gray guibg=white
hi Pmenu         guibg=LightBlue
hi PmenuSel      guifg=White  guibg=DarkBlue
hi Question      gui=bold guifg=SeaGreen
hi Search        guibg=Yellow guifg=NONE
hi SpecialKey    guifg=Blue
hi Title         gui=bold guifg=Magenta
hi WarningMsg    guifg=Red
hi WildMenu      guibg=Yellow guifg=Black

" Syntax highlighting

hi Comment		guifg=Grey50 
hi Operator		guifg=Cyan4
hi String		guifg=Red4
hi Constant		guifg=Red4
hi Type			guifg=Blue3 gui=None
hi Identifier	guifg=Cyan4
hi Function		guifg=Cyan4
hi PreProc		guifg=magenta4
hi Special		guifg=magenta4
hi Statement	guifg=Blue3 gui=None

" vim: sw=2
