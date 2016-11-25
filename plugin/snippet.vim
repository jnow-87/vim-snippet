if exists("g:loaded_snippet") || &compatible
    finish
endif

let g:loaded_snippet = 1


""""
"" global variables
""""
let g:snippet_start = "<cursor>"
let g:snippet_base = "~/.vim/snippets"

""""
"" functions
""""

" \brief	load the content of the given file to buffer,
" 			jumpt to the defined start tag (g:snippet_start)
" 			and enter insert mode
"
" \param	file	file with the content to be loaded
function Snippet(file)
	" insert file content
	exec "-1read " g:snippet_base . "/" . a:file

	" search for start pattern
	exe "normal /" . g:snippet_start . "\<cr>"

	" delete start pattern
	exec "normal df" . g:snippet_start[strlen(g:snippet_start) - 1]

	" enter insert mode
	call feedkeys("i", "t")

	" move cursor if on whitespace
	if match(getline('.')[col('.')-1], '\s') == 0
		call feedkeys("\<right>", "t")
	endif
endfunction
