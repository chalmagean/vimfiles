:nnoremap <silent><buffer> <leader>e :call ledger#transaction_state_toggle(line('.'), ' *?!')<CR>
:vnoremap <silent><buffer> <leader>a :LedgerAlign<CR>
