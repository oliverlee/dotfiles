" Vim color file
set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "alshain"

hi Normal guibg=grey20 guifg=#eeeeec
"hi Normal guibg=#2f0b24 guifg=#eeeeec

hi SpecialKey term=bold ctermfg=4 guifg=#3465A4
hi NonText term=bold cterm=bold ctermfg=4 gui=bold guifg=#3465A4
hi Directory term=bold ctermfg=4 guifg=#3465A4
hi ErrorMsg term=standout cterm=bold ctermfg=7 ctermbg=1 gui=bold guifg=#D3D7CF guibg=#CC0000
hi IncSearch term=reverse cterm=reverse gui=reverse
"hi Search term=reverse ctermbg=3 guibg=#772953 guifg=NONE
hi Search term=reverse ctermbg=3 guibg=#c4a000 guifg=bg
hi MoreMsg term=bold ctermfg=2 gui=bold guifg=#4E9A06
hi ModeMsg term=bold cterm=bold gui=bold
hi LineNr term=underline ctermfg=3 guifg=#C4A000
hi Question term=standout ctermfg=2 gui=bold guifg=#4E9A06
hi StatusLine term=bold,reverse cterm=bold,reverse gui=bold guifg=fg guibg=Gray15
hi StatusLineNC term=reverse cterm=reverse gui=bold guifg=fg guibg=Gray15
hi VertSplit term=reverse cterm=reverse gui=bold guifg=fg guibg=Gray15
hi Title term=bold ctermfg=5 gui=bold guifg=#75507B
hi Visual term=reverse cterm=reverse gui=reverse guifg=NONE guibg=NONE
hi VisualNOS term=bold,underline cterm=bold,underline gui=bold,underline
hi WarningMsg term=standout ctermfg=1 gui=bold guifg=#CC0000
hi WildMenu term=standout ctermfg=0 ctermbg=3 guifg=#2E3436 guibg=#C4A000
hi Folded term=standout ctermfg=4 ctermbg=7 guifg=#3465A4 guibg=#D3D7CF
hi FoldColumn term=standout ctermfg=4 ctermbg=7 guifg=#3465A4 guibg=#D3D7CF
hi DiffAdd term=bold ctermbg=4 guibg=#3465A4
hi DiffChange term=bold ctermbg=5 guibg=#75507B
hi DiffDelete term=bold cterm=bold ctermfg=4 ctermbg=6 gui=bold guifg=#3465A4 guibg=#06989A
hi DiffText term=reverse cterm=bold ctermbg=1 gui=bold guibg=#CC0000
hi Cursor gui=reverse guifg=NONE guibg=NONE
hi CursorLine term=underline cterm=NONE guibg=grey22
hi iCursor guibg=fg

" Colors for syntax highlighting
hi Comment term=bold ctermfg=4 guifg=#3465A4
hi Constant term=underline ctermfg=1 guifg=#ef2929
"hi Constant term=underline ctermfg=1 guifg=#CC0000
hi Special term=bold ctermfg=5 guifg=BlueViolet
hi Identifier term=underline ctermfg=6 guifg=#06989A
hi Statement term=bold ctermfg=3 gui=bold guifg=#C4A000
hi PreProc term=underline ctermfg=5 guifg=Magenta2
hi Type term=underline ctermfg=2 gui=bold guifg=#4E9A06
hi Ignore cterm=bold ctermfg=7 guifg=#D3D7CF
hi Error term=reverse cterm=bold ctermfg=7 ctermbg=1 gui=bold guifg=#D3D7CF guibg=#CC0000
hi Todo term=standout ctermfg=0 ctermbg=3 guifg=#2E3436 guibg=#C4A000

