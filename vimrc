" Leader
let mapleader = "\<Space>"

set exrc
set secure
set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set mouse=a       " enable the use of the mouse
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set statusline=
set statusline+=%-6.3n\                     " buffer number
set statusline+=%f\                          " filename
set statusline+=%h%m%r%w                     " status flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
set statusline+=%=                           " right align remainder
" set statusline+=0x%-8B                       " character value
set statusline+=%-14(%l,%c%V%)               " line, character
set statusline+=%<%P                         " file position
set autowrite     " Automatically :write before running commands
set ignorecase
set infercase
set smartcase
set foldlevel=99
set hidden
set nrformats=hex " Don't increment octals numbers
set formatoptions+=j " delete comment character when joining commented lines

" Make ESC respond faster
set timeoutlen=1000
set ttimeoutlen=0

set wildignorecase
set wildmode=list:full

set lazyredraw

set nocursorcolumn
set nocursorline
set norelativenumber
set number
set numberwidth=5

" Move backup files away from the current folder
set backupdir=~/tmp
set directory=~/tmp
set dir=~/tmp

if exists('+undofile')
  set undofile
  set undodir=~/.vim/undodir
  set undolevels=1000 " maximum number of changes that can be undone
  set undoreload=10000 " maximum number lines to save for undo on a buffer reload
endif

" The "Press ENTER or type command to continue" prompt is jarring and usually unnecessary.
set shortmess=atI

if filereadable(expand("~/.vim/vimrc.bundles"))
  source ~/.vim/vimrc.bundles
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

filetype plugin indent on

" Highlight current line on the active window only
augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
augroup END

cnoreabbrev W w
cnoreabbrev Q q

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Automatically wrap at 72 characters and spell check git commit messages
  autocmd FileType gitcommit setlocal textwidth=72
  autocmd FileType gitcommit setlocal spell
  " Remove _ from the keywords list so it doesn't autocomplete the branch names
  autocmd FileType gitcommit setlocal iskeyword=@,48-57,192-255

  " Allow css and slim files to autocomplete hyphenated words
  autocmd FileType ruby,css,scss,sass,slim setlocal iskeyword+=-

  autocmd FileType ruby setlocal colorcolumn=+1

  " Insert the pipe |> with <C-l>
  autocmd FileType elixir inoremap <C-l> \|> 

  autocmd FileType ruby,elixir,eelixir,slim setlocal number
  autocmd FileType ruby,elixir,eelixir,slim setlocal textwidth=0
  autocmd FileType ruby,elixir,eelixir,slim setlocal foldmethod=indent
augroup END

augroup VIMRC
  autocmd!

  " autocmd BufLeave *.css normal! mS
  " autocmd BufLeave *.scss normal! mS
  " autocmd BufLeave *.sass normal! mS

  autocmd BufLeave *.html normal! mH
  autocmd BufLeave *.erb normal! mH
  autocmd BufLeave *.slim normal! mH

  autocmd BufLeave *.js normal! mJ
  autocmd BufLeave *.coffee normal! mJ

  autocmd BufLeave *_controller.rb normal! mC
  autocmd BufLeave models/*.rb normal! mM
  autocmd BufLeave views/**/*.rb normal! mV
  autocmd BufLeave *_spec.rb normal! mS
augroup END

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

set scrolloff=3 " Keep 3 lines below and above the cursor

" Gui MacVim
set guifont=Meslo\ LG\ M\ DZ:h13
set guioptions-=T " Removes top toolbar
set guioptions-=r " Removes right hand scroll bar
set go-=L " Removes left hand scroll bar

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" set folds, default open
set foldmethod=manual
set showtabline=1

" set grepprg=grep\ -rnH\ --exclude='.*.swp'\ --exclude='*~'\ --exclude=tags

" Make it obvious where 80 characters is
set textwidth=80

" ruby path if you are using RVM
let g:ruby_path = system('rvm current')
" Intent private methods
let g:ruby_indent_access_modifier_style = 'outdent'

set hlsearch

" Exclude Javascript files in :Rtags via rails.vim due to warnings when parsing
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

" Directory list style
let g:netrw_banner = 0
let g:netrw_preview = 1
let g:netrw_liststyle = 0

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Set spellfile to location that is guaranteed to exist, can be symlinked to
" Dropbox or kept in Git and managed outside of thoughtbot/dotfiles using rcm.
set spellfile=$HOME/.vim-spell-en.utf-8.add

" Use UTF-8 without BOM
set encoding=utf-8 nobomb

set complete=.,w,b

" Always use vertical diffs
set diffopt+=vertical

" Use only 1 space after "." when joining lines instead of 2
set nojoinspaces

" Don't reset cursor to start of line when moving around
set nostartofline

"" Autocomplete ids and classes in CSS
autocmd FileType css,scss set iskeyword=@,48-57,_,-,?,!,192-255
"" Add the '-' as a keyword in erb files
autocmd FileType eruby set iskeyword=@,48-57,_,192-255,$,-
" Disable cursorline in ruby files. It makes scrolling much faster.
au BufNewFile,BufRead,BufEnter *.rb set nocursorline

" Custom mappings
nnoremap <leader>v :e ~/.vimrc<cr>
nnoremap <leader>V :e ~/.vim/vimrc.bundles<cr>
nnoremap <leader>a :Ag! 
" Disable highlighting
nnoremap <leader>h :noh<cr>
" Search for the word under cursor in the whole project
nnoremap K :Ag! "\b<C-R><C-W>\b"<cr>
nnoremap # :%s/<C-r><C-w>//n<CR>

" Resizing windows
nnoremap <Left> :vertical resize -2<CR>
nnoremap <Right> :vertical resize +2<CR>
nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>

" Auto save contents of a buffer when you lose focus
autocmd BufLeave,FocusLost * silent! update

" Based on a range, it replace `:my_key => "value"` to `my_key: value`
command! -range OldToNewHash <line1>,<line2>s/:\([a-zA-Z-0-9_]\+\)\s*=>/\1:/g

" Get the ticket number from the branch name
nnoremap <leader>gx :call ExtractTicketNumber()<cr>

" Extract the ticket number out of the branch name
" Works if branch name looks like this:
" feature/123_name_of_the_branch
function ExtractTicketNumber()
  " Lookup the ticket number and put it inside []
  " Also store it in register q
  execute "normal! /featur\rf/lvt_\"qyggi[\e\"qpA] "
  let ticket_number = getreg('q')

  " If the ticket number is all digits insert a # sign in front of it
  if ticket_number =~ '^\d\+$'
    execute "normal! F[a#\eA"
  endif

  startinsert!
endfunction

" Find where a partial is called
" With no arguments it uses the current file name to do the search.
" You can also pass a string to search for and it will do a search for
" a line matching render.*<your_string>
function! GrepPartial(...)
  if a:0
    let pattern = "render.*" . a:0
  else
    let filename = substitute(expand("%:t:r:r"), "^_", "", "")
    let pattern = "render.*" . filename
  endif

  execute "grep! -Re '" . pattern . "' app/views/"
endfunction
command! -nargs=? GrepPartial call GrepPartial(<args>)

" Set a dark color for the colorcolumn
" highlight ColorColumn ctermbg=233 guibg=#272e34
" highlight SignColumn ctermbg=NONE guibg=#2a343a

" Set a dark color for syntastic sign background
highlight SyntasticErrorSign ctermbg=NONE ctermfg=red guibg=#2a343a guifg=red
highlight SyntasticWarningSign ctermbg=NONE ctermfg=142 guibg=#2a343a guifg=#ad9909

" Damian Conway's Die Blink�nmatchen: highlight matches
nnoremap <silent> n n:call HLNext(0.1)<cr>
nnoremap <silent> N N:call HLNext(0.1)<cr>

function! HLNext (blinktime)
  let target_pat = '\c\%#'.@/
  let ring = matchadd('ErrorMsg', target_pat, 101)
  redraw
  exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
  call matchdelete(ring)
  redraw
endfunction

