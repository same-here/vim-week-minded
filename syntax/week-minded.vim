if !exists("main_syntax")
  if version < 600
	syntax clear
  elseif exists("b:current_syntax")
  finish
endif
  let main_syntax = 'weekminded'
endif

syn match wmList '^\*\s\w*:'
syn match wmList '\t\*\s\w*'
syn match wmListItem '_:\S*'
syn match wmListItemPend '?:\S*'
syn match wmListItemDone 'X:\S*'

syn match wmComment ' --.*'
"syn match wmImportant '^ - \[!\]\s.*'
" add different colors for better organization
syn match wmImportant '^!\s\w*'
syn match wmImportant '\t!\s\w*'
syn match wmImportant '^\s\+- \[!\]\s.*'
syn match wmWaiting '^?\s\w*'
syn match wmWaiting '\t?\s\w*'
syn match wmWaiting '^\s\+- \[?\]\s.*'
syn match wmHighlight '^-\s\w*'
syn match wmHighlight '\t-\s\w*'
syn match wmHighlight '^\s\+- \[-\]\s.*'

syn match wmDone '^X\s.*'
syn match wmDone '\tX\s.*'
syn match wmDone '^\d\s.*'
syn match wmDone '\t\d\s.*'
syn match wmDone '^\s\+- \[X\]\s.*'
syn match wmDone '^\s\+- \[\d\+\.\{-}\d*\]\s.*'
" match hours per task: - [1] , - [12] ,- [12.3] , - [12.34] 

syn match wmDate '#\d\d\d\d/\d\d/\d\d '
syn keyword wmDay Monday Tuesday Wednesday Thursday Friday Saturday Sunday

""DEBUG""
syn match wmTodo 'Todo'
syn match wmComment 'Comment'
syn match wmStatement 'Statement'
syn match wmType 'Type'
syn match wmPreProc 'PreProc'
syn match wmConstant 'Constant'

hi def link wmTodo       Todo
hi def link wmComment    Comment
hi def link wmStatement  Statement
hi def link wmType       Type
hi def link wmPreProc    PreProc
hi def link wmConstant   Constant

hi def link wmDate      Statement
hi def link wmDay       Type
hi def link wmDone      Comment
hi def link wmImportant PreProc
hi def link wmComment   Comment
hi def link wmWaiting   Type
hi def link wmHighlight Statement

hi def link wmList   Constant
"hi def link wmListItem  Statement  "commented out to keep white text
hi def link wmListItemPend   Type
hi def link wmListItemDone   Comment
