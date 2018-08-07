" Command mode mappings
"""""""""""""""""""""""
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" `<Tab>`/`<S-Tab>` to move between matches without leaving incremental search.
" Note dependency on `'wildcharm'` being set to `<C-z>` in order for this to
" work.
" cnoremap <expr> <Tab> getcmdtype() == '/' \|\| getcmdtype() == '?' ? '<CR>/<C-r>/' : '<C-z>'
" cnoremap <expr> <S-Tab> getcmdtype() == '/' \|\| getcmdtype() == '?' ? '<CR>?<C-r>/' : '<S-Tab>'

cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

" center search results
cnoremap <expr> <CR> getcmdtype() =~ '[/?]' ? '<CR>zz' : '<CR>'

" Visual mode mappings
""""""""""""""""""""""

vnoremap <D-h> <Esc><c-w>h
vnoremap <D-j> <Esc><c-w>j
vnoremap <D-k> <Esc><c-w>k
vnoremap <D-l> <Esc><c-w>l
" keep visual mode after indent
vnoremap > >gv
vnoremap < <gv

" Expand to current path
cabbr %% <C-R>=expand('%:p:h')<CR>

" Normal mode mappings
""""""""""""""""""""""

" Repeat last macro if in a normal buffer.
nnoremap <expr> <CR> empty(&buftype) ? '@@' : '<CR>'

" Avoid unintentional switches to Ex mode.
nmap Q q

" Multi-mode mappings (Normal, Visual, Operating-pending modes).
noremap Y y$

nnoremap <silent> <Right> :vertical resize +5<CR>
nnoremap <silent> <Left> :vertical resize -5<CR>
nnoremap <silent> <Down> :resize -5<CR>
nnoremap <silent> <Up> :resize +5<CR>

nnoremap <D-h> <c-w>h
nnoremap <D-j> <c-w>j
nnoremap <D-k> <c-w>k
nnoremap <D-l> <c-w>l

" Execute current line as an ex command
nnoremap <f2> yy:@"<CR>
nnoremap <f5> :BufOnly<CR>
nnoremap <S-f5> :b1\|BufOnly<CR>

" Search for the word under cursor in the whole project
nnoremap K :Tags <c-r>=expand("<cword>")<CR><CR>

nnoremap <TAB> :bnext<CR>
nnoremap <S-TAB> :bprev<CR>

nnoremap <leader><leader> :BD<CR>

" Leader mappings
"""""""""""""""""
nnoremap <leader>v :e ~/.vimrc<cr>
nnoremap <leader>V :e ~/.vim/vimrc.bundles<cr>
nnoremap <leader>a :Ag<Space>
nnoremap <C-p> :Files<cr>

" Disable highlighting
nnoremap <leader>h :noh<cr>

nnoremap <leader>f :NERDTreeToggle<cr>
nnoremap <leader>F :NERDTreeFind<cr>

" Copy file path
nmap <leader>p :let @" = expand("%")<CR>

" vinegar
nmap - <Plug>VinegarUp
nmap _ <Plug>VinegarSplitUp
nmap \ <Plug>VinegarVerticalSplitUp

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Insert mode mappings
""""""""""""""""""""""

xnoremap <D-h> <C-w>h
xnoremap <D-j> <C-w>j
xnoremap <D-k> <C-w>k
xnoremap <D-l> <C-w>l

" Disable backspace so I am forced to use C-h
inoremap <BS> <Nop>

" Disable <C-Space>
" http://shallowsky.com/blog/linux/editors/vim-ctrl-space.html
inoremap <Nul> <Space>
inoremap <C-@> <Space>
noremap  <Nul> <Nop>
vnoremap <Nul> <Nop>
cnoremap <Nul> <Nop>
nnoremap <Nul> <Nop>

" Terminal mode mappings
""""""""""""""""""""""""
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  " tnoremap <C-c> <C-\><C-n>

  " Terminal mode:
  tnoremap <D-h> <c-\><c-n><c-w>h
  tnoremap <D-j> <c-\><c-n><c-w>j
  tnoremap <D-k> <c-\><c-n><c-w>k
  tnoremap <D-l> <c-\><c-n><c-w>l

  tnoremap <expr> <A-r> '<C-\><C-N>"'.nr2char(getchar()).'pi'
endif
