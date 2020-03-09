" let g:AutoPairsShortcutJump = '<M-n>'
" let g:AutoPairsShortcutBackInsert = '<M-N>'

"Default: '<M-e>'
"Fast wrap the word. all pairs will be consider as a block (include <>).
"(|)'hello' after fast wrap at |, the word will be ('hello')
"(|)<hello> after fast wrap at |, the word will be (<hello>)

au FileType php  let b:AutoPairs = AutoPairsDefine({'<?' : '?>', '<?php': '?>'})
au FileType rust let b:AutoPairs = AutoPairsDefine({'\w\zs<': '>'})
" add <!-- --> pair and remove '{' for html file
" au FileType html let b:AutoPairs = AutoPairsDefine({'<!--' : '-->'}, ['{'])
au FileType md   let b:AutoPairs = AutoPairsDefine({'```:```'})
