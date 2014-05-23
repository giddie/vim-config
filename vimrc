filetype off   " Some distros need this
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set nocompatible

syntax on
filetype on
filetype indent on
filetype plugin on
colorscheme desert

set viminfo='100,f1
set encoding=utf-8      " Set encoding
set nowrap              " Don't wrap by default
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
set softtabstop=2       " 2 spaces for backspace
set expandtab           " Spaces instead of tabs
set winminheight=0      " Helps when handling multiple files
set hidden              " Allow modified buffers to be hidden
set textwidth=80        " A good standard console width
set formatprg=par\ -w80 " Clever paragraph formatting with par
set spelllang=en_gb     " Set the spelling language
set colorcolumn=81      " Highlight the 81st column

" Terminal interaction
set mouse=a             " Turn on mouse support
set ttymouse=xterm2     " This fixes window split dragging
set ttimeoutlen=100     " Short timeout for keycodes, or <Esc> is slow to react

" Tmux sends these codes for C-Arrow combinations. As those combinations don't
" have keycode names we can map to directly, we map the keycode to unused
" F-keys, and map that key to our actual target. These codes start with an
" escape, which is why we don't want to map them directly: it would cause an
" annoying delay when trying to escape from insert mode.
if &term == 'screen'
  set <F25>=[A
  map <F25> <C-Up>
  map! <F25> <C-Up>
  set <F26>=[B
  map <F26> <C-Down>
  map! <F26> <C-Down>
  set <F27>=[C
  map <F27> <C-Right>
  map! <F27> <C-Right>
  set <F28>=[D
  map <F28> <C-Left>
  map! <F28> <C-Left>
endif

" Gentler colour for the colorcolumn
highlight ColorColumn ctermbg=red ctermfg=white guibg=#574433

" remap j and k so that they move through display lines, rather than physical lines
noremap j gj
noremap <Down> gj
noremap k gk
noremap <Up> gk
" Visually select the text that was last edited / pasted
nmap gV '[V']
" Bindings for easy viewport scrolling
noremap <C-j> <C-e>
noremap <C-k> <C-y>
noremap <C-h> zh
noremap <C-l> zl
" map Q to replay the 'q' macro
nnoremap Q @q
" I often accidentally hit F1 instead of ESC
map <F1> <ESC>
map! <F1> <ESC>

" Shortcuts
nnoremap <Leader>nt :NERDTreeToggle<CR>
nnoremap <Leader>tl :TlistToggle<CR>
nnoremap <Leader>gu :GundoToggle<CR>
nnoremap <Leader>mb :MBEToggle<CR>
let g:gundo_width = 25
nnoremap <Leader>. :edit .<CR>

" Hidden characters
set listchars=tab:▸\ ,eol:¬

" Bubble text up and down
nmap <C-Up> [e
nmap <C-Down> ]e
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Easy buffer management
noremap <C-left> :bprev<CR>
noremap <C-right> :bnext<CR>
nnoremap <Leader>bc :Bclose<CR>

" Scratch buffers
function ScratchBuffer(name)
  execute "open " . a:name
  setlocal buftype=nofile
  setlocal bufhidden=hide
  setlocal noswapfile
endfun
command -nargs=1 ScratchBuffer :call ScratchBuffer('<args>')

" Default completion type for SuperTab
let g:SuperTabDefaultCompletionType = "context"

" Clang-complete configuration
let g:clang_use_library = 1
let g:clang_auto_select = 1
let g:clang_complete_copen = 1
let g:clang_snippets = 1

" A window pops up when using omni-complete, showing function signatures. This
" closes that window when leaving insert mode.
autocmd InsertLeave * if pumvisible() == 0 | pclose | endif

" Sudo-Write for writing to a file I don't have permissions for
command SudoW w !sudo tee % > /dev/null

" XML Formatting
command PrettyXML %!xmllint --format -

" Place the cursor where it was when the file was last edited
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" Auto-close Fugitive buffers after we're done with them
autocmd BufReadPost fugitive://* set bufhidden=delete

" Formatting, indentation, etc...
autocmd BufRead *.qml set filetype=qml smartindent
autocmd BufRead *.md set filetype=markdown
autocmd FileType * setlocal formatoptions-=o
autocmd FileType asciidoc setlocal wrap spell
autocmd FileType help setlocal nospell
autocmd FileType mail setlocal tw=75 formatprg=par\ -w75 cc=76
autocmd FileType make setlocal ts=4 sts=4 sw=4 noexpandtab
autocmd FileType markdown setlocal spell
let g:xml_syntax_folding=1
