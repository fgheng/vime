let s:code_actions = []


func! ActionMenuCodeActions() abort
	let s:code_actions = CocAction('codeActions')
	let l:menu_items = map(copy(s:code_actions), { index, item -> item['title'] })
	call actionmenu#open(l:menu_items, 'ActionMenuCodeActionsCallback')
endfunc

func! ActionMenuCodeActionsCallback(index, item) abort
	if a:index >= 0
	let l:selected_code_action = s:code_actions[a:index]
	let l:response = CocAction('doCodeAction', l:selected_code_action)
	endif
endfunc
