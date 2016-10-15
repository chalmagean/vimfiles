nnoremap ced :ElmShowDoc<cr>
nnoremap ceD :ElmBrowseDocs<cr>
nnoremap ceE :ElmErrorDetail<cr>

autocmd FileType elm setlocal tabstop=4
autocmd FileType elm setlocal shiftwidth=4

" call neocomplete#util#set_default_dictionary(
"   \ 'g:neocomplete#sources#omni#input_patterns',
"   \ 'elm',
"   \ '\.')
