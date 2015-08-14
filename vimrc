" Leader
let mapleader = "\<Space>"

set exrc
set secure
set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
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
set smartcase
set foldlevel=10
set hidden

" Make ESC respond faster
set timeoutlen=1000
set ttimeoutlen=0

set nocursorcolumn
set nocursorline
set norelativenumber
syntax sync minlines=256

" Move backup files away from the current folder
set backupdir=~/tmp
set directory=~/tmp
set dir=~/tmp

if exists('+undofile')
  set undofile
  set undodir=~/tmp
endif

" The "Press ENTER or type command to continue" prompt is jarring and usually unnecessary.
set shortmess=atI

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

if filereadable(expand("~/.vim/vimrc.bundles"))
  source ~/.vim/vimrc.bundles
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

filetype plugin indent on

" Load a color theme
set background=dark

" Highlight current line on the active window only
augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
augroup END

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

  " Allow css and slim files to autocomplete hyphenated words
  autocmd FileType ruby,css,scss,sass,slim setlocal iskeyword+=-
  autocmd FileType slim setlocal textwidth=120
augroup END

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Gui MacVim
set guifont=Inconsolata:h15
set guioptions-=T " Removes top toolbar
set guioptions-=r " Removes right hand scroll bar
set go-=L " Removes left hand scroll bar

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" set folds, default open
set foldmethod=indent
set foldlevel=20
set foldlevelstart=20
set showtabline=1
au BufRead * normal zR

" auto save/load folds
silent !mkdir -p ~/.vim/tmp/view &>/dev/null
set viewdir=~/.vim/tmp/view
augroup vimrc-folds
  au BufWinEnter * silent! loadview
  au BufWinLeave * silent! mkview
augroup END

set grepprg=grep\ -rnH\ --exclude='.*.swp'\ --exclude='*~'\ --exclude=tags

" Make it obvious where 80 characters is
set textwidth=80
autocmd FileType ruby setlocal colorcolumn=+1

" ruby path if you are using RVM
let g:ruby_path = system('rvm current')
" Intent private methods
let g:ruby_indent_access_modifier_style = 'outdent'
" Folding in ruby
let ruby_no_comment_fold = 1
let ruby_fold = 1
let g:sh_fold_enabled=4

set hlsearch

set number
set numberwidth=5

" Exclude Javascript files in :Rtags via rails.vim due to warnings when parsing
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

" Directory list style
let g:netrw_banner = 0
let g:netrw_preview = 1
let g:netrw_liststyle = 3
let g:netrw_winsize   = 30

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

" Autocomplete with dictionary words when spell check is on
set complete+=kspell

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

" Custom mappings
nmap <leader>j :VimFilerBufferDir<cr>
nmap <leader>h :set nohlsearch!<cr>
nmap <leader>a :Ag! 
nnoremap K :Ag! "\b<C-R><C-W>\b"<cr>
nmap <C-j> o<Esc>k
nnoremap # :%s/<C-r><C-w>//n<CR>

" Auto save contents of a buffer when you lose focus
autocmd BufLeave,FocusLost * silent! update

" Based on a range, it replace `:my_key => "value"` to `my_key: value`
command! -range OldToNewHash <line1>,<line2>s/:\([a-zA-Z-0-9_]\+\)\s*=>/\1:/g

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

color codeschool
" Set a dark color for the colorcolumn
highlight ColorColumn ctermbg=233 guibg=#272e34
highlight SignColumn ctermbg=NONE guibg=#2a343a

" Set a dark color for syntastic sign background
highlight SyntasticErrorSign ctermbg=NONE ctermfg=red guibg=#2a343a guifg=red
highlight SyntasticWarningSign ctermbg=NONE ctermfg=142 guibg=#2a343a guifg=#ad9909

