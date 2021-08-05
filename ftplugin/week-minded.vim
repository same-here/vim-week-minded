"week-minded.vim Plugin Functions
" create new task below
function! AddEmptyLineBelow()
  call append(line("."), " - [ ] ")
  normal! j
  startinsert!
endfunction

" create new task above
function! AddEmptyLineAbove()
  let l:scrolloffsave = &scrolloff
  " Avoid jerky scrolling with ^E at top of window
  set scrolloff=0
  call append(line(".") - 1, " - [ ] ")
  if winline() != winheight(0)
    silent normal! <C-e>
  end
  let &scrolloff = l:scrolloffsave
  normal! k
  startinsert!
endfunction

" REGEX of possible marks to find all these possible values
" - [ ] 
" - [*]
" - [!]
" - [1]
" - [12]
" - [12.25]
function! MarkSpace()
	s/ - \[[X!\*0-9]\{-}\.\{-}\d*\]/ - [ ]/e
endfunction
function! MarkX()
	s/ - \[[!\* 0-9]\{-}\.\{-}\d*\]/ - [X]/e
endfunction
function! MarkBang()
	s/ - \[[X\* 0-9]\{-}\.\{-}\d*\]/ - [!]/e
endfunction
function! MarkStar()
	s/ - \[[X! 0-9]\{-}\.\{-}\d*\]/ - [*]/e
endfunction
function! MarkHours()
	call inputsave()
	let g:hours = input("Enter Hours:")
	call inputrestore()
	exe 's/ - \[[X!\* 0-9]\{-}\.\{-}\d*\]/ - [' . g:hours . ']/e'
endfunction

"https://stackoverflow.com/questions/12805922/vim-vmap-send-selected-text-as-parameter-to-function
func! GetSelectedText()
  normal gv"xy
  let result = getreg("x")
  normal gv
  return result
endfunc

func! SimpleList(list)
	"echo a:list
	"remove hours from list
	let g:newList = substitute(a:list, ' - \[[X!\* 0-9]\{-}\.\{-}\d*\]', ' - ', 'g')
	"echo newList 
	
	"save new list to system clipboard
	let @*=g:newList

	"clear visual selection
	exe "norm! \<Esc>"

endfunc

vnoremap <silent> <leader>y :call SimpleList(GetSelectedText())<cr>

nnoremap <silent> <leader>n :call AddEmptyLineBelow()<CR>
nnoremap <silent> <leader>N :call AddEmptyLineAbove()<CR>
nnoremap <silent> <leader>x :call MarkX()<CR>
nnoremap <silent> <leader><space> :call MarkSpace()<CR>
nnoremap <silent> <leader>! :call MarkBang()<CR>
nnoremap <silent> <leader>* :call MarkStar()<CR>
nnoremap <silent> <leader>h :call MarkHours()<CR>

