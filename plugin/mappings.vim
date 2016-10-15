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


" Visual mode mappings
""""""""""""""""""""""
xnoremap <C-h> <C-w>h
xnoremap <C-j> <C-w>j
xnoremap <C-k> <C-w>k
xnoremap <C-l> <C-w>l

" keep visual mode after indent
vnoremap > >gv
vnoremap < <gv


" Normal mode mappings
""""""""""""""""""""""

" Repeat last macro if in a normal buffer.
nnoremap <expr> <CR> empty(&buftype) ? '@@' : '<CR>'

" Avoid unintentional switches to Ex mode.
nmap Q q

" Multi-mode mappings (Normal, Visual, Operating-pending modes).
noremap Y y$

" nnoremap <silent> <Right> :vertical resize +5<CR>
" nnoremap <silent> <Left> :vertical resize -5<CR>
" nnoremap <silent> <Down> :resize +5<CR>
" nnoremap <silent> <Up> :resize -5<CR>

" Execute current line as an ex command
nnoremap <f2> yy:@"<CR>

" Search for the word under cursor in the whole project
nnoremap K :Ag! "\b<C-R><C-W>\b"<cr>


" Leader mappings
"""""""""""""""""

nnoremap <leader>v :e ~/.vimrc<cr>
nnoremap <leader>V :e ~/.vim/vimrc.bundles<cr>
nnoremap <leader>a :Ag!<Space>

" Disable highlighting
nnoremap <leader>h :noh<cr>

" <Leader><Leader> -- Open last buffer.
nnoremap <leader><leader> <C-^>

" <Leader>p -- Show the path of the current file (mnemonic: path; useful when
" you have a lot of splits and the status line gets truncated).
" nnoremap <Leader>p :echo expand('%')<CR>

nnoremap <leader>E :Errors<CR>

nnoremap <leader>w :bw<CR>
nnoremap <leader>W :BW<CR>

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>


" Insert mode mappings
""""""""""""""""""""""

inoremap kj <Esc>

