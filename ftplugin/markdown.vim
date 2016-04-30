function! HLink2Md ()
  normal /<af"wdt"F<i()Pf>wdt<F(i[]Pf<2df>
endfunction

function! HImg2Md ()
  normal /<img/src=f"wdi"F<i()Pf</alt=f"wdi"F(i![]Pf<df>
endfunction

:noremap <leader>ma :call HLink2Md()<cr>
:noremap <leader>mi :call HImg2Md()<cr>
