command! SpaceOutRocket s/\s*\(=>\)\+\s*/ \1 /g
nnoremap <leader>l :SpaceOutRocket<CR>
nnoremap tt :TestNearest<CR>
nnoremap tl :TestLast<CR>
nnoremap tf :TestFile<CR>
