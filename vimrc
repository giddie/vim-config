syntax on
filetype plugin indent on

" Install any missing plugins
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

call plug#begin('~/.vim/vim-plug')

" Colorschemes
Plug 'KeitaNakamura/neodark.vim'
" Plug 'morhetz/gruvbox'
" Plug 'ajh17/Spacegray.vim'

" Navigation
Plug 'easymotion/vim-easymotion'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/taglist.vim'
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-dirvish'
Plug 'tpope/vim-eunuch'

" Buffers
Plug 'jlanzarotta/bufexplorer'
Plug 'moll/vim-bbye'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'wesQ3/vim-windowswap'

" Editing
Plug 'adelarsq/vim-matchit'
Plug 'ap/vim-css-color'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'bronson/vim-visual-star-search'
Plug 'kana/vim-textobj-user'
Plug 'glts/vim-textobj-comment'
Plug 'junegunn/vim-easy-align'
Plug 'machakann/vim-highlightedyank'
Plug 'michaeljsmith/vim-indent-object'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'Raimondi/delimitMate'
Plug 'sirver/UltiSnips'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/tComment'
Plug 'mattn/emmet-vim'
Plug 'christianrondeau/vim-base64'

" Other
Plug 'craigemery/vim-autotag'
Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
"Plug 'uplus/deoplete-solargraph'

call plug#end()

if has('termguicolors')
  if !has('neovim')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  endif
  set termguicolors
endif

set background=dark
let g:neodark#solid_vertsplit = 1
let g:neodark#background = '#303030'
" let g:gruvbox_italic = 1
" let g:gruvbox_contrast_dark = 'soft'
" let g:spacegray_low_contrast = 1
colorscheme neodark

" Default ALE warning highlights look bad in my theme
highlight ALEWarning guibg=#404040
highlight ALEError guibg=#904040

" Gentler colour for the colorcolumn
highlight ColorColumn ctermbg=red ctermfg=white guibg=#404040

set nowrap              " Don't wrap by default
set linebreak           " Wrap at word boundaries
set sidescroll=1        " Scroll 1 char at a time
set incsearch           " Incremental search
set ignorecase          " Ignore case when searching
set smartcase           " ...but only when lower-case
set scrolloff=2         " Show 2-line context when scrolling
set autoindent          " Automatic indentation
set showcmd             " Show incomplete commands
set number              " Line Number
set shiftwidth=2        " 2 spaces for indenting
set tabstop=2           " 2 spaces for tab
set softtabstop=2       " 2 spaces for backspace
set expandtab           " Spaces instead of tabs
set winminheight=0      " Helps when handling multiple files
set hidden              " Allow modified buffers to be hidden
set textwidth=80        " A good standard console width
set autoread            " Re-read unchanged buffers if they change on-disk
set formatprg=par\ -w80 " Clever paragraph formatting with par
set spelllang=en_gb     " Set the spelling language
set colorcolumn=81      " Highlight the 81st column
if has('nvim')
  set inccommand=split
endif

" Cursor position highlighting
:nnoremap <silent> <Leader>ml :execute 'match Search /\%'.line('.').'l/'<CR>
:nnoremap <silent> <Leader>mc :execute '2match Search /\%'.virtcol('.').'v/'<CR>
:nmap <Leader>mx <Leader>ml <Leader>mc
:nnoremap <silent> <Leader>mn :match<CR>:2match<CR>

" Automatic window size adjustment
set winheight=5
set winminheight=5
set winheight=30
set winwidth=80

" Terminal interaction
set mouse=a             " Turn on mouse support
if !has('nvim')
  set ttymouse=xterm2   " This fixes window split dragging
endif
set ttimeoutlen=10      " Short timeout for keycodes, or <Esc> is slow to react

" Tmux sends these codes for C-Arrow combinations. As those combinations don't
" have keycode names we can map to directly, we map the keycode to unused
" F-keys, and map that key to our actual target. These codes start with an
" escape, which is why we don't want to map them directly: it would cause an
" annoying delay when trying to escape from insert mode.
if !('nvim') && &term == 'screen-256color'
  set <F26>=[1;5A
  map <F26> <C-Up>
  map! <F26> <C-Up>
  set <F27>=[1;5B
  map <F27> <C-Down>
  map! <F27> <C-Down>
  set <F28>=[1;5C
  map <F28> <C-Right>
  map! <F28> <C-Right>
  set <F29>=[1;5D
  map <F29> <C-Left>
  map! <F29> <C-Left>
endif

" Status Line
set laststatus=2
let &stl=""
let &stl.="%<%F "                 " File path
let &stl.="%(| %R%M | %)"         " Flags
let &stl.="%= "                   " Right-align
let &stl.="%(| %{fugitive#statusline()} %)"
let &stl.="%(| %{&filetype} %)"   " File type
let &stl.="| %l-%c/%L "           " Line/column number

"ALE Options
let g:ale_sign_column_always = 1
let g:ale_linters = {
\  'ruby': ['ruby']
\}

" Deoplete options
let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" DelimitMate options
noremap <Leader>dm :DelimitMateSwitch<CR>
imap <C-L> <Plug>delimitMateS-Tab
let delimitMate_expand_space = 1
let delimitMate_expand_cr = 1
let delimitMate_balance_matchpairs = 1
let delimitMate_jump_expansion = 1

" FZF (Fuzzy Find)
noremap <Leader>oc :BTags<CR>
noremap <Leader>ob :Buffers<CR>
noremap <Leader>of :Files<CR>
noremap <Leader>oh :Helptags<CR>
noremap <Leader>ol :BLines<CR>
noremap <Leader>ot :Tags<CR>
noremap <Leader>oz :Rg<Space>
imap <C-X><C-w> <plug>(fzf-complete-word)
imap <C-X><C-f> <plug>(fzf-complete-path)
let g:fzf_colors =
\ { "fg":      ["fg", "Normal"],
  \ "bg":      ["bg", "Normal"],
  \ "hl":      ["fg", "Conditional"],
  \ "fg+":     ["fg", "CursorLine", "CursorColumn", "Normal"],
  \ "bg+":     ["bg", "CursorLine", "CursorColumn"],
  \ "hl+":     ["fg", "Conditional"],
  \ "info":    ["fg", "Conditional"],
  \ "border":  ["fg", "Ignore"],
  \ "prompt":  ["fg", "Comment"],
  \ "pointer": ["fg", "Conditional"],
  \ "marker":  ["fg", "Conditional"],
  \ "spinner": ["fg", "Conditional"],
  \ "header":  ["fg", "WildMenu"] }
autocmd! User FzfStatusLine setlocal statusline=[fzf]

" Ack (Searching)
command -nargs=* Find :Ack! <args>
noremap <Leader>f :Find<Space>
noremap <Leader>x :cclose<CR>
let g:ackprg = 'rg --vimgrep'

" UltiSnips options
let g:UltiSnipsUsePythonVersion=3
let g:UltiSnipsExpandTrigger = "<C-J>"
let g:UltiSnipsJumpForwardTrigger = "<C-J>"
let g:UltiSnipsJumpBackwardTrigger = "<C-K>"

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
nnoremap <Leader>lt :TlistToggle<CR>
nnoremap <Leader>gu :GundoToggle<CR>
nnoremap <Leader>ale :ALEToggle<CR>
vmap <Enter> <Plug>(LiveEasyAlign)
nmap <Leader>a <Plug>(LiveEasyAlign)
let g:gundo_width = 25

" End-of-line whitespace highlighting
" http://sartak.org/2011/03/end-of-line-whitespace-in-vim.html
autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
highlight EOLWS ctermbg=red guibg=#904040

" Remove all end-of-line whitespace
" http://sartak.org/2011/03/end-of-line-whitespace-in-vim.html
function! <SID>StripTrailingWhitespace()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
nmap <silent> <Leader><space> :call <SID>StripTrailingWhitespace()<CR>

" Bubble text up and down
nmap <C-Up> [e
nmap <C-Down> ]e
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Easy buffer management
noremap <C-left> :bprev<CR>
noremap <C-right> :bnext<CR>
nnoremap <Leader>bc :Bdelete<CR>

" Scratch buffers
function! ScratchBuffer(name)
  execute "visual " . a:name
  setlocal buftype=nofile
  setlocal bufhidden=hide
  setlocal noswapfile
endfun
command! -nargs=1 ScratchBuffer :call ScratchBuffer('<args>')

" Sudo-Write for writing to a file I don't have permissions for
" NOTE: Use SudoWrite from vim-eunuch for this now
"command! SudoW w !sudo tee % > /dev/null

" XML Formatting
command! PrettyXML %!xmllint --format -

" Place the cursor where it was when the file was last edited
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" Auto-close Fugitive buffers after we're done with them
autocmd BufReadPost fugitive://* set bufhidden=delete

" Formatting, indentation, etc...
autocmd BufReadCmd *.epub call zip#Browse(expand("<amatch>"))
autocmd BufRead *.md set filetype=markdown
autocmd BufRead *.qml set filetype=qml smartindent
autocmd FileType * setlocal formatoptions-=o
autocmd FileType asciidoc setlocal wrap spell
autocmd FileType help setlocal nospell
autocmd FileType mail setlocal tw=75 formatprg=par\ -w75 cc=76
autocmd FileType make setlocal ts=4 sts=4 sw=4 noexpandtab
autocmd FileType markdown setlocal spell
let g:xml_syntax_folding=1
