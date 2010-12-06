syntax on
colorscheme desert
filetype on
filetype plugin on

set viminfo='100,f1
set nocompatible
set encoding=utf-8      " Set encoding
set wrap                " Wrap by default
set linebreak           " Wrap at word boundaries
set sidescroll=1        " Scroll 1 char at a time
set incsearch           " Incremental search
set ignorecase          " Ignore case when searching
set smartcase           " ...but only when lower-case
set scrolloff=2         " Show 2-line context when scrolling
set autoindent          " Automatic indentation
set ruler               " Display cursor position in lower right corner
set showcmd             " Show incomplete commands
set number              " Line Number
set backspace=indent,eol,start   " Allow backspace over these chars
set shiftwidth=2        " 2 spaces for indenting
set tabstop=2           " 2 spaces for tab
set expandtab           " Spaces instead of tabs
set winminheight=0      " Helps when handling multiple files
set hidden              " Allow modified buffers to be hidden

" remap j and k so that they move through display lines, rather than physical lines
noremap j gj
noremap <Down> gj
noremap k gk
noremap <Up> gk
" set C-J and C-K to scroll the buffer with the cursor static on screen
noremap <C-j> 1<C-D>
noremap <C-k> 1<C-U>
" map Q to replay the 'q' macro
nnoremap Q @q

" Easy buffer management
noremap <C-left> :bprev<CR>
noremap <C-right> :bnext<CR>
let g:qb_hotkey = "<S-TAB>"
command Bc Bclose

" Scratch buffers
fun! ScratchBuffer(name)
  execute "open " . a:name
  setlocal buftype=nofile
  setlocal bufhidden=hide
  setlocal noswapfile
endfun
command! -nargs=1 ScratchBuffer :call ScratchBuffer('<args>')

" NERDTree
nnoremap <Leader>nt :NERDTreeToggle<CR>

" Highlight characters at column 81
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
command RightMargin match OverLength /\%81v/
RightMargin

" Sudo-Write for writing to file I don't have permissions for
command SudoW w !sudo tee % > /dev/null

" Formatting of pipe-delimited tables in Cucumber
fun! CukeTable() range
  execute ":" . a:firstline . "," . a:lastline . "Align |"
  for linenum in range(a:firstline, a:lastline)
    let curline = getline(linenum)
    let replacement = substitute(curline, ' |', '|', '')
    let replacement = substitute(replacement, '| $', '|', '')
    call setline(linenum, replacement)
  endfor
endfun
command! -range CukeTable :<line1>,<line2>call CukeTable()
noremap <Leader>ct :CukeTable<CR>

" XML Formatting
command PrettyXML %!xmllint --format -

" set wrapping options for code files
autocmd FileType c,cpp,javascript set nowrap textwidth=80 formatoptions=cq
" set C-style indentation for appropriate files
autocmd FileType c,cpp set cindent
" set smartindent for other code files
autocmd FileType javascript set smartindent
" XML Folding
let g:xml_syntax_folding=1
"au FileType xml setlocal foldmethod=syntax
