" Generated by Color Theme Generator at Sweyla
" http://sweyla.com/themes/seed/988775/

set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

" Set environment to 256 colours
set t_Co=256

let colors_name = "sweylaPy"


hi CursorLine     cterm=none ctermbg=235
hi CursorColumn   guibg=#000000 ctermbg=16
hi MatchParen     guifg=#191919 guibg=#00d700 gui=bold ctermfg=255 ctermbg=27 cterm=bold
hi Pmenu          guifg=#00FF00 guibg=#323232 ctermfg=255 ctermbg=236
hi PmenuSel       guifg=#00FF00 guibg=#B3A9BD ctermfg=255 ctermbg=249
"
" Background and menu colors
hi Cursor        guifg=#000000 guibg=#A0A0A0 ctermbg=250 gui=none
hi CursorLine    guifg=#000000 guibg=#A0A0A0 ctermbg=233 gui=none
hi iCursor       guifg=#000000 guibg=#00FF00 ctermbg=250 gui=none
hi Normal        guifg=#00FF00 guibg=#000000 gui=none ctermfg=46  ctermbg=NONE   cterm=none
hi NonText       guifg=#585858 guibg=#0F0F0F gui=none ctermfg=245  ctermbg=NONE   cterm=none
hi LineNr        guifg=#585858 guibg=#000000 gui=none ctermfg=240 ctermbg=NONE   cterm=none
hi StatusLine    guifg=#00d7ff guibg=#3a3a3a gui=none ctermfg=45 ctermbg=235  cterm=none
hi StatusLineNC  guifg=#005faf guibg=#262626 gui=none ctermfg=25 ctermbg=234 cterm=none
hi VertSplit     guifg=#00d7d7 guibg=#191919 gui=none ctermfg=44 ctermbg=234 cterm=none
hi Folded        guifg=#00d7af guibg=#000000 gui=none ctermfg=45 ctermbg=NONE  cterm=bold
hi Title         guifg=#B3A9BD guibg=NONE	gui=bold ctermfg=249 ctermbg=NONE cterm=bold
hi Visual        guifg=#00d7d7 guibg=#4e4e4e gui=none ctermfg=44 ctermbg=239 cterm=none
hi SpecialKey    guifg=#7AB96B guibg=#0F0F0F gui=none ctermfg=107 ctermbg=233 cterm=none
"hi DiffChange    guibg=#4C4C00 gui=none ctermbg=58 cterm=none
"hi DiffAdd       guibg=#25254C gui=none ctermbg=235 cterm=none
"hi DiffText      guibg=#663266 gui=none ctermbg=241 cterm=none
"hi DiffDelete    guibg=#3F0000 gui=none ctermbg=52 cterm=none
 
hi DiffChange       guibg=#4C4C09 gui=none ctermbg=234 cterm=none
hi DiffAdd          guibg=#252556 gui=none ctermbg=17 cterm=none
hi DiffText         guibg=#66326E gui=none ctermbg=22 cterm=none
hi DiffDelete       guibg=#3F000A gui=none ctermbg=NONE ctermfg=196 cterm=none
hi TabLineFill      guibg=#5E5E5E gui=none ctermbg=235 ctermfg=228 cterm=none
hi TabLine          guifg=#FFB053 gui=bold ctermbg=233 ctermfg=243 cterm=bold
hi TabLineSel       guifg=#FFB053 gui=bold ctermbg=238 ctermfg=34 cterm=bold
hi Search           cterm=bold ctermfg=250 ctermbg=19


" Syntax highlighting
hi Comment guifg=#00FFD7 gui=none ctermfg=50 cterm=none
hi Constant guifg=#af5faf gui=none ctermfg=139 cterm=none
hi Number guifg=#af5faf gui=none ctermfg=139 cterm=none
hi Identifier guifg=#80479F gui=none ctermfg=97 cterm=none
hi Statement guifg=#FF8700 gui=none ctermfg=208 cterm=none
hi Function guifg=#00FF00 gui=bold ctermfg=34 cterm=bold
hi Special guifg=#ffaf00 gui=none ctermfg=214 cterm=none
hi PreProc guifg=#ffaf00 gui=none ctermfg=214 cterm=none
hi Keyword guifg=#ffaf87 gui=none ctermfg=216 cterm=none
hi String guifg=#00D787 gui=none ctermfg=42 cterm=none
hi Type guifg=#00d7af gui=bold ctermfg=43 cterm=bold
hi pythonBuiltin guifg=#00d7ff gui=none ctermfg=45 cterm=none
hi ColorColumn ctermbg=234

hi SignColumn  cterm=bold ctermfg=255 ctermbg=NONE
autocmd VimEnter * hi NeomakeWarningDefault  ctermfg=255  ctermbg=52   cterm=none
autocmd VimEnter * hi NeomakeMessageSignDefault  ctermfg=255  ctermbg=NONE   cterm=bold
autocmd VimEnter * hi NeomakeWarningSignDefault  ctermfg=46   ctermbg=NONE   cterm=bold
autocmd VimEnter * hi NeomakeErrorSignDefault    ctermfg=196  ctermbg=NONE   cterm=bold

