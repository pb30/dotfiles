"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File: "/home/caciano/.vim/dante.vim"
" Created: "Thu, 23 May 2002 00:12:20 -0300 (caciano)"
" Updated: "Sat, 24 Aug 2002 14:04:21 -0300 (caciano)"
" Copyright (C) 2002, Caciano Machado <caciano@inf.ufrgs.br>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colorscheme Option:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
hi clear
if exists("syntax on")
    syntax reset
endif
let g:colors_name = "customdante"

filetype plugin on

" General colors
hi Normal      ctermfg=white ctermbg=black guibg=black guifg=white
hi Directory   term=bold ctermfg=blue guifg=blue
hi ErrorMsg    term=standout ctermfg=white ctermbg=red guifg=white guibg=red
hi NonText     term=bold ctermfg=darkgray guifg=darkgray
hi SpecialKey  term=bold ctermfg=darkgray guifg=darkgray
hi LineNr      term=underline ctermfg=darkgray guifg=darkgray
hi IncSearch   term=reverse cterm=reverse
hi Search      term=reverse ctermfg=black ctermbg=yellow guifg=black  guibg=yellow
hi Visual      term=bold,reverse cterm=bold,reverse ctermfg=gray ctermbg=black guifg=gray guifg=black
hi VisualNOS   term=bold,underline cterm=bold,underline
hi MoreMsg     term=bold ctermfg=green
hi ModeMsg     term=bold cterm=bold
hi Question    term=standout ctermfg=green guifg=green
hi WarningMsg  term=standout ctermfg=red guifg=red
hi WildMenu    term=standout ctermfg=black ctermbg=yellow guifg=black guibg=yellow
hi Folded      term=standout ctermfg=blue ctermbg=white guifg=blue guibg=white
hi FoldColumn  term=standout ctermfg=blue ctermbg=white guifg=blue guibg=white
hi DiffAdd     term=bold ctermbg=blue guibg=blue
hi DiffChange  term=bold ctermbg=darkmagenta guibg=darkmagenta
hi DiffDelete  term=bold cterm=bold ctermfg=lightblue ctermbg=cyan guifg=lightblue guibg=cyan
hi DiffText    term=reverse cterm=bold ctermbg=red guibg=red
hi Cursor      guifg=bg
hi lCursor     guifg=bg
hi StatusLine  term=reverse cterm=reverse
hi StatusLineNC term=reverse cterm=reverse
hi VertSplit   term=reverse cterm=reverse
hi Title       term=bold ctermfg=magenta guifg=magenta

" syntax hi colors
hi Comment     term=bold ctermfg=darkgray guifg=darkgray
hi PreProc     term=underline ctermfg=blue guifg=blue
hi Constant    term=underline ctermfg=darkred guifg=orange
hi Type        term=underline ctermfg=darkgreen guifg=darkgreen
hi Statement   term=bold ctermfg=blue guifg=blue
hi Identifier  term=underline ctermfg=darkyellow guifg=orange
hi Ignore      term=bold ctermfg=darkgray guifg=darkgray
hi Special     term=underline ctermfg=brown guifg=brown
hi Error       term=reverse ctermfg=gray ctermbg=red guifg=gray guibg=red
hi Todo        term=standout ctermfg=black ctermbg=yellow guifg=black guibg=yellow
hi Underlined  term=underline cterm=underline ctermfg=blue guifg=blue
hi Number      term=underline ctermfg=red guifg=red
hi Conditional ctermfg=blue guifg=blue
hi Repeat      ctermfg=blue guifg=blue
hi String      ctermfg=white guifg=white
hi Function    ctermfg=red guifg=red

" syntax hi links
hi link Character    Constant
hi link Number       Constant
hi link Boolean      Constant
hi link Float        Number
hi link Number       Constant
hi link Label        Statement
hi link Keyword      Statement
hi link Exception    Statement
hi link Operator     Statement
hi link Include      PreProc
hi link Define       PreProc
hi link Macro        PreProc
hi link PreCondit    PreProc
hi link StorageClass Type
hi link Structure    Type
hi link Typedef      Type
hi link Tag          Statement
hi link SpecialChar  Special
hi link Delimiter    Special
hi link Debug        Special
hi link SpecialComment    Special

" pb30's changes
hi phpStorageClass  ctermfg=blue guifg=blue
hi phpComment       ctermfg=darkgray guifg=darkgray
hi phpMethodsVar    ctermfg=lightgray guifg=darkgray
hi phpConditional   ctermfg=blue guifg=blue
hi phpVarSelector   ctermfg=darkyellow guifg=orange
hi javascript       ctermfg=lightgray guifg=lightgray
hi javaScriptBraces ctermfg=darkyellow guifg=orange
hi htmlTag          ctermfg=blue guifg=blue

hi link htmlEndTag  htmlTag
hi link phpType     phpConditional
hi link phpRepeat   phpConditional
hi link phpMemberSelector phpMethodsVar