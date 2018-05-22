" Leader
let mapleader = "\<Space>"

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Show the filename in iTerm
set title

set visualbell
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
set sidescroll=1
set statusline=
set statusline+=%-6.3n\                      " buffer number
set statusline+=%f\                          " filename
set statusline+=%h%m%r%w                     " status flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
set statusline+=%=                           " right align remainder
" set statusline+=0x%-8B                     " character value
set statusline+=%-14(%l,%c%V%)               " line, character
set statusline+=%<%P                         " file position
set autowrite                                " Automatically :write before
                                             " running commands
set ignorecase
set infercase
set smartcase
set foldlevel=99
set foldmethod=indent
set hidden
set nrformats=hex                            " Don't increment octals numbers

set formatoptions=crql                       " Removed `o` from the default
                                             " `croql` to prevent adding a 
                                             " comment delimiter when you 
                                             " press o/O
set formatoptions+=j " delete comment character when joining commented lines

" Make ESC respond faster
set timeoutlen=1000
set ttimeoutlen=0


" When switching buffers, focus the buffer if already open in a different tab
set switchbuf=usetab

set wildignorecase
set wildignore+=tags,*.jpg,*.ico,*.png,*.gif,*.svg,.DS_Store,node_modules/,elm-stuff/,.git/
set wildmode=longest:full,list:full

set lazyredraw

set nocursorcolumn
set nocursorline
set norelativenumber
set nonumber
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
set shortmess=a

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

  autocmd TermOpen * setlocal statusline=%{b:term_title}
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

  " Allow css and html/slim files to autocomplete hyphenated words
  autocmd FileType ruby,css,scss,sass,slim,html setlocal iskeyword+=-

  " Insert the pipe |> with <C-l>
  autocmd FileType elixir inoremap <C-l> \|> 

  autocmd FileType ruby,elixir,eelixir,slim setlocal number
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

  autocmd BufLeave *.elm normal! mE

  autocmd BufLeave *_controller.rb normal! mC
  autocmd BufLeave models/*.rb normal! mM
  autocmd BufLeave views/**/*.rb normal! mV
  autocmd BufLeave *_spec.rb normal! mS
augroup END

set scrolloff=3 " Keep 3 lines below and above the cursor

if has("termguicolors")
  set termguicolors
endif

if has("virtualedit")
  " Allow cursor to move where there is no text in visual block mode
  set virtualedit=block
endif

" Gui MacVim
if has("gui_vimr")
  set background=light
  color one
  set linespace=2
  set guioptions-=T " Removes top toolbar
  set guioptions-=r " Removes right hand scroll bar
  set go-=L " Removes left hand scroll bar

  " highlight CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=NONE
else " no gui
  color gruvbox
  set background=dark
endif


" Display extra whitespace
set list listchars=tab:»·,trail:.,nbsp:·

set showtabline=1

set textwidth=0

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
let g:netrw_hide = 1
let g:netrw_altv = 1
let g:netrw_browse_split = 0
" let g:netrw_liststyle = 1

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

set inccommand=nosplit

" Remove slipt separator vertical bar
" set fillchars=fold:-

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

" Auto save contents of a buffer when you lose focus
autocmd BufLeave,FocusLost * silent! update

" Based on a range, it replace `:my_key => "value"` to `my_key: value`
command! -range OldToNewHash <line1>,<line2>s/:\([a-zA-Z-0-9_]\+\)\s*=>/\1:/g

" Get the ticket number from the branch name
nnoremap <leader>gx :call ExtractTicketNumber()<cr>

" Extract the ticket number out of the branch name
" Works if branch name looks like this:
" feature/123_name_of_the_branch
function! ExtractTicketNumber()
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
" highlight ColorColumn ctermbg=233 guibg=red

" Make the gutter always visible
autocmd BufEnter * sign define dummy
autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')

" Set the gutter colors
highlight SignColumn ctermbg=NONE guibg=NONE

" Set a dark color for syntastic sign background
highlight SyntasticErrorSign ctermbg=NONE ctermfg=red guibg=#2a343a guifg=red
highlight SyntasticWarningSign ctermbg=NONE ctermfg=142 guibg=#2a343a guifg=#ad9909

let g:python3_host_prog = '/usr/local/bin/python3'

" Add a space after : and ,
" :%s/[:,]\ze[^ ]/& /g

" Replace multiple spaces before the = sign with one space
" Turns this:
"   foo     = bar
" into this:
"   foo = bar
" s/\(^\s\+[a-z.]\+\)\(\s\+\)/\1 /

" 0: Strict, consider non-blank characters before and after the tags.
" 1: Flexible, ignore non-blank characters before and after the tags.
let g:innerMultilineHTMLTagMode = 0

" https://vi.stackexchange.com/questions/13050/how-can-i-shift-only-inner-contents-of-html-element?newsletter=1&nlcode=592797%7c71ea
function! InnerMultilineHTMLTag()
   " Get the position of the first line of the last selected Visual area.
   let openingMark =  getpos("'<")

   " Get the position of the last line of the last selected Visual area.
   let closingMark = getpos("'>")

   " Check whether both marks are on the same line.
   if openingMark[1] != closingMark[1] 

      " Get the lines where the marks are on.
      let openingLine = getline(openingMark[1])
      let closingLine = getline(closingMark[1])

      " Check whether there's nothing appended to the opening tag.
      if g:innerMultilineHTMLTagMode == 1  ||
         \ match( openingLine, '\S',  openingMark[2] - 1) == -1 

         " Check whether the closing tag is at the beginning of the line.
         if match( closingLine, "$" ) + 1  ==  closingMark[2]
            " Restore and adjust the last Visual area.
            normal! gvVojo
            return

         " Check whether there's nothing prepended to the closing tag.
         elseif g:innerMultilineHTMLTagMode == 1  || 
            \   match( closingLine, '\S\%<' . closingMark[2] . "c" ) == -1
            " Restore and adjust the last Visual area.
            normal! gvVkojo
            return
         endif
      endif 
   endif

   " Do nothing. Restore the last Visual area.
   normal! gv
endfunction

function! ToggleInnerMultilineHTMLTagMode()
   if g:innerMultilineHTMLTagMode == 0 
      let g:innerMultilineHTMLTagMode = 1 
      echo "it text object is now flexible"
   else
      let g:innerMultilineHTMLTagMode = 0 
      echo "it text object is now strict"
   endif
endfunction

" Map to set the multi-line HTML tag mode.
" nnoremap - :call ToggleInnerMultilineHTMLTagMode()<CR>

" Map to extend the behavior of the 'it' text object to create linewise
" visual areas within multi-line HTML tags.
" See https://vi.stackexchange.com/q/13050/6698
vnoremap it it:<C-U>call InnerMultilineHTMLTag()<CR>
omap it :normal vit<CR>

" Remove diacritical signs from characters in specified range of lines.
" Examples of characters replaced: á -> a, ç -> c, Á -> A, Ç -> C.
" Uses substitute so changes can be confirmed.
function! s:RemoveDiacritics(line1, line2)
  let diacs = 'áâãàăâçéêíîóôõüúșț'  " lowercase diacritical signs
  let repls = 'aaaaaaceeiiooouust'  " corresponding replacements
  let diacs .= toupper(diacs)
  let repls .= toupper(repls)
  let diaclist = split(diacs, '\zs')
  let repllist = split(repls, '\zs')
  let trans = {}

  for i in range(len(diaclist))
    let trans[diaclist[i]] = repllist[i]
  endfor

  execute a:line1 . ',' . a:line2 . 's/[' . diacs . ']/\=trans[submatch(0)]/gIce'
endfunction

command! -range=% RemoveDiacritics call s:RemoveDiacritics(<line1>, <line2>)

if filereadable(expand("~/.gvimrc.after"))
  source ~/.gvimrc.after
endif
